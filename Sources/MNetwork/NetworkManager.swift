//
//  File.swift
//  
//
//  Created by Emincan Antalyalı on 25.02.2024.
//

import Foundation
import MCore

public protocol IdAndTitleQueryMakeable: AnyObject {
    func makeQueryWithID(id: String, completion: @escaping (Result<TitleQueryResponse, ErrosTypes>) -> Void)
    func makeQueryWithTitle(title: String, completion: @escaping (Result< TitleQueryResponse, ErrosTypes>) -> Void)
}

public protocol SearchQueryMakeable: AnyObject {
    func makeSearchQuery(word: String, year: String?, type: String?, completion: @escaping (Result< SearchResponse, ErrosTypes>) -> Void)
}

public final class NetworkManager {
    public static let shared = NetworkManager()
    private init() {}
}

extension NetworkManager: IdAndTitleQueryMakeable {
    public func makeQueryWithID(id: String, completion: @escaping (Result<TitleQueryResponse, ErrosTypes>) -> Void) {
        let endPoint = Endpoint.idSearch(id: id)
        CoreNetworkManager.shared.request(endPoint, completion: completion)
    }

    public func makeQueryWithTitle(title: String, completion: @escaping (Result< TitleQueryResponse, ErrosTypes>) -> Void) {
        let endPoint = Endpoint.titleSearch(title: title)
        CoreNetworkManager.shared.request(endPoint, completion: completion)
    }
}

extension NetworkManager: SearchQueryMakeable {

    public func makeSearchQuery(word: String, year: String?, type: String?, completion: @escaping (Result<SearchResponse, ErrosTypes>) -> Void) {
        let endPoint = Endpoint.search(searchWord: word, year: year, type: type)
        CoreNetworkManager.shared.request(endPoint, completion: completion)
    }
}
