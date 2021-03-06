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
   Implementation of FileDescriptor bean.

   @author Carlos Lozano Diez
   @since 1.0
   @version 1.0
*/
public class FileDescriptor : APIBean {

    var dateCreated : Int64?
    var dateModified : Int64?
    var name : String?
    var path : String?
    var pathAbsolute : String?
    var size : Int64?

    /**
       Default constructor.
    */
    public override init() {
        super.init()
    }

    /**
       Returns the milliseconds passed since 1/1/1970 since the file was created.

       @return Timestamp in milliseconds.
       @since v2.0
    */
    public func getDateCreated() -> Int64? {
        return self.dateCreated
    }

    /**
       Sets the creation timestamp in milliseconds. Used internally.

       @param dateCreated Timestamp of file creation or -1 if the file or folder doesn't exist.
    */
    public func setDateCreated(dateCreated: Int64) {
        self.dateCreated = dateCreated
    }

    /**
       Returns the milliseconds passed since 1/1/1970 since the file was modified.

       @return Timestamp in milliseconds.
       @since v2.0
    */
    public func getDateModified() -> Int64? {
        return self.dateModified
    }

    /**
       Sets the file or folder modification timestamp in milliseconds. Used internally.

       @param dateModified Timestamp of file modification or -1 if the file or folder doesn't exist.
    */
    public func setDateModified(dateModified: Int64) {
        self.dateModified = dateModified
    }

    /**
       Returns the name of the file if the reference is a file or the last path element of the folder.

       @return The name of the file.
       @since v2.0
    */
    public func getName() -> String? {
        return self.name
    }

    /**
       Sets the name of the file. Used internally.

       @param name Name of the file or last folder path element.
    */
    public func setName(name: String) {
        self.name = name
    }

    /**
       Returns the path element of the file or folder (excluding the last path element if it's a directory).

       @return The path to the file.
       @since v2.0
    */
    public func getPath() -> String? {
        return self.path
    }

    /**
       Sets the path of the file or folder. Used internally.

       @param path The path element of the file or folder.
    */
    public func setPath(path: String) {
        self.path = path
    }

    /**
       Returns the resolved absolute path elements of the file and/or folders (including the last path element).

       @return The absolute path to the file.
       @since v2.0
    */
    public func getPathAbsolute() -> String? {
        return self.pathAbsolute
    }

    /**
       Sets the absolute path of the file or folder. Used internally.

       @param pathAbsolute String with the absolute path of file or folder.
    */
    public func setPathAbsolute(pathAbsolute: String) {
        self.pathAbsolute = pathAbsolute
    }

    /**
       Returns the size in bytes of the file or -1 if the reference is a folder.

       @return Size in bytes of file.
       @since v2.0
    */
    public func getSize() -> Int64? {
        return self.size
    }

    /**
       Sets the file size in bytes of the file. If the file is a folder, this will be 0. If the file
doesn't exist, this will be -1. Used internally.

       @param size The size in bytes of the file.
    */
    public func setSize(size: Int64) {
        self.size = size
    }


    /**
       JSON Serialization and deserialization support.
    */
    public struct Serializer {
        public static func fromJSON(json : String) -> FileDescriptor {
            let data:NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
            let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            return fromDictionary(dict!)
        }

        static func fromDictionary(dict : NSDictionary) -> FileDescriptor {
            let resultObject : FileDescriptor = FileDescriptor()

            if let value : AnyObject = dict.objectForKey("dateCreated") {
                if "\(value)" as NSString != "<null>" {
                    let numValue = value as? NSNumber
                    resultObject.dateCreated = numValue?.longLongValue
                }
            }

            if let value : AnyObject = dict.objectForKey("dateModified") {
                if "\(value)" as NSString != "<null>" {
                    let numValue = value as? NSNumber
                    resultObject.dateModified = numValue?.longLongValue
                }
            }

            if let value : AnyObject = dict.objectForKey("name") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.name = (value as! String)
                }
            }

            if let value : AnyObject = dict.objectForKey("path") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.path = (value as! String)
                }
            }

            if let value : AnyObject = dict.objectForKey("pathAbsolute") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.pathAbsolute = (value as! String)
                }
            }

            if let value : AnyObject = dict.objectForKey("size") {
                if "\(value)" as NSString != "<null>" {
                    let numValue = value as? NSNumber
                    resultObject.size = numValue?.longLongValue
                }
            }

            return resultObject
        }

        public static func toJSON(object: FileDescriptor) -> String {
            let jsonString : NSMutableString = NSMutableString()
            // Start Object to JSON
            jsonString.appendString("{ ")

            // Fields.
            object.dateCreated != nil ? jsonString.appendString("\"dateCreated\": \(object.dateCreated!), ") : jsonString.appendString("\"dateCreated\": null, ")
            object.dateModified != nil ? jsonString.appendString("\"dateModified\": \(object.dateModified!), ") : jsonString.appendString("\"dateModified\": null, ")
            object.name != nil ? jsonString.appendString("\"name\": \"\(JSONUtil.escapeString(object.name!))\", ") : jsonString.appendString("\"name\": null, ")
            object.path != nil ? jsonString.appendString("\"path\": \"\(JSONUtil.escapeString(object.path!))\", ") : jsonString.appendString("\"path\": null, ")
            object.pathAbsolute != nil ? jsonString.appendString("\"pathAbsolute\": \"\(JSONUtil.escapeString(object.pathAbsolute!))\", ") : jsonString.appendString("\"pathAbsolute\": null, ")
            object.size != nil ? jsonString.appendString("\"size\": \(object.size!)") : jsonString.appendString("\"size\": null")

            // End Object to JSON
            jsonString.appendString(" }")
            return jsonString as String
        }
    }
}

/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
