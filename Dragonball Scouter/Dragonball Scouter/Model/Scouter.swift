//
//  Scouter.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/09.
//

import Foundation
import SwiftUI

struct Scouter: Identifiable {
    let id: UUID = UUID()
    let tier: Int
    var name: String
    var race: String
    var powerLevels: Int
    var imageName: String
    var image: Image {
        Image("imageName")
    }
}

let Nappa: Scouter = Scouter(tier: 4, name: "Nappa", race: "Saiyan", powerLevels: 4000, imageName: "Nappa")

let Ginyu: Scouter = Scouter(tier: 4, name: "Ginyu", race: "???", powerLevels: 120000, imageName: "Ginyu")

let MrSatan: Scouter = Scouter(tier: 5, name: "Mr.Satan", race: "Human", powerLevels: 64, imageName: "MrSatan")

let Goku: Scouter = Scouter(tier: 2, name: "Goku", race: "Saiyan", powerLevels: 3000000, imageName: "Goku")

let Vegeta: Scouter = Scouter(tier: 3, name: "Vegeta", race: "Saiyan", powerLevels: 2400000, imageName: "Vegeta")

let Freezer: Scouter = Scouter(tier: 2, name: "Freezer", race: "???", powerLevels: 4240000, imageName: "Freezer")

let Farmer: Scouter = Scouter(tier: 5, name: "Farmer", race: "Human", powerLevels: 5, imageName: "Farmer")

var AutoScouters: [Scouter] = [Nappa, Ginyu, MrSatan, Goku, Vegeta, Freezer, Farmer]
