//
//  userData.swift
//  SeniorVital
//
//  Created by Zijing Wu on 23/10/23.
//

import Foundation

struct User: Decodable {
   let id: Int
   let title: String
   let price: Int
   let thumbnail: String
   let manufacturedBy: String
    
   enum RootKeys: String, CodingKey {
      case id, title, price, thumbnail, manufacturedDetail
   }
    
   enum ManufacturedKeys: String, CodingKey {
      case company
   }
    
   enum CompanyKeys: String, CodingKey {
      case manufacturedBy
   }
   
   init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: RootKeys.self)
      id = try values.decode(Int.self, forKey: .id)
      title = try values.decode(String.self, forKey: .title)
      price = try values.decode(Int.self, forKey: .price)
      thumbnail = try values.decode(String.self, forKey: .thumbnail)
        
      let manufacturedContainer = try values.nestedContainer(keyedBy: ManufacturedKeys.self, forKey: .manufacturedDetail)
      let companyContainer = try manufacturedContainer.nestedContainer(keyedBy: CompanyKeys.self, forKey: .company)
      self.manufacturedBy = try companyContainer.decode(String.self, forKey: .manufacturedBy)
   }
}
