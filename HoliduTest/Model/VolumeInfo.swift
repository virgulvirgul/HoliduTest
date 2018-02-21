//
//  VolumeInfo.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import Foundation

struct VolumeInfo: Decodable {
    var title: String?
    var authors: [String]?
    var publisher: String?
    var publishedDate: String?
    var description: String?
    var pageCount: Int?
    var imageLinks: VolumeImageLinks?
}
