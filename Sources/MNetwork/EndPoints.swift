//
//  File.swift
//  
//
//  Created by Emincan Antalyalı on 25.02.2024.

import Foundation

public protocol EndpointProtocol {
    var apiToken: String {get}
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header: [String: String]? {get}
    var parameters: [String: Any]? {get}
    func request() -> URLRequest
}

//MARK: - Endpoints

public enum Endpoint {
    case search(searchWord: String, year: String?, type: String?)
    case titleSearch(title: String)
    case idSearch(id: String)
}

extension Endpoint: EndpointProtocol {
    public var apiToken: String {
        return "f46c0017"
    }

    public var baseURL: String {
        return "https://www.omdbapi.com"
    }

    public var path: String {
        switch self {
            case .search, .titleSearch, .idSearch: return "/"
        }
    }

    public var method: HTTPMethod {
        return .get
    }

    public var header: [String : String]? {
        let header: [String: String] = ["Content-type": "application/json; charset=UTF-8"]
        return header
    }

    public var parameters: [String : Any]? {
        return nil
    }

    public func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            fatalError("URL ERROR")
        }
        //Add QueryItem
        let urlqueryItemOfApiKey = URLQueryItem(name: "apikey", value: apiToken)

        if case .titleSearch(let title) = self {
            components.queryItems = [urlqueryItemOfApiKey,
                                     URLQueryItem(name: "t", value: title)
            ]
        }
        if case .idSearch(let id) = self {
            components.queryItems = [urlqueryItemOfApiKey,
                                     URLQueryItem(name: "i", value: id)
            ]
        }

        if case .search(let searchWord, let year, let type) = self {
            var queryItems: [URLQueryItem] = [urlqueryItemOfApiKey, URLQueryItem(name: "s", value: searchWord)]

            if let year = year {
                let yearQueryItem = URLQueryItem(name: "y", value: String(describing: year))
                queryItems.append(yearQueryItem)
            }

            if let type = type {
                let typeQueryItem = URLQueryItem(name: "type", value: String(describing: type))
                queryItems.append(typeQueryItem)
            }

            components.queryItems = queryItems
        }
        //Add Path
        components.path = path

        //Create request
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue

        //Add Paramters
        if let parameters {
            do {
                let data = try JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = data
            }catch {
             //   Logger.shared.log(text:error.localizedDescription)
                print(error.localizedDescription)
            }
        }
        //Add Header
        if let header = header {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}
