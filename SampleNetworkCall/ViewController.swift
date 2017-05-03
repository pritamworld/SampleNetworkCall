//
//  ViewController.swift
//  SampleNetworkCall
//
//  Created by Pritesh Patel on 2017-05-01.
//  Copyright © 2017 MoxDroid. All rights reserved.
//
import Foundation
import UIKit
import SwiftyJSON
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //https://api.randomuser.me/
        
        let session   = URLSession.shared
        let urlString = "https://api.randomuser.me/"
        let request   = NSURLRequest(url: NSURL(string: urlString)! as URL)
        let task      = session.dataTask(with: request as URLRequest) { (data, response, error) in
            //let parsedCityObjects = data?.jsonArrayValue.flatMap { return //CityObject.parseFrom($0) }
            //NSLog("\(parsedCityObjects)")
            //print(data)
            NSLog("Success")
            let parsedResult: [String:AnyObject]!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:AnyObject]
            } catch {
                print("Could not parse the data as JSON: '\(data)'")
                return
            }
            
            //print(parsedResult)
            //print("---------------")
            //print(parsedResult["results"])
            let results =  parsedResult["results"] as! [AnyObject]
            //print(result[0]["cell"])
            let r1 = results[0] as! [String:AnyObject]
            print(r1["cell"])
            
        }
        task.resume()
 
 
        //doNetworlCall()
        //doAlamoFireCall()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doBasicNetworkCall(){
        let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")!
        //let imageURL = URL(string: "http://loremflickr.com/cache/images/f512fedb2caf38c32d290f98abfddbac.42.jpg")!
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            print("task finished")
            if error == nil {
                let downloadImage = UIImage(data: data!)
                
                //performUIUpdatesOnMain {
                //    self.imageview.image = downloadImage
                //}
                
                DispatchQueue.main.async {
                    self.imageview.image = downloadImage
                }
            }
        }
        task.resume()

    }

    func doNetworlCall()
    {
        let urlString = URL(string: "http://jsonplaceholder.typicode.com/users/1")
        if let url = urlString
        {
            let task = URLSession.shared.dataTask(with: url)
            { (data, response, error) in
                if error != nil
                {
                    print(error)
                }
                else
                {
                    if data != nil
                    {
                        //print("Bytes : ", usableData) //JSONSerialization
                        NSLog("SUCCESS")
                        //let returnData = String(data: data!, encoding: .utf8)
                        //print(returnData)
                        
                        let json = JSON(data: data!)
                        print(json["id"])
                        print(json["name"])
                        print(json["username"])
                        print(json["email"])
                        
                        let jAddress = json["address"]
                        print(jAddress["street"])
                        print(jAddress["suite"])
                        print(jAddress["city"])
                        print(jAddress["zipcode"])
                        
                        let geo = jAddress["geo"]
                        print(geo["lat"])
                        print(geo["lng"])
                        print(json["phone"])
                        print(json["website"])
                        
                        let company = json["company"]
                        print(company["name"])
                        print(company["catchPhrase"])
                        print(company["bs"])

                    }
                }
            }
            task.resume()
        }
    }
    
    func doAlamoFireCall()
    {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
        
        Alamofire.request("https://httpbin.org/get").validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Automatic Validation Successful")
            case .failure(let error):
                print(error)
            }
        }
        
        
        Alamofire.request("https://httpbin.org/get")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Manual Validation Successful")
                case .failure(let error):
                    print(error)
                }
        }
    }
}

/*
 
 {
 "id": 1,
 "name": "Leanne Graham",
 "username": "Bret",
 "email": "Sincere@april.biz",
 "address": {
 "street": "Kulas Light",
 "suite": "Apt. 556",
 "city": "Gwenborough",
 "zipcode": "92998-3874",
 "geo": {
 "lat": "-37.3159",
 "lng": "81.1496"
 }
 },
 "phone": "1-770-736-8031 x56442",
 "website": "hildegard.org",
 "company": {
 "name": "Romaguera-Crona",
 "catchPhrase": "Multi-layered client-server neural-net",
 "bs": "harness real-time e-markets"
 }
 }
 */


/*
 {
 "results":[
 {
 "gender":"male",
 "name":{
 "title":"mr",
 "first":"julien",
 "last":"laurent"
 },
 "location":{
 "street":"5060 rue de l'abbé-migne",
 "city":"nancy",
 "state":"vendée",
 "postcode":12510
 },
 "email":"julien.laurent@example.com",
 "login":{
 "username":"heavyswan492",
 "password":"flyboy",
 "salt":"arqtLFx5",
 "md5":"c7078c10deedf52c7935341f530ca716",
 "sha1":"c74eda9eeccc0e816532274db3da65636652af72",
 "sha256":"28fbb8e208e0517620d966558fc27a3540eb8715c530abde1feb8742ec46fb3f"
 },
 "dob":"1953-08-07 09:07:36",
 "registered":"2006-02-17 17:23:30",
 "phone":"01-64-13-02-95",
 "cell":"06-44-48-52-47",
 "id":{
 "name":"INSEE",
 "value":"153705673945 52"
 },
 "picture":{
 "large":"https://randomuser.me/api/portraits/men/82.jpg",
 "medium":"https://randomuser.me/api/portraits/med/men/82.jpg",
 "thumbnail":"https://randomuser.me/api/portraits/thumb/men/82.jpg"
 },
 "nat":"FR"
 }
 ],
 "info":{
 "seed":"d9e38be914238c3f",
 "results":1,
 "page":1,
 "version":"1.1"
 }
 }
 
 */
