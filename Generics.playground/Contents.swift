import UIKit



protocol APIPequest {
    associatedtype Response
    var urlRequest: URLRequest {get }
    func decodeResponse(data: Data) throws -> Respose
}

enum APIRicquestError: Error {
    case itemNotFOund
}

func sendRequest <Request: APIPequest>(_ request:Resquest) async throws -> Request.Response {
}


 



