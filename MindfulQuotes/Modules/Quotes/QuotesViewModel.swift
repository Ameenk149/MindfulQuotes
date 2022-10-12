//
//  QuotesViewModel.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 11.10.22.
//

import Foundation

/* Creating a protocol to define functions to be used in QuotesViewController*/
protocol QuotesViewModelProtocol: AnyObject {
    var quotesViewModel : QuotesVModel? { get }
    var success: (() -> Void)? { set get }
    var failure: ((Error) -> Void)? { set get }
    func getQuotes(language: String)
}

/* Creating a final class to let it be the last class
so as no to to be inherited by any else

Creating functions so as to get only the data needed to show, minus-ing all other data
 */
final class QuotesViewModel: QuotesViewModelProtocol {
    
    //Initialising variables
    private let apiService: ApiService

    var quotesViewModel: QuotesVModel?
    var success: (() -> Void)?
    var failure: ((Error) -> Void)?
    
    init(apiService: ApiService) {
        self.apiService = apiService
    }
    
    //Calls the api of the quotes  and returns the response of the request.
    func getQuotes(language: String) {
        let request = GetQuoteAPI(language: language)
        apiService.request(request) { [weak self] result in
            switch result {
            case .success(let quote):
                self?.handleSuccessResponse(quote: quote)
            case .failure(let error):
                self?.failure?(error)
            }
        }
    }
   
    //Handles the success response of the get quote 
    func handleSuccessResponse(quote: QuoteResponse) {
        guard let text = quote.data?.text else { return }
        let viewModel = QuotesVModel(text: text)
        quotesViewModel = viewModel
        success?()
    }
    
}
