//
//  NetworkRequest.swift
//  JobSeek
//
//  Created by Modhawadiya Jay on 25/05/22.
//

import Foundation

class NetworkRequest {
    
    static func call<T: Decodable>(_ url: String, _ method: String, _ user: UserLogIn, _ responseModel: T.Type, completion: @escaping (Result<T, ErrorResponse>) -> Void) {
        if let url = URL(string: url) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let err {
                failure(error: err.localizedDescription)
            }
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let dataResponse = data, error == nil else {
                    failure(error: error?.localizedDescription ?? "Error response")
                    return
                }
                do{
                    guard let httpUrlResponse = response as? HTTPURLResponse else {
                        failure(error: "No Url response")
                        return
                    }
                    let decoder = JSONDecoder()
                    if (httpUrlResponse.statusCode > 399) {
                        let error = try decoder.decode(ErrorResponse.self, from: dataResponse)
                        failure(error: error.error)
                    }
                    
                    let userResponse = try decoder.decode(T.self, from: dataResponse)
                    success(data: userResponse)
                } catch let parsingError {
                    failure(error: parsingError.localizedDescription)
                }
            }
            task.resume()
        }
        func success(data: T) {
            completion(.success(data))
        }
        
        func failure(error: String) {
            completion(.failure(ErrorResponse(error: error)))
        }
    }
}
