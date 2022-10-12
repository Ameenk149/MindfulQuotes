//
//  ViewController.swift
//  MindfulQuotes
//
//  Created by Muhammad Ameen Qadri on 08.10.22.
//

import UIKit

class QuotesViewController: UIViewController {

 // MARK: - Variables
    //Initialises variable which includes UI Elements as well as variables needed to compute
    var viewModel: QuotesViewModelProtocol
    let apiService: ApiService = DefaultNetworkService()
    
    /* Language variable to get control of the language parameter to get quotes
       It also has a didSet, so that when we change the variable of the language to some other,
       variable it will automatically trigger getQuote api to fetch new data with the selected language
     */
    var language: Constants.Language = .english {
        didSet {
            self.viewModel.getQuotes(language: self.language.rawValue)
        }
    }
   
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var quoteButton: UIButton!
    
 // MARK: - Initialisers
    /* Initialising quotes view controller with a init so that we can initialise viewModel */
    init?(viewModel: QuotesViewModelProtocol, coder: NSCoder) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.ErrorResponses.coderNotImplemented)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.getQuotes(language: language.rawValue)
        bindings()
    }
    
// MARK: - IB functions for the functionality
   /* Segmented Control's action */
    @IBAction func languageSegmentedControlValueDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: language = .english
            case 1: language = .french
            case 2: language = .dutch
        default:
            break
        }
    }
    
    /* Get Quote button's action function for the UI */
    @IBAction func quoteButtonDidPress(_ sender: Any) {
        viewModel.getQuotes(language: language.rawValue)
    }
    
// MARK: - Mutating functions for the functionality
    /* Separate function for the UI */
    private func setupUI(){
        quote.adjustsFontSizeToFitWidth = true
        quote.minimumScaleFactor = 0.5
        quote.numberOfLines = 0
        quoteButton.tintColor = .black
    }
    
    /* Binding function connects to the view model function of success and failure
     it binds to receive data from the view model getQuote
     */
    private func bindings() {
        viewModel.success = { [weak self] in
            DispatchQueue.main.async {
                self?.quote.text = self?.viewModel.quotesViewModel?.text
            }
         }
        viewModel.failure = { error in
            print(error)
        }
    }
}
