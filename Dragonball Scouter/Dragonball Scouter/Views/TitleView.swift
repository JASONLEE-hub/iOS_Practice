//
//  TitleView.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/09.
//

import SwiftUI

// 타이틀 뷰입니다.
struct TitleView: View {
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Image("DragonballLOGO")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Power Scouter")
                    .font(.largeTitle)
                    .bold()
                
                // Q. 버튼으로 뷰를 넘길 수는 없을까요?
                NavigationLink {
                    MainView()
                } label: {
                    Text("PRESS START")
                }
                
                Image("TitleBottomScouter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
