//
//  File.swift
//  MercuryBrowser
//
//  Created by Russell Mirabelli on 9/29/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import Foundation

struct MercuryItem: Codable {
    var name: String
    var type: String
    var url: String
    
    init(n: String, t: String, u: String){
        self.name = n
        self.type = t
        self.url = u
    }
}
