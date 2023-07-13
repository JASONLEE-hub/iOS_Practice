//
//  ViewController.swift
//  MixLang
//
//  Created by 이재승 on 2023/07/13.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var numberLabel: UILabel!
    
    // obj-c에서 가져올 함수
    let calc: MixCalc = MixCalc()
    // textField로 보내줄 string값
    var numberString: String = ""
    // textField로 보내줄 string값
    var numberString2: String = ""
    // 계산에 들어갈 첫번째 숫자
    var number1: Int = 0
    // 계산에 들어갈 두번째 숫자
    var number2: Int = 0
    // 계산 결과 숫자
    var resultNumber: Int = 0
    // 계산 함수에 넣을 버튼 라벨 가져오는 값
    var calButtonLabel: String = ""
    // 첫번째 숫자가 있어야지만 계산 함수가 돌아가게끔 체크할 불값
    var calcCheck: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MixCalc는 참조타입인 class로 선언되어서
        // let으로 만든 존재에 할당해서
        // 그 위치만 계속 알려줘도, 내용은 활용할 수 있다. (추가, 삭제,...)

    }
    
    // 숫자 넣는 함수
    @IBAction func numButton(_ sender: UIButton) {
        // 버튼 라벨에 숫자를 가져온다
        let buttonLabel = sender.titleLabel?.text
        
        // 숫자 입력이 0부터 시작할 경우 무시
        guard numberString != "0" else {
            return
        }
        print("잘 들어옴")
        
        // 계산 버튼을 눌렀는지, 안 눌렀는지에 따라 하는 것이 다름.
        //
        if !calcCheck {
            numberString += buttonLabel ?? "안먹음"
            numberLabel.text = numberString
            number1 = Int(numberString) ?? 0
        } else {
            // 두번째 숫자 처음에는 지우고 두번째는
            numberString2 += buttonLabel ?? "안먹음"
            numberLabel.text = numberString2
            number2 = Int(numberString2) ?? 0
        }
    }
    

    // 계산 버튼 누를 시, 버튼 라벨에 계산 string값 주기
    @IBAction func calcButton(_ sender: UIButton) {
        
        guard number1 != 0 else {
            return
        }
        
        calButtonLabel = sender.titleLabel?.text ?? ""
        calcCheck = true
    }
    
    // 숫자가 다 들어오고 계산 라벨 체크하여 결과 전달
    @IBAction func resultButton(_ sender: UIButton) {
        
        guard number1 != 0 && number2 != 0 else {
            return
        }
        
        switch calButtonLabel {
        case "+" :
            resultNumber = Int(calc.plus(Int32(number1), with: Int32(number2)))
        case "-" :
            resultNumber = Int(calc.minus(Int32(number1), with: Int32(number2)))
        case "*" :
            resultNumber = Int(calc.multiply(Int32(number1), with: Int32(number2)))
        case "/" :
            resultNumber = Int(calc.divide(Int32(number1), with: Int32(number2)))
        default :
            break
        }
        calcCheck = false
        numberLabel.text = String(resultNumber)
    }

    // 초기화 버튼
    @IBAction func resetButton(_ sender: UIButton) {
        numberLabel.text = "0"
        numberString = ""
        numberString2 = ""
        number1 = 0
        number2 = 0
        resultNumber = 0
        calButtonLabel = ""
        
        calcCheck = false
    }
    
}

