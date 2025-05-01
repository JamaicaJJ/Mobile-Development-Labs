
import UIKit

@MainActor
class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var filterSegmentedControl: UISegmentedControl!

    let storeItemController = StoreItemController()
    var items = [StoreItem]()

    
    let queryOptions = ["movie", "music", "software", "ebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchMatchingItems() {
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            let query: [String: String] = [
                "term": searchTerm,
                "media": mediaType,
                "limit": "20",
                "lang": "en_us"
            ]
            
            Task {
                do {
                    let fetchedItems = try await storeItemController.fetchItems(matching: query)
                    self.items = fetchedItems
                    tableView.reloadData()
                } catch {
                    print("Failed to fetch items: \(error)")
                }
            }
        }
    }
        
        
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let item = items[indexPath.row]

        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.artist
        cell.imageView?.image = UIImage(systemName: "photo") 

        

        imageLoadTasks[indexPath] = Task {
            let url = item.artworkURL
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    await MainActor.run {
                        if let currentCell = tableView.cellForRow(at: indexPath) {
                            currentCell.imageView?.image = image
                            currentCell.setNeedsLayout()
                        }
                    }
                }
            } catch {
            }

            imageLoadTasks[indexPath] = nil
        }
    }

        
        
        
        
        @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
            
            fetchMatchingItems()
        }
        
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return items.count
        }
    
    var imageLoadTasks: [IndexPath: Task<Void, Never>] = [:]

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }

        cell.name = item.name
        cell.artist = item.artist
        cell.artworkImage = nil


        imageLoadTasks[indexPath]?.cancel()

        let url = item.artworkURL
        imageLoadTasks[indexPath] = Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let image = UIImage(data: data) {
                    await MainActor.run {
                        cell.artworkImage = image
//                        if let visibleCell = tableView.cellForRow(at: indexPath) as? ItemCell {
//                            visibleCell.artworkImage = image
//                            visibleCell.setNeedsLayout()
//                        }
                    }
                }
            } catch {
                print("Image fetch failed for \(url): \(error)")
            }
            imageLoadTasks[indexPath] = nil
        }

        return cell
    }

        
        // MARK: - Table view delegate
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            imageLoadTasks[indexPath]?.cancel()
            imageLoadTasks[indexPath] = nil

        }
    }
    
    extension StoreItemListTableViewController: UISearchBarDelegate {
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
            fetchMatchingItems()
            searchBar.resignFirstResponder()
        }
    }
    
