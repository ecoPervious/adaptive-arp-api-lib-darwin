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
   Interface for Managing the File System operations
   Auto-generated implementation of IFileSystem specification.
*/
public class FileSystemBridge : BaseDataBridge, IFileSystem, APIBridge {

    /**
       API Delegate.
    */
    private var delegate : IFileSystem? = nil

    /**
       Constructor with delegate.

       @param delegate The delegate implementing platform specific functions.
    */
    public init(delegate : IFileSystem?) {
        self.delegate = delegate
    }
    /**
       Get the delegate implementation.
       @return IFileSystem delegate that manages platform specific functions..
    */
    public final func getDelegate() -> IFileSystem? {
        return self.delegate
    }
    /**
       Set the delegate implementation.

       @param delegate The delegate implementing platform specific functions.
    */
    public final func setDelegate(delegate : IFileSystem) {
        self.delegate = delegate;
    }

    /**
       Creates a new reference to a new or existing location in the filesystem.
This method does not create the actual file in the specified folder.

       @param parent Parent directory.
       @param name   Name of new file or directory.
       @return A reference to a new or existing location in the filesystem.
       @since v2.0
    */
    public func createFileDescriptor(parent : FileDescriptor , name : String ) -> FileDescriptor? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executing createFileDescriptor...")
        }

        var result : FileDescriptor? = nil
        if (self.delegate != nil) {
            result = self.delegate!.createFileDescriptor(parent, name: name)
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executed 'createFileDescriptor' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "FileSystemBridge no delegate for 'createFileDescriptor'.")
            }
        }
        return result        
    }

    /**
       Returns a reference to the cache folder for the current application.
This path must always be writable by the current application.
This path is volatile and may be cleaned by the OS periodically.

       @return Path to the application's cache folder.
       @since v2.0
    */
    public func getApplicationCacheFolder() -> FileDescriptor? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executing getApplicationCacheFolder...")
        }

        var result : FileDescriptor? = nil
        if (self.delegate != nil) {
            result = self.delegate!.getApplicationCacheFolder()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executed 'getApplicationCacheFolder' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "FileSystemBridge no delegate for 'getApplicationCacheFolder'.")
            }
        }
        return result        
    }

    /**
       Returns a reference to the cloud synchronizable folder for the current application.
This path must always be writable by the current application.

       @return Path to the application's cloud storage folder.
       @since v2.0
    */
    public func getApplicationCloudFolder() -> FileDescriptor? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executing getApplicationCloudFolder...")
        }

        var result : FileDescriptor? = nil
        if (self.delegate != nil) {
            result = self.delegate!.getApplicationCloudFolder()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executed 'getApplicationCloudFolder' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "FileSystemBridge no delegate for 'getApplicationCloudFolder'.")
            }
        }
        return result        
    }

    /**
       Returns a reference to the documents folder for the current application.
This path must always be writable by the current application.

       @return Path to the application's documents folder.
       @since v2.0
    */
    public func getApplicationDocumentsFolder() -> FileDescriptor? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executing getApplicationDocumentsFolder...")
        }

        var result : FileDescriptor? = nil
        if (self.delegate != nil) {
            result = self.delegate!.getApplicationDocumentsFolder()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executed 'getApplicationDocumentsFolder' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "FileSystemBridge no delegate for 'getApplicationDocumentsFolder'.")
            }
        }
        return result        
    }

    /**
       Returns a reference to the application installation folder.
This path may or may not be directly readable or writable - it usually contains the app binary and data.

       @return Path to the application folder.
       @since v2.0
    */
    public func getApplicationFolder() -> FileDescriptor? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executing getApplicationFolder...")
        }

        var result : FileDescriptor? = nil
        if (self.delegate != nil) {
            result = self.delegate!.getApplicationFolder()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executed 'getApplicationFolder' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "FileSystemBridge no delegate for 'getApplicationFolder'.")
            }
        }
        return result        
    }

    /**
       Returns a reference to the protected storage folder for the current application.
This path must always be writable by the current application.

       @return Path to the application's protected storage folder.
       @since v2.0
    */
    public func getApplicationProtectedFolder() -> FileDescriptor? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executing getApplicationProtectedFolder...")
        }

        var result : FileDescriptor? = nil
        if (self.delegate != nil) {
            result = self.delegate!.getApplicationProtectedFolder()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executed 'getApplicationProtectedFolder' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "FileSystemBridge no delegate for 'getApplicationProtectedFolder'.")
            }
        }
        return result        
    }

    /**
       Returns the file system dependent file separator.

       @return char with the directory/file separator.
       @since v2.0
    */
    public func getSeparator() -> Character? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executing getSeparator...")
        }

        var result : Character? = " "
        if (self.delegate != nil) {
            result = self.delegate!.getSeparator()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executed 'getSeparator' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "FileSystemBridge no delegate for 'getSeparator'.")
            }
        }
        return result        
    }

    /**
       Returns a reference to the external storage folder provided by the OS. This may
be an external SSD card or similar. This type of storage is removable and by
definition, not secure.
This path may or may not be writable by the current application.

       @return Path to the application's documents folder.
       @since v2.0
    */
    public func getSystemExternalFolder() -> FileDescriptor? {
        // Start logging elapsed time.
        let tIn : NSTimeInterval = NSDate.timeIntervalSinceReferenceDate()
        let logger : ILogging? = AppRegistryBridge.sharedInstance.getLoggingBridge()

        if (logger != nil) {
            logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executing getSystemExternalFolder...")
        }

        var result : FileDescriptor? = nil
        if (self.delegate != nil) {
            result = self.delegate!.getSystemExternalFolder()
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Debug, category: getAPIGroup()!.toString(), message: "FileSystemBridge executed 'getSystemExternalFolder' in \(UInt(tIn.distanceTo(NSDate.timeIntervalSinceReferenceDate())*1000)) ms.")
             }
        } else {
            if (logger != nil) {
                logger!.log(ILoggingLogLevel.Error, category: getAPIGroup()!.toString(), message: "FileSystemBridge no delegate for 'getSystemExternalFolder'.")
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
            case "createFileDescriptor":
                let parent0 : FileDescriptor? = FileDescriptor.Serializer.fromJSON(request.getParameters()![0])
                let name0 : String? = JSONUtil.unescapeString(request.getParameters()![1])
                let response0 : FileDescriptor? = self.createFileDescriptor(parent0!, name: name0!)
                if let response0 = response0 {
                    responseJSON = FileDescriptor.Serializer.toJSON(response0)
                } else {
                    responseJSON = "null"
                }
            case "getApplicationCacheFolder":
                let response1 : FileDescriptor? = self.getApplicationCacheFolder()
                if let response1 = response1 {
                    responseJSON = FileDescriptor.Serializer.toJSON(response1)
                } else {
                    responseJSON = "null"
                }
            case "getApplicationCloudFolder":
                let response2 : FileDescriptor? = self.getApplicationCloudFolder()
                if let response2 = response2 {
                    responseJSON = FileDescriptor.Serializer.toJSON(response2)
                } else {
                    responseJSON = "null"
                }
            case "getApplicationDocumentsFolder":
                let response3 : FileDescriptor? = self.getApplicationDocumentsFolder()
                if let response3 = response3 {
                    responseJSON = FileDescriptor.Serializer.toJSON(response3)
                } else {
                    responseJSON = "null"
                }
            case "getApplicationFolder":
                let response4 : FileDescriptor? = self.getApplicationFolder()
                if let response4 = response4 {
                    responseJSON = FileDescriptor.Serializer.toJSON(response4)
                } else {
                    responseJSON = "null"
                }
            case "getApplicationProtectedFolder":
                let response5 : FileDescriptor? = self.getApplicationProtectedFolder()
                if let response5 = response5 {
                    responseJSON = FileDescriptor.Serializer.toJSON(response5)
                } else {
                    responseJSON = "null"
                }
            case "getSeparator":
                let response6 : Character? = self.getSeparator()
                if let response6 = response6 {
                    responseJSON = "\(response6)"
                 } else {
                    responseJSON = "null"
                 }
            case "getSystemExternalFolder":
                let response7 : FileDescriptor? = self.getSystemExternalFolder()
                if let response7 = response7 {
                    responseJSON = FileDescriptor.Serializer.toJSON(response7)
                } else {
                    responseJSON = "null"
                }
            default:
                // 404 - response null.
                responseCode = 404
                responseMessage = "FileSystemBridge does not provide the function '\(request.getMethodName()!)' Please check your client-side API version; should be API version >= v2.2.15."
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
