/* 
Copyright (c) 2017 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

import Foundation
 
/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public class Parties {
	public var objectId : String?
	public var icon : String?
	public var logo : String?
	public var title : String?
	public var startDate : String?
	public var endDate : String?
	public var details : String?
	public var address1 : String?
	public var address2 : String?
	public var address3 : String?
	public var latitude : Double?
	public var longitude : Double?
	public var url : String?
	public var promoted : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let parties_list = Parties.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of Parties Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [Parties]
    {
        var models:[Parties] = []
        for item in array
        {
            models.append(Parties(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let parties = Parties(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: Parties Instance.
*/
	required public init?(dictionary: NSDictionary) {

		objectId = dictionary["objectId"] as? String
		icon = dictionary["icon"] as? String
		logo = dictionary["logo"] as? String
		title = dictionary["title"] as? String
		startDate = dictionary["startDate"] as? String
		endDate = dictionary["endDate"] as? String
		details = dictionary["details"] as? String
		address1 = dictionary["address1"] as? String
		address2 = dictionary["address2"] as? String
		address3 = dictionary["address3"] as? String
		latitude = dictionary["latitude"] as? Double
		longitude = dictionary["longitude"] as? Double
		url = dictionary["url"] as? String
		promoted = dictionary["promoted"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.objectId, forKey: "objectId")
		dictionary.setValue(self.icon, forKey: "icon")
		dictionary.setValue(self.logo, forKey: "logo")
		dictionary.setValue(self.title, forKey: "title")
		dictionary.setValue(self.startDate, forKey: "startDate")
		dictionary.setValue(self.endDate, forKey: "endDate")
		dictionary.setValue(self.details, forKey: "details")
		dictionary.setValue(self.address1, forKey: "address1")
		dictionary.setValue(self.address2, forKey: "address2")
		dictionary.setValue(self.address3, forKey: "address3")
		dictionary.setValue(self.latitude, forKey: "latitude")
		dictionary.setValue(self.longitude, forKey: "longitude")
		dictionary.setValue(self.url, forKey: "url")
		dictionary.setValue(self.promoted, forKey: "promoted")

		return dictionary
	}

}