//
//  Provider.swift
//  Gaiago
//
//  Created by Vincenzo Broscritto on 09/10/2020.
//

import UIKit

internal struct Provider: Codable {
    
    internal let id: String?
    internal let createdAt: Date?
    internal let fullname: String?
    internal let avatar: String?
    internal let phone: String?
    internal let company: String?
    internal let email: String?
//    internal let id: String?
//    internal let title: String?
//    internal let description: String?
//    internal let director: String?
//    internal let producer: String?
//    internal let releaseDate: String?
//    internal let score: String?
}

extension Provider {
    
    private enum Keys: String, CodingKey {
        case id, createdAt, fullname, avatar, phone, company, email
//        case id, title, description, director, producer
//        case releaseDate = "release_date"
//        case score = "rt_score"
    }
    
    internal init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: Keys.self)
        self.id = try? container?.decode(String.self, forKey: .id)
        self.fullname = try? container?.decode(String.self, forKey: .fullname)
        self.createdAt = try? container?.decode(Date.self, forKey: .createdAt)
        self.avatar = try? container?.decode(String.self, forKey: .avatar)
        self.phone = try? container?.decode(String.self, forKey: .phone)
        self.company = try? container?.decode(String.self, forKey: .company)
        self.email = try? container?.decode(String.self, forKey: .email)





//        self.id = try? container?.decode(Int.self, forKey: .id)
//        self.createdAt = try? container?.decode(Date.self, forKey: .createdAt)
//        self.fullname = try? container?.decode(String.self, forKey: .fullname)
//        let imageUrl = try? container?.decode(String.self, forKey: .avatar)
//        self.avatar = imageUrl?.imageFromServerURL(urlString: imageUrl ?? "", defaultImage: nil)
//        self.phone = try? container?.decode(String.self, forKey: .phone)
//        self.company = try? container?.decode(String.self, forKey: .company)
//        self.email = try? container?.decode(String.self, forKey: .email)
    }
}
