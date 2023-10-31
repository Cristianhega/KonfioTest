//
//  Dog.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import Foundation

struct Dog : Codable {
    let dogName : String?
    let description : String?
    let age : Int?
    let image : String?
    
    enum CodingKeys: String, CodingKey {
        case dogName = "dogName"
        case description = "description"
        case age = "age"
        case image = "image"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dogName = try values.decodeIfPresent(String.self, forKey: .dogName)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        age = try values.decodeIfPresent(Int.self, forKey: .age)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }
    
    init(dogName : String?, description : String?, age : Int?, image : String?) {
        self.dogName = dogName
        self.description = description
        self.age = age
        self.image = image
    }
}
