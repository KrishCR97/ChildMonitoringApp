//
//  DatabaseManager.swift
//  ChildrenMonitoringSystem
//
//  Created by student on 3/10/18.
//

import Foundation
class DatabaseManager {
    
    let APPLICATION_ID = "3B0E7F39-9A46-5A3F-FF70-34D833BBAA00"
    let API_KEY = "90A735A0-9DF5-18CA-FFD7-83E9DB62CA00"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    let backendlessUser = BackendlessUser()
    private static var DBInstance:DatabaseManager? = nil
   
    
    private init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
    }
    func registerUser(user : User) -> String? {
        self.backendlessUser.email = user.email! as NSString
        self.backendlessUser.name = user.userName! as NSString
        self.backendlessUser.password = user.password! as NSString
        Types.tryblock({ () -> Void in
            self.backendless.userService.register(self.backendlessUser)
        }, catchblock: {(exception)-> Void in
            return String(describing : exception)
            })
        return nil
    }
    func login(user : User)->String?{
        var message : String? = nil
        Types.tryblock({ ()-> Void in
            if user.email != ""{
                if self.backendless.userService.login(user.email!, password: user.password!) == nil {
                    message = "You don't have an account in backendless."
                }
               
            }
            else {
                if self.backendless.userService.login(user.userName!, password: user.password!) == nil {
                   message = "You don't have an account in backendless."
                }
                
            }
        }, catchblock: {(exception)->Void in
            message = String(describing: exception)
            
            })
        return message
    }
    func forgotPass(user : User) -> String? {
        Types.tryblock({()->Void in
            self.backendless.userService.restorePassword(user.email!)
        }, catchblock: {(exception) -> Void in
            return String(describing : exception)
        })
        return nil
    }
    static func getDBInstance() -> DatabaseManager {
        if DatabaseManager.DBInstance == nil {
            DatabaseManager.DBInstance = DatabaseManager()
            return DatabaseManager.DBInstance!
        }
        return DatabaseManager.DBInstance!
    }
    
}
struct User {
    var userName : String?
    var email : String?
    var password : String?
}
