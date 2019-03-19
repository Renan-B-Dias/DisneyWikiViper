//
//  BaseTargetType.swift
//  data
//
//  Created by Renan Benatti Dias on 18/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Moya

protocol BaseTargetType: TargetType {}
extension BaseTargetType {
    
    var baseURL: URL {
        return APIClient.baseURL
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return [:]  // TODO
    }
}
