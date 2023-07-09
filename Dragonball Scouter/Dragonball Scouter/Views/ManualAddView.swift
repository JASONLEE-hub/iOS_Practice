//
//  ManualAddView.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/09.
//

import SwiftUI

struct ManualAddView: View {
    
    var scouterStore: ScouterStore
    @State var name: String = ""
    @State var race: String = ""
    @State var powerLevels: Int = 0
    
    @Binding var isShowingAddSheet: Bool
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            
            ZStack { // Zstack으로 텍스트와 렌즈 겹치기
                Image("ScouterLensBig")
                    .resizable()
                    .frame(height: 600.0)
                    .aspectRatio(contentMode: .fit)
                
                VStack (alignment: .leading) {
                    Group {
                        Text("Write a name")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.yellow)
                        TextField("Name", text: $name)
                            .font(.largeTitle)
                        
                        Text("Write a race")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.yellow)
                        TextField("Race", text: $race)
                            .font(.largeTitle)
                        
                        Text("Checking a power")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.yellow)
                        Text("\(powerLevels)")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.yellow)
                    }
                    // 이미지 오른쪽 정렬하고 싶다.
                    Image("Unknown")
                        .resizable()
                        .frame(width: 130.0, height: 150.0)
                    
                }
                .padding()
            }
        }
        
        // Power Level 체크 버튼
        .toolbar {
            ToolbarItem(placement:.bottomBar) {
                ZStack (alignment: .bottom) {
                    Image("ScouterStick1")
                        .resizable()
                        .frame(width: 400.0, height: 120.0)
                    
                    Button {
                        powerLevels = Int.random(in: 1...500)
                    } label: {
                        ZStack {
                            Image("ScouterStick2")
                                .resizable()
                                .frame(width: 350.0, height: 80.0)
                            
                            Text("Power Check")
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
                    scouterStore.AddScouter(tier: 5, name: name, race: race, powerLevels: Int(powerLevels), ImageName: "Unknown")
                    isShowingAddSheet = false
                    // 저장 및 시트 내리기
                } label: {
                    Text("⌨︎")
                        .font(.largeTitle)
                }

            }
            
            ToolbarItem(placement:.navigationBarLeading) {
                Button {
                    isShowingAddSheet = false
                    // 시트 내리기
                } label: {
                    Text("🁢")
                        .font(.largeTitle)
                }

            }
            
        }
        .navigationTitle("Manual Finder")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ManualAddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ManualAddView(scouterStore: ScouterStore(), isShowingAddSheet: .constant(true))
        }
    }
}
