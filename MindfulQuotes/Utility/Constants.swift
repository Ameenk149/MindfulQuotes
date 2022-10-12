//
//  ViewController.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 08.10.22.
//

import Foundation

/*
 Creating a constants file to manage
 all the text present in the app
 
 Really useful when to change any text or as to
 localise the output
 */

struct Constants {
    
    enum Language: String {
        case english = "en"
        case french = "fr"
        case dutch = "nl"
    }
    
    struct Network {
       struct URL {
            static let baseUrl = "https://servicegateway.7mind.de/v2"
            static let getQuotePath = "/mindful"
        }
    }
    struct ErrorResponses {
        static let apiError = "It seems there is a problem with the request"
        static let invalidEndpoint = "It seems there is a problem with the endpoint"
        static let invalidResponse = "It seems there is a problem with the response"
        static let noData = "It seems there is a problem with the data"
        static let serializationError = "It seems there is a problem with the serialization"
        static let coderNotImplemented = "init(coder:) has not been implemented"
    }
    struct Views {
        struct Storyboards {
            static let storyboard = "Main"
            static let launchScreen = "launchScreen"
        }
        struct ViewControllers {
            static let quotesViewController = "quotesViewController"
        }
    }
    
        
}
