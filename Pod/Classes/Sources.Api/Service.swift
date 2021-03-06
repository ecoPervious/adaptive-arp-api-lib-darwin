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
   Represents an instance of a service.

   @author Aryslan
   @since v2.0
   @version 1.0
*/
public class Service : APIBean {

    /**
       The service name
    */
    var name : String?
    /**
       Endpoint of the service
    */
    var serviceEndpoints : [ServiceEndpoint]?

    /**
       Default constructor

       @since v2.0
    */
    public override init() {
        super.init()
    }

    /**
       Constructor used by the implementation

       @param serviceEndpoints Endpoints of the service
       @param name             Name of the service
       @since v2.0.6
    */
    public init(serviceEndpoints: [ServiceEndpoint], name: String) {
        super.init()
        self.serviceEndpoints = serviceEndpoints
        self.name = name
    }

    /**
       Returns the name

       @return name
       @since v2.0
    */
    public func getName() -> String? {
        return self.name
    }

    /**
       Set the name

       @param name Name of the service
       @since v2.0
    */
    public func setName(name: String) {
        self.name = name
    }

    /**
       Returns the serviceEndpoints

       @return serviceEndpoints
       @since v2.0
    */
    public func getServiceEndpoints() -> [ServiceEndpoint]? {
        return self.serviceEndpoints
    }

    /**
       Set the serviceEndpoints

       @param serviceEndpoints Endpoint of the service
       @since v2.0
    */
    public func setServiceEndpoints(serviceEndpoints: [ServiceEndpoint]) {
        self.serviceEndpoints = serviceEndpoints
    }


    /**
       JSON Serialization and deserialization support.
    */
    public struct Serializer {
        public static func fromJSON(json : String) -> Service {
            let data:NSData = json.dataUsingEncoding(NSUTF8StringEncoding)!
            let dict = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            return fromDictionary(dict!)
        }

        static func fromDictionary(dict : NSDictionary) -> Service {
            let resultObject : Service = Service()

            if let value : AnyObject = dict.objectForKey("name") {
                if "\(value)" as NSString != "<null>" {
                    resultObject.name = (value as! String)
                }
            }

            if let value : AnyObject = dict.objectForKey("serviceEndpoints") {
                if "\(value)" as NSString != "<null>" {
                    var serviceEndpoints : [ServiceEndpoint] = [ServiceEndpoint]()
                    for (var i = 0;i < (value as! NSArray).count ; i++) {
                        serviceEndpoints.append(ServiceEndpoint.Serializer.fromDictionary((value as! NSArray)[i] as! NSDictionary))
                    }
                    resultObject.serviceEndpoints = serviceEndpoints
                }
            }

            return resultObject
        }

        public static func toJSON(object: Service) -> String {
            let jsonString : NSMutableString = NSMutableString()
            // Start Object to JSON
            jsonString.appendString("{ ")

            // Fields.
            object.name != nil ? jsonString.appendString("\"name\": \"\(JSONUtil.escapeString(object.name!))\", ") : jsonString.appendString("\"name\": null, ")
            if (object.serviceEndpoints != nil) {
                // Start array of objects.
                jsonString.appendString("\"serviceEndpoints\": [")

                for var i = 0; i < object.serviceEndpoints!.count; i++ {
                    jsonString.appendString(ServiceEndpoint.Serializer.toJSON(object.serviceEndpoints![i]))
                    if (i < object.serviceEndpoints!.count-1) {
                        jsonString.appendString(", ");
                    }
                }

                // End array of objects.
                jsonString.appendString("]");
            } else {
                jsonString.appendString("\"serviceEndpoints\": null")
            }

            // End Object to JSON
            jsonString.appendString(" }")
            return jsonString as String
        }
    }
}

/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
