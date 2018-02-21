//
//  VolumesResponse.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import Foundation

struct VolumesResponse: Decodable {
    var kind: String = ""
    var totalItems: Int = 0
    var items: [Volume] = []
}
