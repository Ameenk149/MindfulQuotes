//
//  QuotesVModel.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 11.10.22.
//

import Foundation


/*
 Creating view model so as to get only the
 things needed to show
 */
struct QuotesVModel
{
    var text: String
    
    init(text: String) {
        self.text = text
    }
}
