//
//  Model.swift
//  AppinessTask
//
//  Created by HarshaVardhan on 05/10/20.
//  Copyright © 2020 HarshaVardhan. All rights reserved.
//

import Foundation

struct DetailsModel : Codable {
    
    var details : [Details]?
    
    enum CodingKeys: String, CodingKey {
        case details = "Details"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        details = try values.decodeIfPresent([Details].self, forKey: .details)
    }
    
}
struct Details : Codable {
    
    let dob : String?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case dob = "dob"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}

