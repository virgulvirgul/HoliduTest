//
//  API.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import Foundation
import Moya

enum API {
    case getVolumes(query: String)
}

extension API: TargetType {
    
    public var headers: [String : String]? {
        return nil
    }
    
    public var task: Task {
        switch self {
        case .getVolumes(let query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var baseURL: URL {
        return URL(string: NetworkConstants.baseURL)!
    }
    
    public var path: String {
        switch self {
        // Volumes
        case .getVolumes:
            return "volumes"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        default:
            return "{\"data\":\"\"}".data(using: String.Encoding.utf8)!
        }
    }
}
