//
//  Character.swift
//  domain
//
//  Created by Renan Benatti Dias on 16/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import Foundation
import data

public struct Character {
    
    public let id: Int
    public let fullName: String
//    public let rank: String
    public let personality: String
}

extension Character {
    
    init?(characterAPI: CharacterAPI) {
        guard let id = characterAPI.id,
            let fullName = characterAPI.fullName,
//            let rank = characterAPI.rank,
            let personality = characterAPI.personality else {
                return nil
        }
        
        self.init(id: id, fullName: fullName, personality: personality)
//        self.init(id: id, fullName: fullName, rank: rank, personality: personality)
    }
}
