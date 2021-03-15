//
//  Review.swift
//  MoviesApp
//
//  Created by Dayton on 16/02/21.
//  Copyright © 2021 Mohammad Azam. All rights reserved.
//

import Foundation

struct Review:Codable {
    var id: UUID?
    var title: String
    var body: String
    var movie:Movie?
}
