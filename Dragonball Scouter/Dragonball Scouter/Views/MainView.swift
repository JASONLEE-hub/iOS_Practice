//
//  MainView.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/09.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var scouterStore: ScouterStore = ScouterStore()
    
    @State var isShowingAddSheet: Bool = false
    @State var isShowingAutoAddSheet: Bool = false
    
    var body: some View {
        VStack {
            List (scouterStore.scouters) { scouter in
                ScouterView(scouterStore: scouterStore, scouter: scouter)
            }
            .navigationTitle("Scouter")
            .listStyle(.plain)
            // ManualAdd
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingAddSheet = true
                    } label: {
                        Text("◼︎")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    
                }
            }
            
            Spacer()
            // AutoAdd
                .toolbar {
                    ToolbarItem(placement:.bottomBar) {
                        ZStack (alignment: .bottom) {
                            Image("ScouterStick1")
                                .resizable()
                                .frame(width: 400.0, height: 120.0)
                            
                            Button {
                                isShowingAutoAddSheet = true
                                // 랜덤 전사 서치
                            } label: {
                                ZStack {
                                    Image("ScouterStick2")
                                        .resizable()
                                        .frame(width: 350.0, height: 80.0)
                                    
                                    Text("Searching")
                                        .font(.largeTitle)
                                        .bold()
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $isShowingAddSheet) {
                    NavigationStack {
                        ManualAddView(scouterStore: scouterStore, isShowingAddSheet: $isShowingAddSheet)
                    }
                }
                .sheet(isPresented: $isShowingAutoAddSheet) {
                    NavigationStack {
                        AutoAddView(scouterStore: scouterStore, isShowingAutoAddSheet: $isShowingAutoAddSheet)
                    }
                }
            
            
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
        }
    }
}
