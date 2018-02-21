//
//  Volume.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import Foundation

struct Volume: Decodable {
    var kind: String = ""
    var id: String = ""
    var etag: String = ""
    var selfLink: String = ""
    var volumeInfo: VolumeInfo?
}
