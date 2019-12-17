//
//  Quote.swift
//  MenuBar-Demo
//
//  Created by yxibng on 2019/12/17.
//  Copyright © 2019 yxibng. All rights reserved.
//

import Foundation

struct Quote {
    
    let text: String
    let author: String
    static let all: [Quote] = [
        Quote.init(text: "Never put off until tomorrow what you can do the day after tomorrow.", author: "Mark Twain"),
        Quote.init(text: "Efficiency is doing better what is already being done.", author: "Peter Drucker"),
        Quote.init(text: "To infinity and beyond!", author: "Buzz Lightyear"),
        Quote.init(text: "May the Force be with you.", author: "Han Solo"),
        Quote.init(text: "Simplicity is the ultimate sophistication", author: "Leonardo da Vinci"),
        Quote.init(text: "It’s not just what it looks like and feels like. Design is how it works.", author: "Steve Jobs")
    ]
}


extension Quote: CustomStringConvertible {
    var description: String {
        return "\(text) \n- \(author)"
    }
}
