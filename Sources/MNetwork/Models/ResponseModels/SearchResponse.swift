//
//  QueryResponse.swift
//  MovieApp
//
//  Created by Emincan Antalyalı on 6.11.2023.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let queryResponse = try? JSONDecoder().decode(QueryResponse.self, from: jsonData)

import Foundation

// MARK: - QueryResponse
public struct SearchResponse: Codable {
    public let search: [Search]?
    public let totalResults, response: String?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
public struct Search: Codable {
    public let title, year, imdbID, type: String?
    public let poster: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
