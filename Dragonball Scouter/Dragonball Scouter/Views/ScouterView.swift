//
//  ScouterView.swift
//  Dragonball Scouter
//
//  Created by 이재승 on 2023/07/09.
//

import SwiftUI

struct ScouterView: View {
    
    var scouterStore: ScouterStore
    let scouter: Scouter
    
    var body: some View {
        ZStack {
            
            Image("Scouter")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack (alignment: .leading){
                    
                    HStack (alignment:.firstTextBaseline) {
                        Text(scouter.name)
                            .font(.largeTitle)
                            .bold()
                        VStack {
                            Text(scouter.race)
                                .bold()
                            Text("▼")
                        }
                    }
                    
                    Text("Power Levels")
                        .font(.title2)
                        .bold()
                    
                    HStack {
                        Text("\(scouter.powerLevels)")
                            .font(.largeTitle)
                            .bold()
                        Text("▲")
                    }
                }
                Text("                      ")
            }
            .foregroundColor(.yellow)

        }
    }
}

struct ScouterView_Previews: PreviewProvider {
    static var previews: some View {
        ScouterView(scouterStore: ScouterStore(), scouter: Scouter(tier: 4, name: "Neppa", race: "Saiyajin", powerLevels: 4000, imageName: "Neppa"))
    }
}
