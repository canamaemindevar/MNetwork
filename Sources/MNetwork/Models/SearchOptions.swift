//
//  SearchOptions.swift
//  MovieApp
//
//  Created by Emincan Antalyalı on 7.11.2023.
//

import Foundation

public struct SearchOptions {
    public var option: SearchTypes
    public var filters: [SecondOptionStuct]?
    public var selectedSecond: SecondOptions?
    public var thirdOption: String?

    public init(option: SearchTypes, filters: [SecondOptionStuct]? = nil, selectedSecond: SecondOptions? = nil, thirdOption: String? = nil) {
        self.option = option
        self.filters = filters
        self.selectedSecond = selectedSecond
        self.thirdOption = thirdOption
    }
}

public struct SecondOptionStuct {
    public var secondOption: SecondOptions

    public init(secondOption: SecondOptions) {
        self.secondOption = secondOption
    }
}
