//
//  DetailView.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/13.
//

import SwiftUI
import AVFoundation

struct DetailView: View {
    
    var scouterStore: ScouterStore
    var scouter: Scouter
    
    var body: some View {
        VStack(alignment: .trailing) {
            
            ZStack { // Zstack으로 텍스트와 렌즈 겹치기
                Image("ScouterLensBig")
                    .resizable()
                    .frame(height: 600.0)
                    .aspectRatio(contentMode: .fit)
                
                VStack (alignment: .leading) {
                    Group {
                        
                        Text("Name")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.yellow)
                        Text(scouter.name)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.yellow)
                        Text("")
                        
                        Text("Race")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.yellow)
                        Text(scouter.race)
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.yellow)
                        Text("")
                        
                        Text("Checking a power")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.yellow)
                        Text("\(scouter.powerLevels)")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.yellow)
                    }
                    // 이미지 오른쪽 정렬하고 싶다.
                    Image(scouter.imageName)
                        .resizable()
                        .frame(width: 130.0, height: 150.0)
                    
                }
                .padding()
            }
        }
        
        // 수정 버튼
        .toolbar {
            ToolbarItem(placement:.bottomBar) {
                ZStack (alignment: .bottom) {
                    Image("ScouterStick1")
                        .resizable()
                        .frame(width: 400.0, height: 120.0)
                    
                    Button {
                        // 구현 필요, 아이디어, isdisable같은 메서드 사용?으로 텍스트 필드와 텍스트 껐다 켜기.
                    } label: {
                        ZStack {
                            Image("ScouterStick2")
                                .resizable()
                                .frame(width: 350.0, height: 80.0)
                            
                            Text("Change the details")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
        }
        .navigationTitle("\(scouter.name)'s Details")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scouterStore: ScouterStore(), scouter: Nappa)
        }
    }
}
