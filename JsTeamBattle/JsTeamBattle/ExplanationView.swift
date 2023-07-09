//
//  ExplanationView.swift
//  JsTeamBattle
//
//  Created by 이재승 on 2023/07/02.
//

import SwiftUI

struct ExplanationView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image("explanationJs")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100.0)
                    Text("EJS")
                }
                Text("Hello! I am explanationJs, EJS. I will teach you about this game. You are HeroJs, HJS, and enermy is a DarkJs, DJS. You have to fight DJS, using your spirits. You have 3 spirits. Fire is strong against grass. and Water is strong against Fire.. It is seems like a RPS Game. Finally, You have Super Sprit. It wins every sprits. but I don't know how to use it, Good luck Friend!")
            }
            .padding()
            
            Image("gameExplanation")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 400.0)
            
            NavigationLink {
                GameView()
            } label: {
                Text("< Go Battle! >")
                    .bold()
            }
        }.navigationTitle("Explanation!")
    }
}

struct ExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExplanationView()
        }
    }
}
