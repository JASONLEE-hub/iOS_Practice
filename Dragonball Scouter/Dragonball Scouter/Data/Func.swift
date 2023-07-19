//
//  Func.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/13.
//

import Foundation
import AVFoundation
// 추가로 사용하는 함수입니다.


// 읽기 기능을 사용하기 위한 함수입니다.
func readSomething(speechSynth: AVSpeechSynthesizer, something: String) {
    let utterance = AVSpeechUtterance(string: something)
    print("읽어주기 함수 실행중")
    speechSynth.speak(utterance)
}

// 스카우터 전사 리스트를 정렬하기 위한 함수입니다.
func scouterSort(scouters: [Scouter]) -> [Scouter]{
    // scouter 스트럭트의 powerLevels Int 프로퍼티 멤버를 내림차순 기준으로 scouter 스트럭트를 정렬
    // 기준이 powerlevels
    // for문으로 powerlevels 체크
    
    var powerLevelsArray: [Int] = []
    
    // 새 배열에 파워레벨을 넣는다.
    for scouter in scouters {
        powerLevelsArray.append(scouter.powerLevels)
    }
    
    // 배열에 중복을 제거해준다.
    var removedArray: [Int] = []
    
    for powerLevel in powerLevelsArray {
        if removedArray.contains(powerLevel) == false {
            removedArray.append(powerLevel)
        }
    }
    
    // 파워레벨 정렬
    removedArray.sort { a, b in
        return a > b
    }
    
    print("\(removedArray)")
    
    // return하기 위한 새 배열
    var newScouterArray: [Scouter] = []
    
    for powerLevel in removedArray {
        for scouter in scouters {
            if powerLevel == scouter.powerLevels {
                newScouterArray.append(scouter)
            }
        }
    }
    
    return newScouterArray
}
