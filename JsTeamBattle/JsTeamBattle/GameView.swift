//
//  GameView.swift
//  JsTeamBattle
//
//  Created by 이재승 on 2023/07/02.
//

import SwiftUI

struct GameView: View {
    @State private var dJsHealth: Double = 10000 // 챗 gpt에게 질문하여 HP바를 구현하였습니다..
    let maxDjsHealth: Double = 10000
    @State private var hJsHealth: Double = 3000
    let maxHjsHealth: Double = 3000
    
    @State private var dJsMessage: String = "Come on..me"
    @State private var hJsMessage: String = "Go!"
    @State private var dJsDMMessage: String = ""
    @State private var hJsDMMessage: String = ""
    @State private var centerMessage: String = "Choose a sprit!"
    @State private var dJsSPMessage: String = ""
    @State private var hJsSPMessage: String = "" // 화면에 나오는 다양한 상호작용 메세지입니다.
    
    @State var damage: Double = 0
    
    @State private var dJsStatus: String = "dJs"
    @State private var hJsStatus: String = "js"
    
    @State private var dJsSprit: String = ""
    @State private var hJsSprit: String = ""
    
    let dJsSprits: [String] = ["dFireJs", "dWaterJs", "dGlassJs"]
    let hJsSprits: [String] = ["fireJs", "waterJs", "glassJs"] // 이미지 변경을 string 값을 변경하여 진행하였습니다. 이를 위한 변수, 상수입니다.
    
    @State private var regameBool: Bool = true
    @State private var messageColor: [Color] = [.red, .blue, .green, .purple, .yellow]
    @State private var dJsColorIndex: Int = 3
    @State private var hJsColorIndex: Int = 4 // 다시시작 버튼을 게임종료시만 사용할 수 있게 필요한 변수, 텍스트 색 변경을 위한 변수입니다.
    
    var body: some View {
        VStack {
            HStack { // DJS, 어둠의 내면 구현입니다..
                VStack(alignment: .leading){
                    
                    Text("DJS / HP : \(Int(dJsHealth))")
                        .bold()
                    
                    HealthBarView(health: dJsHealth, maxHealth: maxDjsHealth)
                        .frame(height: 20)
                    
                    Text(dJsMessage)
                        .font(.title)
                        .bold()
                    
                    Text(dJsDMMessage)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.red)
                    
                }
                .padding()
                
                Image(dJsStatus)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 155.0)
            }
            
            HStack {
                Text(dJsSPMessage)
                    .font(.title3)
                    .bold()
                    .foregroundColor(messageColor[dJsColorIndex])
                    .padding()
                
                Image(dJsSprit) // DJS Sprit, 어둠의 내면의 스피릿입니다.
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100.0)
            }
            
            Button { // regameButton or message, 상황 설명 메시지 또는 다시시작 버튼입니다.
                reset()
            } label: {
                Text(centerMessage)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.red)
            }.disabled(regameBool)
            
            HStack {
                Image(hJsSprit) // HJS Sprit, 빛의 내면의 스피릿입니다.
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 130.0)
                
                Text(hJsSPMessage)
                    .font(.title3)
                    .bold()
                    .foregroundColor(messageColor[hJsColorIndex])
                    .padding()
            }
            
            HStack {
                Button { // 스피릿 선택 버튼입니다.
                    spritAttack(sprit: "fireJs")
                } label: {
                    Text("Fire")
                }
                .frame(width: 50, height: 30)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(.red)
                
                Button {
                    spritAttack(sprit: "waterJs")
                } label: {
                    Text("Water")
                }
                .frame(width: 50, height: 30)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(.blue)
                
                Button {
                    spritAttack(sprit: "glassJs")
                } label: {
                    Text("Glass")
                }
                .frame(width: 50, height: 30)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(.green)
            }
            .padding()
            
            HStack { // HJS, 빛의 내면 구현입니다..
                
                Image(hJsStatus)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150.0)
                
                VStack(alignment: .trailing){
                    
                    Text(hJsDMMessage)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.red)
                    
                    Text(hJsMessage)
                        .font(.title)
                        .bold()
                    
                    Text("HJS / HP : \(Int(hJsHealth))")
                        .bold()
                    
                    HealthBarView(health: hJsHealth, maxHealth: maxHjsHealth)
                        .frame(height: 20)
                    
                }.padding()
            }
