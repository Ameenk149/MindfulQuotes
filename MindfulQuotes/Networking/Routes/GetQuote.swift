//
//  QuotesViewModel.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 11.10.22.
//
import Foundation

/*
 Creating a structure of a api request
 then it can be used to call the api
 */

struct GetQuoteAPI: ApiRequest {

    /*
     Defining things which are needed for the request
     - language:- to select in which you want your data
     - queryItems:- the params which will go with the url
     - method:- defining get or post method
     - headers:- defining the additional headers for sending the request in appropriate format
     - decodeJSON:- a function to define how to parse the incoming data from the api
     */
    
    var language: String
    var queryItems: [String : String] { [ "lang": language ] }
    var method: HTTPMethod { .get }
    var headers: [String : String] = ["Content-Type": "application/json"]
    
    var url: String {
        let baseURL: String = Constants.Network.URL.baseUrl
        let path: String = Constants.Network.URL.getQuotePath
        return baseURL + path
    }
    
    func decodeJSON(_ data: Data) throws -> QuoteResponse {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .useDefaultKeys
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let response = try decoder.decode(QuoteResponse.self, from: data)
        return response
    }
}
