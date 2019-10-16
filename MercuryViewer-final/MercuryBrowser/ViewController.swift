//
//  ViewController.swift
//  MercuryBrowser
//
//  Created by Russell Mirabelli on 9/29/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var service: MercuryService = MercuryService()
    var items: [MercuryItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        service.getInfo(theUrl: "https://raw.githubusercontent.com/rmirabelli/mercuryserver/master/mercury.json") {
            items in self.items = items
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
            
        }
        tableView.dataSource = self
        
    }
    
}

extension ViewController: UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let index = items[indexPath.item]
    let cell = tableView.dequeueReusableCell(withIdentifier: "MercuryCell")!
    if let mercuryCell = cell as? MercuryCell {
        mercuryCell.nameLabel.text = "\(index.name)"
        mercuryCell.typeLabel.text = "\(index.type)"
        let session = URLSession(configuration: .ephemeral)
        let task = session.dataTask(with: URL(string: index.url)!) { (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    
                    mercuryCell.mercuryImage.image = image
                        
            }
        }
            
        }
    
    task.resume()
    }
    return cell

    }
    
    
    
}

