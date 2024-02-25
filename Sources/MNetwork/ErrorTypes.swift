//
//  File.swift
//  
//
//  Created by Emincan Antalyalı on 25.02.2024.
//

import Foundation
public enum ErrosTypes: String, Error {

    case invalidUrl = "InvalidUrl"
    case noData = "No data"
    case invalidRequest = "Invalid request"
    case generalError = "General Error"
    case parsingError = "Parsing Error"
    case responseError = "Response Error"
}
