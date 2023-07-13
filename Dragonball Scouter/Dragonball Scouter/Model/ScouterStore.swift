//
//  ScouterStore.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/09.
//

import Foundation
import SwiftUI

class ScouterStore: ObservableObject {
    @Published var scouters: [Scouter] = []
    
    init() {
        scouters = [
            Scouter(tier: 4, name: "Nappa", race: "Saiyan", powerLevels: 4000, imageName: "Nappa")
        ]
    }
    
    func AddScouter(tier: Int, name: String, race: String, powerLevels: Int, ImageName: String) {
        if name.count > 0 && race.count > 0 && powerLevels > 0 {
            let scouter: Scouter = Scouter(tier: tier, name: name, race: race, powerLevels: powerLevels, imageName: ImageName)
            scouters.insert(scouter, at: 0)
        }
    }
    
}

class AutoScouterStore: ObservableObject {
    @Published var scouters: [Scouter] = AutoScouters
    
    func AddScouter(tier: Int, name: String, race: String, powerLevels: Int, ImageName: String) {
        if name.count > 0 && race.count > 0 && powerLevels > 0 {
            let scouter: Scouter = Scouter(tier: tier, name: name, race: race, powerLevels: powerLevels, imageName: ImageName)
            scouters.insert(scouter, at: 0)
        }
    }
    
    func AutoAddScouter() -> Scouter {
        // 에러해결, 인덱스 에러로 확인, -1을 해주어야했다.
        let scouter: Scouter
        var tierArray: [Scouter] = []
        
        let randomNum: Int = Int.random(in: 1...100)
        print(randomNum)
        switch randomNum {
        case 1...30 :
            // 4티어만 나오게끔 랜덤으로
            for scouter in scouters {
                if scouter.tier == 4 {
                    tierArray.append(scouter)
                }
            }
            let randomTierIndex: Int = Int.random(in: 0...tierArray.count-1)
            scouter = tierArray[randomTierIndex]
            tierArray.removeAll()
            return scouter
            
        case 31...40 :
            // 3티어만 나오게끔 랜덤으로
            for scouter in scouters {
                if scouter.tier == 3 {
                    tierArray.append(scouter)
                }
            }
            let randomTierIndex: Int = Int.random(in: 0...tierArray.count-1)
            scouter = tierArray[randomTierIndex]
            tierArray.removeAll()
            return scouter
            
        case 41...45 :
            // 2티어만 나오게끔 랜덤으로
            for scouter in scouters {
                if scouter.tier == 2 {
                    tierArray.append(scouter)
                }
            }
            let randomTierIndex: Int = Int.random(in: 0...tierArray.count-1)
            scouter = tierArray[randomTierIndex]
            tierArray.removeAll()
            return scouter
            
        case 100 :
            // 1티어만 나오게끔 랜덤으로
            for scouter in scouters {
                if scouter.tier == 2 {
                    tierArray.append(scouter)
                }
            }
            let randomTierIndex: Int = Int.random(in: 0...tierArray.count-1)
            scouter = tierArray[randomTierIndex]
            tierArray.removeAll()
            return scouter
            
        case 46...100 :
            // 5티어만 나오게끔 랜덤으로
            for scouter in scouters {
                if scouter.tier == 5 {
                    tierArray.append(scouter)
                }
            }
            let randomTierIndex: Int = Int.random(in: 0...tierArray.count-1)
            scouter = tierArray[randomTierIndex]
            tierArray.removeAll()
            return scouter
            
        default :
            // 5티어만 나오게끔 랜덤으로
            for scouter in scouters {
                if scouter.tier == 5 {
                    tierArray.append(scouter)
                }
            }
            let randomTierIndex: Int = Int.random(in: 0...tierArray.count-1)
            scouter = tierArray[randomTierIndex]
            tierArray.removeAll()
            return scouter
        }
        
    }
}
