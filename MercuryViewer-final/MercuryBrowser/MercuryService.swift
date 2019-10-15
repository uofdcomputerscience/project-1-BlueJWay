//
//  MercuryService.swift
//  MercuryBrowser
//
//  Created by Russell Mirabelli on 9/29/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import Foundation
struct MercuryItems: Decodable{
    let mercury: [MercuryItem]
}



struct MercuryService {
    func getInfo(theUrl: String, completion: @escaping(([MercuryItem]) -> Void)) {
        var mercuryItems: MercuryItems = MercuryItems(mercury: [])
        let urlString = theUrl
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .ephemeral)
            let task = session.dataTask(with: request) { (data, response, error) in
                mercuryItems = try! JSONDecoder().decode(MercuryItems.self, from: data!)
                completion(mercuryItems.mercury)
            }
            task.resume()
        }
        
    }
    init(){
        
    }
}
