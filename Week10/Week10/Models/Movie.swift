//
//  Movie.swift
//  Week10
//
//  Created by 김승원 on 6/11/24.
//

import Foundation

struct Movie: Identifiable, Hashable {
    let id: Int
    let movieName: String
    let rank: Int
    let openDate: String
    let todayAudience: Int
    let totalAudience: Int

    static var movieIdCounter = 0

    init(movieNm: String, rank: String, openDate: String, audiCnt: String, accAudi: String) {
        self.id = Movie.movieIdCounter
        self.movieName = movieNm
        self.rank = Int(rank) ?? 0
        self.openDate = openDate
        self.todayAudience = Int(audiCnt) ?? 0
        self.totalAudience = Int(accAudi) ?? 0
        Movie.movieIdCounter += 1
    }

    static func resetMovieIdCounter() {
        Movie.movieIdCounter = 0
    }
}
