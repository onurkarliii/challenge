//
//  ChallengeModel.swift
//  challenge
//
//  Created by Onur on 6.07.2022.
//

import Foundation

struct DataModel: Codable {
    var page: Int?
    var results: [ChallengeModel?]
    var total_pages: Int?
    var total_results: Int?
}

struct ChallengeModel: Codable {
    var backdrop_path: String?
    var first_air_date: String?
    var genre_ids: [Int?]?
    var id: Int?
    var name: String?
    var origin_country: [String]?
    var original_language, original_name, overview: String?
    var popularity: Double?
    var poster_path: String?
    var vote_average: Double?
    var vote_count: Int?
}
