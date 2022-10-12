//
//  ViewController.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 08.10.22.
//

import Foundation

typealias URLResponse = Result<(data: Data, response: HTTPURLResponse), Error>

protocol APIClientProtocol {
    func dataTask(_ request: URLRequest,completion: @escaping (URLResponse) -> Void)
}

final class APIClientURLSession: APIClientProtocol {
    
    // Using URLSession to hit the api and fetch data
    func dataTask(_ urlRequest: URLRequest, completion: @escaping (URLResponse) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
           if let error = error {
               return completion(.failure(error))
           }
           
           guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
               return completion(.failure(NSError()))
           }
           
           guard let data = data else {
               return completion(.failure(NSError()))
           }
        
          completion(.success((data,response)))
            
        }
       .resume()
    }
}
