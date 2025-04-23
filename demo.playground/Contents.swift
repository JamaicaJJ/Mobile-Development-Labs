import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution =  true

var urlComponents = URLComponents( string: "https://api.nasa.gov/planetary/apod")!

urlComponents.queryItems = [
    "api_Key": "DEMO_KEY",
    "date": "2020-01-01"
].map { URLQueryItem(name: $0.key, value: $0.value) }

let url = urlComponents.url!

Task {
    let (data, response) = try await URLSession.shared.data(from: url)
    
    if let httpResponse = response as? HTTPURLResponse,
       httpResponse.statusCode == 200 ,
       let dataString = String(data: data , encoding: .utf8)
    {
        print(dataString)
    }
}
