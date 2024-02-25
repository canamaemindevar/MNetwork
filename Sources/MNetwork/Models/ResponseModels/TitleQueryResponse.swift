//
//  TitleQueryResponse.swift
//  MovieApp
//
//  Created by Emincan Antalyalı on 6.11.2023.
//

import Foundation

public struct TitleQueryResponse: Codable {
    public let title, year, rated, released: String?
    public let runtime, genre, director, writer: String?
    public let actors, plot, language, country: String?
    public let awards, poster, metascore, imdbRating, imdbVotes, imdbID, type, response: String?
    public let ratings: [Rating]?
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case actors = "Actors"
        case awards = "Awards"
        case country = "Country"
        case director = "Director"
        case genre = "Genre"
        case language = "Language"
        case metascore = "Metascore"
        case plot = "Plot"
        case poster = "Poster"
        case rated = "Rated"
        case ratings = "Ratings"
        case released = "Released"
        case response = "Response"
        case runtime = "Runtime"
        case type = "Type"
        case writer = "Writer"
        case year = "Year"
        case  imdbRating, imdbVotes, imdbID
    }
    public init(title: String? = nil, year: String? = nil, rated: String? = nil, released: String? = nil, runtime: String? = nil, genre: String? = nil, director: String? = nil, writer: String? = nil, actors: String? = nil, plot: String? = nil, language: String? = nil, country: String? = nil, awards: String? = nil, poster: String? = nil, metascore: String? = nil, imdbRating: String? = nil, imdbVotes: String? = nil, imdbID: String? = nil, type: String? = nil, response: String? = nil, ratings: [Rating]? = nil) {
        self.title = title
        self.year = year
        self.rated = rated
        self.released = released
        self.runtime = runtime
        self.genre = genre
        self.director = director
        self.writer = writer
        self.actors = actors
        self.plot = plot
        self.language = language
        self.country = country
        self.awards = awards
        self.poster = poster
        self.metascore = metascore
        self.imdbRating = imdbRating
        self.imdbVotes = imdbVotes
        self.imdbID = imdbID
        self.type = type
        self.response = response
        self.ratings = ratings
    }
}

public struct Rating: Codable {
    public let source, value: String?

    enum CodingKeys: String, CodingKey {
        case source, value
    }
}

extension TitleQueryResponse {
    public static var mockData = TitleQueryResponse(title: "", year: "", rated: "",
                                         released: "", runtime: "", genre: "",
                                         director: "", writer: "", actors: "",
                                         plot: "", language: "", country: "",
                                         awards: "", poster: "", metascore: "", imdbRating: "",
                                         imdbVotes: "", imdbID: "", type: "",
                                         response: "", ratings: nil)
}
