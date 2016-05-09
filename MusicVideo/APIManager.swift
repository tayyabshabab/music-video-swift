//
//  APIManager.swift
//  MusicVideo
//
//  Created by Tayyab Shabab on 08/05/16.
//  Copyright © 2016 Tayyab Shabab. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: (result:String) -> Void) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)
        
        let task = session.dataTaskWithURL(url!) { (data, response, error) in
            
            dispatch_async(dispatch_get_main_queue(), {
                if error != nil {
                    
                    completion(result: (error!.localizedDescription))
                    
                } else {
                    
                    // Added for JSONSerialization
                    do {
                        
                        if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String: AnyObject] {
                            
                            print(json)
                            
                            let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                                dispatch_async(dispatch_get_main_queue(), {
                                    completion(result: "JSONSerialization Successful")
                                })
                            }
                            
                        }
                        
                    } catch {
                        dispatch_async(dispatch_get_main_queue(), {
                            completion(result: "error in NSJSONSerialization")
                        })
                    }
                    
                }
            })
            
        }
        task.resume()
        
    }
    
}