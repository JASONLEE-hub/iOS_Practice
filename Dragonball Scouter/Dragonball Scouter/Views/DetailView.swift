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
    @State var scouter: Scouter
    
    @State var isChanging = false
    @State var isRemoving = false
    
    let speechSynth = AVSpeechSynthesizer()
    
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
                    
                    // 이름 및 전투력 읽어주기
                    Button {
                        readSomething(speechSynth: speechSynth, something: "\(scouter.name)...센토우료쿠\(scouter.powerLevels)")
                    } label: {
                        Image(scouter.imageName)
                            .resizable()
                            .frame(width: 130.0, height: 150.0)
                    }
            
                }
                .padding()
            }
        }
        
        
        .toolbar {
            ToolbarItem(placement:.bottomBar) {
                ZStack {
                    Image("ScouterStick1")
                        .resizable()
                        .frame(width: 400.0, height: 120.0)
                    
                    HStack {
                        // 현재 전사를 새로운 전사로 변경하기 버튼
                        Button {
                            isChanging = true
                            readSomething(speechSynth: speechSynth, something: "Are you okay?")
                        } label: {
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .font(.title)
                                .bold()
                        }
                        .frame(width: 110.0, height: 80.0)
                        .background(.gray)
                        .alert("Are you sure you want to change the warrior?", isPresented: $isChanging) {
                            Button("Cancel", role: .cancel) {}
                            Button("Yes", role: .destructive) {
                                self.scouter = scouterStore.changeScouter(scouter: scouter)}
                        }
                        
                        Text(" ")
                        
                        Button {
                            // 현재 전사를 삭제 버튼
                            isRemoving = true
                            readSomething(speechSynth: speechSynth, something: "Are you okay?")
                        } label: {
                            Image(systemName: "trash.circle")
                                .font(.title)
                                .bold()
                        }
                        .frame(width: 110.0, height: 80.0)
                        .background(.gray)
                        .alert("Are you sure you want to remove the warrior?", isPresented: $isRemoving) {
                            Button("Cancel", role: .cancel) {}
                            Button("Yes", role: .destructive) {
                                scouterStore.removeScouter(scouter: scouter)
                                // Q. 삭제 후 MainView로 돌리고 싶었지만, NavigationLink를 사용하여 되돌릴 방법이 없었습니다. Yes 클릭시 MainView로 돌아갈 수 있을까요?
                            }
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
