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
    
    init(name: String, type: String, url: String){
        self.name = name
        self.type = type
        self.url = url
    }
    //var imageURL: URL {
    //    return URL(string: url)!
    //}
}