//            .navigationTitle("Battle!")
            
        }
    }
    
    func reset() { // reset 함수입니다.
        dJsHealth = 10000
        hJsHealth = 3000
        centerMessage = "New Game"
        dJsStatus = "dJs"
        hJsStatus = "js"
        dJsMessage = "Come again.. me"
        hJsMessage = "OK! Go!"
        dJsDMMessage = ""
        hJsDMMessage = ""
        dJsSPMessage = ""
        hJsSPMessage = ""
        dJsSprit = ""
        hJsSprit = ""
    }
    
    func overCheck() { // 게임이 종료하였는지 체크하는 함수입니다.
        guard dJsHealth > 0 && hJsHealth > 0 else {
            if dJsHealth < 1 {
                dJsHealth = 0
                centerMessage = "REGAME?"
                regameBool = false
                dJsMessage = "Loser!"
                hJsMessage = "Winner!"
            } else {
                hJsHealth = 0
                centerMessage = "REGAME?"
                regameBool = false
                dJsMessage = "Winner!"
                hJsMessage = "Loser!"
            }
            return
        }
    }
    
    func spritAttack(sprit: String) {
        // 스피릿 선택 버튼을 누를시 호출하는 게임을 진행시키는 중요한 함수입니다.
        guard dJsHealth > 0 && hJsHealth > 0 else {
            if dJsHealth < 1 {
                dJsHealth = 0
                centerMessage = "REGAME?"
                regameBool = false
                dJsMessage = "Loser!"
                hJsMessage = "Winner!"
            } else {
                hJsHealth = 0
                centerMessage = "REGAME?"
                regameBool = false
                dJsMessage = "Winner!"
                hJsMessage = "Loser!"
            }
            return
        }
        
        // 특정 HP 미만으로 떨어질시, 전설 스피릿 이벤트가 발생합니다.
        if dJsHealth < 4000 {
            dJsSprit = "dLegendJs"
            hJsSprit = "legendJs"
        } else if hJsHealth < 1500 {
            dJsSprit = "dLegendJs"
            hJsSprit = "legendJs"
        } else {
            dJsSprit = dJsSprits.randomElement()!
            hJsSprit = sprit
        }
        
        // 함수를 호출할 때마다 메세지를 초기화합니다.
        centerMessage = "VS"
        dJsStatus = "dJs"
        hJsStatus = "js"
        dJsDMMessage = ""
        hJsDMMessage = ""
        
        // if와 switch를 활용하여, 상성 배틀, 이미지, 메세지 변경 구현
        if hJsSprit == "fireJs" { // fireJs, waterJs, glassJs
            hJsSPMessage = "Fire Ball!"
            hJsColorIndex = 0
            switch dJsSprit { // dFireJs, dWaterJs, dGlassJs
            case "dFireJs" :
                dJsColorIndex = 0
                dJsMessage = "Go Away!"
                hJsMessage = "Go!"
                dJsSPMessage = "Fire Ball!"
                dJsDMMessage = "Draw!"
                hJsDMMessage = "Draw!"
            case "dWaterJs" :
                dJsColorIndex = 1
                damage = Double.random(in: 700...1500)
                dJsSPMessage = "Water Magic!"
                dJsMessage = "HA HA!"
                hJsMessage = "No!"
                hJsDMMessage = "-\(Int(damage))"
                hJsHealth -= damage
                hJsStatus = "damaged_js"
                overCheck()
            case "dGlassJs" :
                dJsColorIndex = 2
                dJsSPMessage = "Glass Boom!"
                hJsMessage = "Yes!"
                dJsMessage = "NO!"
                damage = Double.random(in: 700...3000)
                dJsDMMessage = "-\(Int(damage))"
                hJsMessage = "Fire Ball!"
                dJsHealth -= damage
                dJsStatus = "damaged_dJs"
                overCheck()
            default :
                break
            }
        } else if hJsSprit == "waterJs" {
            hJsSPMessage = "Water Magic!"
            hJsColorIndex = 1
            switch dJsSprit { // dFireJs, dWaterJs, dGlassJs
            case "dFireJs" :
                dJsColorIndex = 0
                dJsSPMessage = "Fire Ball!"
                hJsMessage = "Yes!"
                dJsMessage = "NO!"
                damage = Double.random(in: 700...3000)
                dJsDMMessage = "-\(Int(damage))"
                hJsMessage = "Water Magic!"
                dJsHealth -= damage
                dJsStatus = "damaged_dJs"
                overCheck()
            case "dWaterJs" :
                dJsColorIndex = 1
                dJsMessage = "Go Away!"
                hJsMessage = "Go!"
                dJsSPMessage = "Water Magic!"
                dJsDMMessage = "Draw!"
                hJsDMMessage = "Draw!"
            case "dGlassJs" :
                dJsColorIndex = 2
                dJsSPMessage = "Glass Boom!"
                dJsMessage = "HA HA!"
                hJsMessage = "No!"
                damage = Double.random(in: 700...1500)
                dJsMessage = "Glass Boom!"
                hJsDMMessage = "-\(Int(damage))"
                hJsHealth -= damage
                hJsStatus = "damaged_js"
                overCheck()
            default :
                break
            }
        } else if hJsSprit == "glassJs" {
            hJsSPMessage = "Glass Boom!"
            hJsColorIndex = 2
            switch dJsSprit { // dFireJs, dWaterJs, dGlassJs
            case "dFireJs" :
                dJsColorIndex = 0
                dJsSPMessage = "Fire Ball!"
                dJsMessage = "HA HA!"
                hJsMessage = "No!"
                damage = Double.random(in: 700...1500)
                dJsMessage = "Fire Ball!"
                hJsDMMessage = "-\(Int(damage))"
                hJsHealth -= damage
                hJsStatus = "damaged_js"
                overCheck()
            case "dWaterJs" :
                dJsColorIndex = 1
                dJsSPMessage = "Fire Ball!"
                hJsMessage = "Yes!"
                dJsMessage = "NO!"
                damage = Double.random(in: 700...3000)
                dJsDMMessage = "-\(Int(damage))"
                hJsMessage = "Water Magic!"
                dJsHealth -= damage
                dJsStatus = "damaged_dJs"
                overCheck()
            case "dGlassJs" :
                dJsColorIndex = 2
                dJsMessage = "Go Away!"
                hJsMessage = "Go!"
                dJsSPMessage = "Glass Boom!"
                dJsDMMessage = "Draw!"
                hJsDMMessage = "Draw!"
            default :
                break
            }
        } else { // legend Sprit
            centerMessage = "Legend Sprit"
            hJsColorIndex = 4
            hJsColorIndex = 3
            
            // 0,1의 랜덤 Int를 활용하여, 누가 데미지를 받을지를 정합니다.
            
            let damageWho: Int = Int.random(in: 0...1)
            if damageWho < 1 { // damaged_dJs
                let luck: Int = Int.random(in: 1...10)
                
                // 10분의 1의 확률로 큰 데미지를 줍니다.
                
                if luck < 10 {
                    damage = Double.random(in: 1500...5000)
                    dJsDMMessage = "-\(Int(damage))"
                    hJsSPMessage = "Hero Blast!"
                    hJsMessage = "Hero Blast!"
                    dJsSPMessage = "oh no!"
                    dJsMessage = "What?!"
                    dJsHealth -= damage
                    dJsStatus = "damaged_dJs"
                    overCheck()
                } else { // luck == 10
                    damage = Double.random(in: 25000...100000)
                    dJsDMMessage = "-\(Int(damage))"
                    hJsSPMessage = "Hero BigBang!"
                    hJsMessage = "Hero BigBang!"
                    dJsSPMessage = "oh no!"
                    dJsMessage = "What?!"
                    dJsHealth -= damage
                    dJsStatus = "damaged_dJs"
                    overCheck()
                }
            } else { // damaged_hJs
                let luck: Int = Int.random(in: 1...10)
                if luck < 10 {
                    damage = Double.random(in: 5000...7000)
                    dJsSPMessage = "Dark Blast!"
                    dJsMessage = "Dark Blast!"
                    hJsSPMessage = "dark..."
                    hJsMessage = "Are you Okay?"
                    hJsDMMessage = "-\(Int(damage))"
                    hJsHealth -= damage
                    hJsStatus = "damaged_js"
                    overCheck()
                } else { // luck == 10
                    damage = Double.random(in: 25000...100000)
                    dJsSPMessage = "Dark BigBang!"
                    dJsMessage = "Dark BigBang!"
                    hJsSPMessage = "dark..."
                    hJsMessage = "Are you Okay?"
                    hJsDMMessage = "-\(Int(damage))"
                    hJsHealth -= damage
                    hJsStatus = "damaged_js"
                    overCheck()
                }
            }
        }
    }
    
} // View Over

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            GameView()
        }
    }
}

struct HealthBarView: View { // 챗 gpt에게 질문하여 HP바를 구현하였습니다..
    let health: Double
    let maxHealth: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.red)
                
                Rectangle()
                    .frame(width: min(self.health / self.maxHealth * geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(.green)
            }
        }
    }
}


