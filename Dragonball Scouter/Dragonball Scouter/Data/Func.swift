//
//  Func.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/13.
//

import Foundation
import AVFoundation
// 추가 함수

func readSomething(something: String) {
    // 읽어주기 기능 추가를 위해, 현재 못읽어줌.. 원인파악필요
    let speechSynth = AVSpeechSynthesizer()
    let utterance = AVSpeechUtterance(string: something)
    print("읽어주기 함수 실행중")
    speechSynth.speak(utterance)
}
