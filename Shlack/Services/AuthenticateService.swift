//
//  AuthenticateService.swift
//  Shlack
//
//  Created by Marko R. on 7/6/18.
//  Copyright © 2018 Marko. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthenticateService {
    
    static let instance = AuthenticateService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            return defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            return defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            return defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()

        let body : [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
        
        let body : [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                
                // SwiftyJSON
                guard let dataFromInternet = response.data else { return }
                let json = JSON(dataFromInternet)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                self.isLoggedIn = true
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
 
            
            func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
                
                
                let lowerCaseEmail = email.lowercased()
                
                let body : [String: Any] = [
                    "name": name,
                    "email": lowerCaseEmail,
                    "avatarName": avatarName,
                    "avatarColor": avatarColor
                ]
                
                let header : [String: Any] = [
                    "Authorization": "Bearer \(AuthenticateService.instance.authToken)",
                    "Content-Type": "application/json; charset=utf-8"
                ]
                
                Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
                    
                    if response.result.error == nil {
                        
                        // SwiftyJSON
                        guard let dataFromInternet = response.data else { return }
                        let json = JSON(dataFromInternet)
                        let id = json["_id"].stringValue
                        let color = json["avatarColor"].stringValue
                        let avatarName = json["avatarName"].stringValue
                        let email = json["email"].stringValue
                        let name = json["name"].stringValue
                        
                        
                        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: email)
                        
                        completion(true)
                    } else {
                        completion(false)
                        debugPrint(response.result.error as Any)
                    }
            }

            
            
        }
        
        
    }
    
    
    
}
