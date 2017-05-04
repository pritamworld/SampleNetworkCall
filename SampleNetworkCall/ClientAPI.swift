//
//  ClientAPI.swift
//  SampleNetworkCall
//
//  Created by Pritesh Patel on 2017-05-04.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import Foundation
import UIKit
//: Playground - noun: a place where people can play

// From That Thing in Swift
// https://thatthinginswift.com


class ClientAPI {
    
    func login(email: String, password: String, completion: @escaping (_ success: Bool, _ message: String?) -> ()) {
        let loginObject = ["email": email, "password": password]
        
        post(request: clientURLRequest(path: "auth/local", params: loginObject as Dictionary<String, AnyObject>?)) { (success, object) -> () in
            
            DispatchQueue.main.async{
                if success {
                    completion(true, nil)
                } else {
                    var message = "there was an error"
                    if let object = object, let passedMessage = object["message"] as? String {
                        message = passedMessage
                    }
                    completion(true, message)
                }
            }
        }
    }
    
    func getData(completion: @escaping (_ success: Bool, _ message: AnyObject) -> ()) {
    
        get(request: clientURLRequest(path: "get", params: nil)) { (success, object) -> () in
            
            DispatchQueue.main.async{
                if success {
                    completion(true, object!)
                } else {
                    //var message = "there was an error"
                    //if let object = object, let passedMessage = object["message"] as? String {
                    //    message = passedMessage
                    }
                    completion(false, NSNull())
                }
            }
        }
    }

    
    // MARK: private composition methods
    
    private func post(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", completion: completion)
    }
    
    private func put(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", completion: completion)
    }
    
    private func get(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "GET", completion: completion)
    }
    
    private func dataTask(request: NSMutableURLRequest, method: String, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        request.httpMethod = method
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject?)
                } else {
                    completion(false, json as AnyObject?)
                }
            }
            }.resume()
    }
    
    private func clientURLRequest(path: String, params: Dictionary<String, AnyObject>? = nil) -> NSMutableURLRequest {
        let request = NSMutableURLRequest(url: NSURL(string: "https://httpbin.org/"+path)! as URL)
        /*
        if let params = params {
            var paramString = ""
            for (key, value) in params {
                let escapedKey = NSString(data: key as! Data, encoding: String.Encoding.utf8.rawValue)
                let escapedValue = NSString(data: value as! Data, encoding: String.Encoding.utf8.rawValue)
                paramString += "\(escapedKey)=\(escapedValue)&,"
            }
 
            
            //request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            //request.httpBody = paramString.data(using: String.Encoding.utf8)
        }
 */
        
        return request
    }




