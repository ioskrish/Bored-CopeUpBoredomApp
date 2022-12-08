//
//  API_Response.swift
//  Bored
//
//  Created by TryCatch Classes on 29/11/22.
//

import Foundation

// MARK: - Welcome
struct BoredParam: Codable {
    let activity, type: String
    let participants, price: Int
    let link, key: String
    let accessibility: Double
}
