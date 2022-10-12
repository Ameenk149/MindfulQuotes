//
//  ViewController.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 08.10.22.
//
import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

/*
 Defining a protocol for the structures
 to be called for the api call
 */

protocol ApiRequest {
    associatedtype Result
    
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    var queryItems: [String : String] { get }
    
    func decodeJSON(_ data: Data) throws -> Result
}

extension ApiRequest where Result: Decodable {
    func decodeJSON(_ data: Data) throws -> Result {
        let decoder = JSONDecoder()
        return try decoder.decode(Result.self, from: data)
    }
}

extension ApiRequest {
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [:]
    }
}
