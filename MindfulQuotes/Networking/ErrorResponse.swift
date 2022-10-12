//
//  ViewController.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 08.10.22.
//

import Foundation

/*
 Defining errors and there types so
 as to handle them easily with a human readable error
 description
 */

enum ErrorResponse: String {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    public var description: String {
        switch self {
        case .apiError: return Constants.ErrorResponses.apiError
        case .invalidEndpoint: return Constants.ErrorResponses.invalidEndpoint
        case .invalidResponse: return Constants.ErrorResponses.invalidResponse
        case .noData: return Constants.ErrorResponses.noData
        case .serializationError: return Constants.ErrorResponses.serializationError
        }
    }
}
