//
//  MercuryService.swift
//  MercuryBrowser
//
//  Created by Russell Mirabelli on 9/29/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import Foundation
struct MercuryItems: Decodable{
    let mercury: [Dictionary<String, String>]
}


func getInfo(theUrl: String) -> [MercuryItem] {
    var mercuryItems: [MercuryItem] = []
    let urlString = theUrl
    if let url = URL(string: urlString) {
        let request = URLRequest(url: url)
        let session = URLSession(configuration: .ephemeral)
        let task = session.dataTask(with: request) { (data, response, error) in
            let itemsExtract = try! JSONDecoder().decode(MercuryItems.self, from: data!)
            //print(wordsExtract.words.count)
            //var firstList = [String]()
            var types: [String] = []
            var names: [String] = []
            var urls: [String] = []
            for item in itemsExtract.mercury{
                names.append(item["name"]!)
                types.append(item["type"]!)
                urls.append(item["url"]!)
            }
            
            
            var nextItem: MercuryItem
            for i in 1...7{
                nextItem = MercuryItem(n: names[i], t: types[i], u: urls[i])
                mercuryItems.append(nextItem)
            }
            //completion(mercuryItems)
            
        }
        task.resume()
        
        
    }
    return mercuryItems
    
}
struct MercuryService {
    let mercuryList: [MercuryItem] = getInfo(theUrl: "https://raw.githubusercontent.com/rmirabelli/mercuryserver/master/mercury.json")
}
