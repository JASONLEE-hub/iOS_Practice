//
//  AutoAddView.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/09.
//

import SwiftUI
import AVFoundation

struct AutoAddView: View {
    // 에러해결, 인덱스 에러로 확인, AutoAddScouter에서 -1을 해주어야했다.
    var scouterStore: ScouterStore
    @ObservedObject var autoScouterStore: AutoScouterStore = AutoScouterStore()
    @State var scouter: Scouter = Scouter(tier: 5, name: "", race: "", powerLevels: 0, imageName: "")
    
    @Binding var isShowingAutoAddSheet: Bool
    
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
        
        // 전사 찾기 버튼
        .toolbar {
            ToolbarItem(placement:.bottomBar) {
                ZStack (alignment: .bottom) {
                    Image("ScouterStick1")
                        .resizable()
                        .frame(width: 400.0, height: 120.0)
                    
                    Button {
                        scouter = autoScouterStore.AutoAddScouter()
                        
                    } label: {
                        ZStack {
                            Image("ScouterStick2")
                                .resizable()
                                .frame(width: 350.0, height: 80.0)
                            
                            Text("Find the warrior")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }
            // 네비게이션 탑 버튼
            ToolbarItem(placement:.navigationBarTrailing) {
                Button {
                    scouterStore.AddScouter(tier: scouter.tier, name: scouter.name, race: scouter.race, powerLevels: Int(scouter.powerLevels), ImageName: scouter.imageName)
                    isShowingAutoAddSheet = false
                    // 저장 및 시트 내리기
                } label: {
                    Text("⌨︎")
                        .font(.largeTitle)
                }
                
            }
            
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    isShowingAutoAddSheet = false
                    // 시트 내리기
                } label: {
                    Text("🁢")
                        .font(.largeTitle)
                }
                
            }
            
        }
        .navigationTitle("Auto Finder")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AutoAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AutoAddView(scouterStore: ScouterStore(), isShowingAutoAddSheet: .constant(true))
        }
    }
}
