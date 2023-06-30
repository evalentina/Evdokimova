//
//  Category.swift
//  Evdokimova
//
//  Created by Валентина Евдокимова on 29.06.2023.
//

import Foundation

struct Categories: Codable {
    let сategories: [СategoryModel]
}

// MARK: - Сategory
struct СategoryModel: Codable {
    let id: Int
    let name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
    }
}

extension СategoryModel: Identifiable {
    
}

