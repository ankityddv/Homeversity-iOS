//
//  MyDataProvider.swift
//  HCI
//
//  Created by Ankit on 21/09/20.
//

import Foundation

class MyDataProvider {
    
    static func getRandomString() -> String {
        let strings = [
            "LMAO",
            "NIGGA",
            "FUCK OFF",
        ]
        return strings.randomElement()!
    }
    
}
