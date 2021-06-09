//
//  MissionListView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/09.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI

struct MissionListView: View {
    var body: some View {
        NavigationView {
            VStack {
                filterList
                missionList
            }
            .navigationTitle("미션 리스트")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    var filterList: some View {
        ScrollView(.horizontal) {
            LazyHStack {
//                ForEach(Mission.Theme.allCases) { theme in
//                    Button(theme.description) { 
//                        // code
//                    }
//                }
                
                ForEach(0..<Mission.Theme.allCases.count) { index in
                    Button("\(Mission.Theme.allCases[index].description)") { 
                        // code
                    }
                    .padding(.horizontal)
                    .foregroundColor(.zGray2)
                    
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.zGray2, lineWidth: 1))
                    .frame(width: 70, height: 30)
//                    .border(Color.zGray2)
//                    .cornerRadius(50)
//                    .clipShape(Capsule())
                }
//                .padding(10)
            }
            .frame(height: 50)
        }
    }
    
    var missionList: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { cell in
                    NavigationLink(
                        destination: MissionView(),
                        label: {
                            MissionCell()
                        }
                    )
                }
            }
        }
    }
}

struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}
