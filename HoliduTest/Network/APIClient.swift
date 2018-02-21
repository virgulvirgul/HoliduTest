//
//  APIClient.swift
//  HoliduTest
//
//  Created by Jaleel Akbashev on 21/02/2018.
//  Copyright © 2018 Jaleel Akbashev. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class APIClient {
    
    private let provider = MoyaProvider<API>()
    
    class var sharedInstance: APIClient {
        struct Singleton {
            static let instance = APIClient()
        }
        return Singleton.instance
    }


    // MARK: - Search for volumes
    public func getVolumes(query: String) -> Observable<[Volume]> {
        return provider.rx
            .request(.getVolumes(query: query))
            .map(VolumesResponse.self)
            .map{ $0.items }
            .asObservable()
    }
    
}
