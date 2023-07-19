//
//  Data.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/13.
//

import Foundation

// 스카우터 전사 데이터입니다.

let Nappa: Scouter = Scouter(tier: 4, name: "Nappa", race: "Saiyan", powerLevels: 4000, imageName: "Nappa")

let Ginyu: Scouter = Scouter(tier: 4, name: "Ginyu", race: "???", powerLevels: 120000, imageName: "Ginyu")

let MrSatan: Scouter = Scouter(tier: 5, name: "Mr.Satan", race: "Human", powerLevels: 64, imageName: "MrSatan")

let Goku: Scouter = Scouter(tier: 2, name: "Goku", race: "Saiyan", powerLevels: 3000000, imageName: "Goku")

let GokuSSJ: Scouter = Scouter(tier: 1, name: "Goku", race: "Super Saiyan", powerLevels: 150000000, imageName: "GokuSSJ")

let Vegeta: Scouter = Scouter(tier: 3, name: "Vegeta", race: "Saiyan", powerLevels: 2400000, imageName: "Vegeta")

let Freezer: Scouter = Scouter(tier: 2, name: "Freezer", race: "???", powerLevels: 4240000, imageName: "Freezer")

let Freezer01: Scouter = Scouter(tier: 2, name: "Freezer", race: "???", powerLevels: 530000, imageName: "Freezer01")

let FreezerFULL: Scouter = Scouter(tier: 1, name: "Freezer", race: "???", powerLevels: 120000000, imageName: "FreezerFULL")

let Farmer: Scouter = Scouter(tier: 5, name: "Farmer", race: "Human", powerLevels: 5, imageName: "Farmer")

// 전사 자동 추가시 사용할 데이터입니다.

var AutoScouters: [Scouter] = [Nappa, Ginyu, MrSatan, Goku, Vegeta, Freezer, Farmer, GokuSSJ, Freezer01, FreezerFULL]

