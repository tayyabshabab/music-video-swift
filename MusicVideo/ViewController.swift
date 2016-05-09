//
//  ViewController.swift
//  MusicVideo
//
//  Created by Tayyab Shabab on 08/05/16.
//  Copyright © 2016 Tayyab Shabab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json",
                     completion: didLoadData)
    }
    
    func didLoadData(result:String) {
        
        print(result)
        
    }


}

