/**
--| ADAPTIVE RUNTIME PLATFORM |----------------------------------------------------------------------------------------

(C) Copyright 2013-2015 Carlos Lozano Diez t/a Adaptive.me <http://adaptive.me>.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the
License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 . Unless required by appli-
-cable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,  WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the  License  for the specific language governing
permissions and limitations under the License.

Original author:

    * Carlos Lozano Diez
            <http://github.com/carloslozano>
            <http://twitter.com/adaptivecoder>
            <mailto:carlos@adaptive.me>

Contributors:

    * Ferran Vila Conesa
             <http://github.com/fnva>
             <http://twitter.com/ferran_vila>
             <mailto:ferran.vila.conesa@gmail.com>

    * See source code files for contributors.

Release:

    * @version v2.2.15

-------------------------------------------| aut inveniam viam aut faciam |--------------------------------------------
*/

import Foundation

/**
   Structure representing the assigned tags data elements of a contact.

   @author Francisco Javier Martin Bueno
   @since v2.0
   @version 1.0
*/
public class ContactTag : APIBean {

    /**
       The tagName of the Tag
    */
    var tagName : String?
    /**
       The tagValue of the Tag
    */
    var tagValue : String?

    /**
       Default constructor

       @since v2.0
    */
    public override init() {
        super.init()
    }

    /**
       Constructor used by the implementation

       @param tagValue Value of the tag
       @param tagName  Name of the tag
       @since v2.0
    */
    public init(tagName: String, tagValue: String) {
        super.init()
        self.tagName = tagName
        self.tagValue = tagValue
    }

    /**
       Returns the tagName of the Tag

       @return tagName
       @since v2.0
    */
    public func getTagName() -> String? {
        return self.tagName
    }

    /**
       Set the tagName of the Tag

       @param tagName Name of the tag
       @since v2.0
    */
    public func setTagName(tagName: String) {
        self.tagName = tagName
    }

    /**
       Returns the tagValue of the Tag

       @return tagValue
       @since v2.0
    */
    public func getTagValue() -> String? {
        return self.tagValue
    }

    /**
       Set the tagValue of the Tag

       @param tagValue Value of the tag
       @since v2.0
    */
    public func setTagValue(tagValue: String) {
        self.tagValue = tagValue
    }


    /**
       JSON Serialization and deserialization support.
    */
    public struct Serializer {
        public static func fromJSON(json : String) -> ContactTag {
            let data:NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
            let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            return fromDictionary(dict!)
        }

        static func fromDictionary(dict : NSDictionary) -> ContactTag {
            let resultObject : ContactTag = ContactTag()

            if let value : AnyObject = dict.objectForKey("tagName") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.tagName = (value as! String)
                }
            }

            if let value : AnyObject = dict.objectForKey("tagValue") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.tagValue = (value as! String)
                }
            }

            return resultObject
        }

        public static func toJSON(object: ContactTag) -> String {
            let jsonString : NSMutableString = NSMutableString()
            // Start Object to JSON
            jsonString.appendString("{ ")

            // Fields.
            object.tagName != nil ? jsonString.appendString("\"tagName\": \"\(JSONUtil.escapeString(object.tagName!))\", ") : jsonString.appendString("\"tagName\": null, ")
            object.tagValue != nil ? jsonString.appendString("\"tagValue\": \"\(JSONUtil.escapeString(object.tagValue!))\"") : jsonString.appendString("\"tagValue\": null")

            // End Object to JSON
            jsonString.appendString(" }")
            return jsonString as String
        }
    }
}

/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
