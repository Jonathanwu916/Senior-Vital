//
//  User.swift
//  SeniorVital
//
//  Created by Zijing Wu on 10/10/23.
//

import Foundation

struct User: Decodable {
    let userName: String
    let password: String
    let heartRate: String
    let bloodPressure: String
    let stepsCount: String
    
    enum RootKeys: String, CodingKey {
        case userName, password, heartRate, bloodPressure, stepsCount
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: RootKeys.self)
        
        userName = try values.decode(String.self, forKey: .userName)
        password = try values.decode(String.self, forKey: .password)
        heartRate = try values.decode(String.self, forKey: .heartRate)
        bloodPressure = try values.decode(String.self, forKey: .bloodPressure)
        stepsCount = try values.decode(String.self, forKey: .stepsCount)
    }
}
