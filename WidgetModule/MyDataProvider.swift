//
//  MyDataProvider.swift
//  HCI
//
//  Created by Ankit on 21/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

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
