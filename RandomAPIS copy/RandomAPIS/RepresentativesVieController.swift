//
//  RepresentativesVieController.swift
//  RandomAPIS
//
//  Created by David Santiago Jamaica Galvis on 4/29/25.
//

import UIKit

struct RepresentativeResponse: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    let name: String
    let party: String
    let link: String
    let state: String
}
class RepresentativesViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
        
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var representatives: [Representative] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
    }
   
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let zip = searchBar.text, !zip.isEmpty else { return }
        print("ZIP entered:", zip)
        fetchRepresentatives(for: zip)
        searchBar.resignFirstResponder()
    }



    func fetchRepresentatives(for zip: String) {
        let urlString = "https://whoismyrepresentative.com/getall_mems.php?zip=\(zip)&output=json"
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(RepresentativeResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.representatives = response.results
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Decoding error:", error)
                }
            }
        }
        task.resume()
    }

    // MARK: - TableView DataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepCell", for: indexPath) as! RepresentativesCell
        let rep = representatives[indexPath.row]
        cell.update(with: rep)
        return cell
    }
}

