//
//  Utils.swift
//  SeniorVital
//
//  Created by Zijing Wu on 12/10/23.
//

import Foundation

class Utils {
    static func readUser() -> User? {
        do {
           if let bundlePath = Bundle.main.path(forResource: "user", ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
              let user = try JSONDecoder().decode(User.self, from: jsonData)
               print("User name: \(user.userName)")
               return user
           }
        } catch {
           print(error)
        }
        return nil
     }
}
