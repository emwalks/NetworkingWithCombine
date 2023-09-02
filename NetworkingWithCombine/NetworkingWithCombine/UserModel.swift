//
//  UserModel.swift
//  NetworkingWithCombine
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 02/09/2023.
//

import Foundation

/*
 Raw JSON data
 
 {
     "id": "6DC8EF4D-D627-4D83-9A0D-F8157099CB43",
     "name": "Paul Hudson",
     "age": 40
 }
 
 */

struct User: Decodable, Identifiable {
    var id: UUID
    var name: String
    
    static let `default` = User(id: UUID(), name: "Anon")
}
