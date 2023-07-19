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
    
    // 전사 수동 추가시 사용하는 메서드입니다.
    func AddScouter(tier: Int, name: String, race: String, powerLevels: Int, ImageName: String) {
        // 데이터가 0이 아닐 시 사용 가능합니다.
        if name.count > 0 && race.count > 0 && powerLevels > 0 {
            let scouter: Scouter = Scouter(tier: tier, name: name, race: race, powerLevels: powerLevels, imageName: ImageName)
            scouters.insert(scouter, at: 0)
        }
    }
    
    // 전사 삭제시 사용하는 메서드입니다.
    func removeScouter(scouter: Scouter) {
        var index: Int = 0
        
        for tempScouter in scouters {
            if tempScouter.id == scouter.id {
                scouters.remove(at: index)
                break
            }
            index += 1
        }
    }
    
    // 전사 변경시 사용하는 메서드입니다.
    func changeScouter(scouter: Scouter) -> Scouter {
        var index: Int = 0
        // 밑에 정의한 스카우터 자동 전사 찾기 메서드를 사용했습니다.
        let newScouter: Scouter = AutoScouterStore().AutoAddScouter()
        
        for tempScouter in scouters {
            if tempScouter.id == scouter.id {
                scouters.remove(at: index)
                scouters.insert(newScouter, at: index)
                return newScouter
            }
            index += 1
        }
        // View에 바로 반영하기 위해 Scouter로 return하였습니다.
        return scouter
    }
    
}

// 스카우터 자동 전사 찾기 기능을 위한 클래스입니다.
class AutoScouterStore: ObservableObject {
    @Published var scouters: [Scouter] = AutoScouters
    
    func AddScouter(tier: Int, name: String, race: String, powerLevels: Int, ImageName: String) {
        if name.count > 0 && race.count > 0 && powerLevels > 0 {
            let scouter: Scouter = Scouter(tier: tier, name: name, race: race, powerLevels: powerLevels, imageName: ImageName)
            scouters.insert(scouter, at: 0)
        }
    }
    
    // 스카우터 자동 전사 찾기 기능을 위한 메서드입니다.
    func AutoAddScouter() -> Scouter {
        let scouter: Scouter
        var tierArray: [Scouter] = []
        
        // 각 전사는 티어를 가지고 있고, 티어에 맞춰 전사가 나오는 확률을 다르게 하기 위해 코드를 짜보았습니다.
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
            let randomTierIndex: Int = Int.random(in: 0..<tierArray.count)
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
            let randomTierIndex: Int = Int.random(in: 0..<tierArray.count)
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
            let randomTierIndex: Int = Int.random(in: 0..<tierArray.count)
            scouter = tierArray[randomTierIndex]
            tierArray.removeAll()
            return scouter
            
        case 100 :
            // 1티어만 나오게끔 랜덤으로
            for scouter in scouters {
                if scouter.tier == 1 {
                    tierArray.append(scouter)
                }
            }
            let randomTierIndex: Int = Int.random(in: 0..<tierArray.count)
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
            let randomTierIndex: Int = Int.random(in: 0..<tierArray.count)
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
            let randomTierIndex: Int = Int.random(in: 0..<tierArray.count)
            scouter = tierArray[randomTierIndex]
            tierArray.removeAll()
            return scouter
        }
        
    }
}
