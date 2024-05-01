//
//  File.swift
//  
//
//  Created by Emincan Antalyalı on 25.02.2024.
//

import Foundation
public enum ErrorTypes: String, Error {

    case invalidUrl = "InvalidUrl"
    case noData = "No data"
    case invalidRequest = "Invalid request"
    case generalError = "General Error"
    case parsingError = "Parsing Error"
    case responseError = "Response Error"
    case redirectionError300 = "Redirection Error 300's"
    case clientError400 = "Client Error 400's "
    case serverError500 = "Server Error 500's"
}
