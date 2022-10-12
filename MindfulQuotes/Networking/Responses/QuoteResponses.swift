//
//  ViewController.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 08.10.22.
//

import Foundation

// MARK: - Quote data model

/* Creating a quote response model so as
 to parse the model incoming from the api response */
struct QuoteResponse: Codable {
    let data : Quote?
}

struct Quote: Codable {
    let createdAt, id, lang, text: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case id, lang, text
        case updatedAt = "updated_at"
    }
}


