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


