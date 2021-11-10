//
//  Constants.swift
//  Smack
//
//  Created by MacBook on 01/11/2021.
//

import Foundation
import Alamofire

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants

let BASE_URL = "https://smacksmacky.herokuapp.com/v1/"
let LOCAL_BASR_URL = "http://localhost:3005/v1/"

let URL_REGISTER = "\(LOCAL_BASR_URL)account/register"
let URL_LOGIN = "\(LOCAL_BASR_URL)account/login"
let URL_USER_ADD = "\(LOCAL_BASR_URL)user/add"


// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
 

// User Default
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let header: HTTPHeaders = [
    "Content-Type" : "application/json; charset=utf-8"
]

