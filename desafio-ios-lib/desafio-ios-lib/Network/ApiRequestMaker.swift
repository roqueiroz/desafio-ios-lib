//
//  ApiRequestMaker.swift
//  desafio-ios-lib
//
//  Created by Rodrigo Gonçalves de Queiroz on 22/10/22.
//

import Foundation

final internal class ApiRequestMaker {
   
    static public var shared = ApiRequestMaker()
    
    public func request<T: Decodable>(from endpoint: URL, method: HttpMethod, data: Data?, type: T.Type, completion: @escaping completionCallback<T>) throws {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60.0
        
        var request = URLRequest(url: endpoint)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = data
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                
                guard let httpResponse = response  as? HTTPURLResponse else { return }
                
                if httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 {
                    
                    do {
                        
                        guard let jsonData = data else {
                            completion(nil, .decodingFailed(error: "Empty data"))
                            return
                        }
                        
                        let dataType = try JSONDecoder().decode(T.self, from: jsonData)
                        
                        completion(dataType, nil)
                        
                    } catch {
                        completion(nil, .genericError(error: "Generic Error"))
                    }
                    
                }
            }
            
        }.resume()
    }

}

typealias completionCallback<T: Decodable> = (_ result: T?, _ failure: Error?) -> Void

extension ApiRequestMaker {
    
    enum HttpMethod: String {
        case PUT
        case POST
        case GET
        case DELETE
    }
    
}


