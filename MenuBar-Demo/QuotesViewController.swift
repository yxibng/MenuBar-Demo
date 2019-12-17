//
//  QuotesViewController.swift
//  MenuBar-Demo
//
//  Created by yxibng on 2019/12/17.
//  Copyright © 2019 yxibng. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {

    @IBOutlet weak var textLabel: NSTextField!
    
    let quotes = Quote.all
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuoteIndex = 0
        // Do view setup here.
    }
    
    func updateQuote() {
        textLabel.stringValue = String(describing: quotes[currentQuoteIndex])
    }
    
}


extension QuotesViewController {
    
    static func freshController() -> QuotesViewController {
        let storyBoard = NSStoryboard.init(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateController(withIdentifier: "QuotesViewController") as? QuotesViewController else {
            fatalError("why cant i find QuotesViewController? check Main.storyboard")
        }
        return viewController
    }
    
    @IBAction func previous(_ sender: Any) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    
    @IBAction func next(_ sender: Any) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(_ sender: Any) {
        NSApplication.shared.terminate(sender)
    }
    
    
}
