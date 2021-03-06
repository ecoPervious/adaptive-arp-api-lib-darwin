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
   Interface for Managing the Contact operations
   Auto-generated implementation of IContact specification.
*/
public class ContactBridge : BasePIMBridge, IContact, APIBridge {

    /**
       API Delegate.
    */
    private var delegate : IContact? = nil

    /**
       Constructor with delegate.

       @param delegate The delegate implementing platform specific functions.
    */
    public init(delegate : IContact?) {
        self.delegate = delegate
    }
    /**
       Get the delegate implementation.
       @return IContact delegate that manages platform specific functions..
    */
    public final func getDelegate() -> IContact? {
        return self.delegate
    }
    /**
       Set the delegate implementation.

       @param delegate The delegate implementing platform specific functions.
    */
    public final func setDelegate(delegate : IContact) {
        self.delegate = delegate;
    }

    /**
       Get all the details of a contact according to its id

       @param contact  id to search for
       @param callback called for return
       @since v2.0
    */
    public func getContact(contact : ContactUid , callback : IContactResultCallback ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executing getContact...")
        }

        if (self.delegate != nil) {
            self.delegate!.getContact(contact, callback: callback)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executed 'getContact' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "ContactBridge no delegate for 'getContact'.")
            }
        }
        
    }

    /**
       Get the contact photo

       @param contact  id to search for
       @param callback called for return
       @since v2.0
    */
    public func getContactPhoto(contact : ContactUid , callback : IContactPhotoResultCallback ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executing getContactPhoto...")
        }

        if (self.delegate != nil) {
            self.delegate!.getContactPhoto(contact, callback: callback)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executed 'getContactPhoto' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "ContactBridge no delegate for 'getContactPhoto'.")
            }
        }
        
    }

    /**
       Get all contacts

       @param callback called for return
       @since v2.0
    */
    public func getContacts(callback : IContactResultCallback ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executing getContacts...")
        }

        if (self.delegate != nil) {
            self.delegate!.getContacts(callback)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executed 'getContacts' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "ContactBridge no delegate for 'getContacts'.")
            }
        }
        
    }

    /**
       Get marked fields of all contacts

       @param callback called for return
       @param fields   to get for each Contact
       @since v2.0
    */
    public func getContactsForFields(callback : IContactResultCallback , fields : [IContactFieldGroup] ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executing getContactsForFields...")
        }

        if (self.delegate != nil) {
            self.delegate!.getContactsForFields(callback, fields: fields)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executed 'getContactsForFields' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "ContactBridge no delegate for 'getContactsForFields'.")
            }
        }
        
    }

    /**
       Get marked fields of all contacts according to a filter

       @param callback called for return
       @param fields   to get for each Contact
       @param filter   to search for
       @since v2.0
    */
    public func getContactsWithFilter(callback : IContactResultCallback , fields : [IContactFieldGroup] , filter : [IContactFilter] ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executing getContactsWithFilter...")
        }

        if (self.delegate != nil) {
            self.delegate!.getContactsWithFilter(callback, fields: fields, filter: filter)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executed 'getContactsWithFilter' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "ContactBridge no delegate for 'getContactsWithFilter'.")
            }
        }
        
    }

    /**
       Search contacts according to a term and send it to the callback

       @param term     string to search
       @param callback called for return
       @since v2.0
    */
    public func searchContacts(term : String , callback : IContactResultCallback ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executing searchContacts...")
        }

        if (self.delegate != nil) {
            self.delegate!.searchContacts(term, callback: callback)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executed 'searchContacts' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "ContactBridge no delegate for 'searchContacts'.")
            }
        }
        
    }

    /**
       Search contacts according to a term with a filter and send it to the callback

       @param term     string to search
       @param callback called for return
       @param filter   to search for
       @since v2.0
    */
    public func searchContactsWithFilter(term : String , callback : IContactResultCallback , filter : [IContactFilter] ) {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executing searchContactsWithFilter...")
        }

        if (self.delegate != nil) {
            self.delegate!.searchContactsWithFilter(term, callback: callback, filter: filter)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executed 'searchContactsWithFilter' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "ContactBridge no delegate for 'searchContactsWithFilter'.")
            }
        }
        
    }

    /**
       Set the contact photo

       @param contact  id to assign the photo
       @param pngImage photo as byte array
       @return true if set is successful;false otherwise
       @since v2.0
    */
    public func setContactPhoto(contact : ContactUid , pngImage : [UInt8] ) -> Bool? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executing setContactPhoto...")
        }

        var result : Bool? = false
        if (self.delegate != nil) {
            result = self.delegate!.setContactPhoto(contact, pngImage: pngImage)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "ContactBridge executed 'setContactPhoto' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "ContactBridge no delegate for 'setContactPhoto'.")
            }
        }
        return result        
    }

    /**
       Invokes the given method specified in the API request object.

       @param request APIRequest object containing method name and parameters.
       @return APIResponse with status code, message and JSON response or a JSON null string for void functions. Status code 200 is OK, all others are HTTP standard error conditions.
    */
    public override func invoke(request : APIRequest) -> APIResponse? {
        let response : APIResponse = APIResponse()
        var responseCode : Int32 = 200
        var responseMessage : String = "OK"
        var responseJSON : String? = "null"
        switch request.getMethodName()! {
            case "getContact":
                let contact0 : ContactUid? = ContactUid.Serializer.fromJSON(request.getParameters()![0])
                let callback0 : IContactResultCallback? =  ContactResultCallbackImpl(id: request.getAsyncId()!)
                self.getContact(contact0!, callback: callback0!);
            case "getContactPhoto":
                let contact1 : ContactUid? = ContactUid.Serializer.fromJSON(request.getParameters()![0])
                let callback1 : IContactPhotoResultCallback? =  ContactPhotoResultCallbackImpl(id: request.getAsyncId()!)
                self.getContactPhoto(contact1!, callback: callback1!);
            case "getContacts":
                let callback2 : IContactResultCallback? =  ContactResultCallbackImpl(id: request.getAsyncId()!)
                self.getContacts(callback2!);
            case "getContactsForFields":
                let callback3 : IContactResultCallback? =  ContactResultCallbackImpl(id: request.getAsyncId()!)
                var fields3 : [IContactFieldGroup]? = [IContactFieldGroup]()
                let fieldsArray3 : [String] = JSONUtil.stringElementToArray(request.getParameters()![0])
                for fieldsElement3 in fieldsArray3 {
                    fields3!.append(IContactFieldGroup.toEnum(JSONUtil.dictionifyJSON(fieldsElement3)["value"] as? String)) /* MARK */
                }
                self.getContactsForFields(callback3!, fields: fields3!);
            case "getContactsWithFilter":
                let callback4 : IContactResultCallback? =  ContactResultCallbackImpl(id: request.getAsyncId()!)
                var fields4 : [IContactFieldGroup]? = [IContactFieldGroup]()
                let fieldsArray4 : [String] = JSONUtil.stringElementToArray(request.getParameters()![0])
                for fieldsElement4 in fieldsArray4 {
                    fields4!.append(IContactFieldGroup.toEnum(JSONUtil.dictionifyJSON(fieldsElement4)["value"] as? String)) /* MARK */
                }
                var filter4 : [IContactFilter]? = [IContactFilter]()
                let filterArray4 : [String] = JSONUtil.stringElementToArray(request.getParameters()![1])
                for filterElement4 in filterArray4 {
                    filter4!.append(IContactFilter.toEnum(JSONUtil.dictionifyJSON(filterElement4)["value"] as? String)) /* MARK */
                }
                self.getContactsWithFilter(callback4!, fields: fields4!, filter: filter4!);
            case "searchContacts":
                let term5 : String? = JSONUtil.unescapeString(request.getParameters()![0])
                let callback5 : IContactResultCallback? =  ContactResultCallbackImpl(id: request.getAsyncId()!)
                self.searchContacts(term5!, callback: callback5!);
            case "searchContactsWithFilter":
                let term6 : String? = JSONUtil.unescapeString(request.getParameters()![0])
                let callback6 : IContactResultCallback? =  ContactResultCallbackImpl(id: request.getAsyncId()!)
                var filter6 : [IContactFilter]? = [IContactFilter]()
                let filterArray6 : [String] = JSONUtil.stringElementToArray(request.getParameters()![1])
                for filterElement6 in filterArray6 {
                    filter6!.append(IContactFilter.toEnum(JSONUtil.dictionifyJSON(filterElement6)["value"] as? String)) /* MARK */
                }
                self.searchContactsWithFilter(term6!, callback: callback6!, filter: filter6!);
            case "setContactPhoto":
                let contact7 : ContactUid? = ContactUid.Serializer.fromJSON(request.getParameters()![0])
                var pngImage7 : [UInt8]? = [UInt8]()
                let pngImageArray7 : [String] = JSONUtil.stringElementToArray(request.getParameters()![1])
                for pngImageElement7 in pngImageArray7 {
                    pngImage7!.append(UInt8((pngImageElement7 as NSString).intValue))
                }
                let response7 : Bool? = self.setContactPhoto(contact7!, pngImage: pngImage7!)
                if let response7 = response7 {
                    responseJSON = "\(response7)"
                 } else {
                    responseJSON = "false"
                 }
            default:
                // 404 - response null.
                responseCode = 404
                responseMessage = "ContactBridge does not provide the function '\(request.getMethodName()!)' Please check your client-side API version; should be API version >= v2.2.15."
        }
        response.setResponse(responseJSON!)
        response.setStatusCode(responseCode)
        response.setStatusMessage(responseMessage)
        return response
    }
}
/**
------------------------------------| Engineered with ♥ in Barcelona, Catalonia |--------------------------------------
*/
