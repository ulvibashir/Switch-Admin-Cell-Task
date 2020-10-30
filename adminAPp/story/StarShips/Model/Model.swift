//
//  model.swift
//  adminAPp
//
//  Created by Ulvi Bashirov on 10/7/20.
//

import UIKit

struct Ship: Codable {
    var name: String?
    var model: String?
    var manufacturer: String?
    var cost_in_credits: String?
    var length: String?
    var max_atmosphering_speed: String?
    var crew: String?
    var passengers: String?
    var cargo_capacity: String?
    var consumables: String?
    var hyperdrive_rating: String?
    var MGLT: String?
    var starship_class: String?
    var pilots: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
}

struct StarShip: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Ship]?
}
