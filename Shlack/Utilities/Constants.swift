//
//  Constants.swift
//  Shlack
//
//  Created by Marko R. on 7/4/18.
//  Copyright © 2018 Marko. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL
let BASE_URL = "https://shlack-app.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

// Headers

let HEADER = [ "Content-Type": "application/json; charset=utf-8" ]


// Segues
let GOLOGIN = "goLogin"
let GOSIGNUP = "goSignUp"
let UNWIND = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "toke"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
