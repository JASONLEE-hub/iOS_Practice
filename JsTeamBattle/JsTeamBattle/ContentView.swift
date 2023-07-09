//
//  ContentView.swift
//  JsTeamBattle
//
//  Created by 이재승 on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{ // 타이틀 뷰입니다.
            VStack {
                HStack {
                    Image("dTeam")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100)
                    
                    Image("dJs")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200.0)
                }
                
                VStack {
                    Image("jsBattleLogo")
                    
                    NavigationLink {
                        ExplanationView() // 설명 뷰로 넘어갑니다.
                    } label: {
                        Image("startButton")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50.0)
                    }
                    .padding()
                }
                
                HStack() {
                    Image("js")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200.0)
                    
                    Image("team")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 50.0)
                }
                
                Text("I'm looking for some designers, developers... etc") 
                    .bold()
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
