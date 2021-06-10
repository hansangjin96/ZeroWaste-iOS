//
//  MissionListView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/09.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI
import Combine

struct MissionListView: View {
    
    @State private var missionLists: [Mission] = []
    @State private var selectedFilter: Mission.Theme = .all
    @Binding var selectedTab: Mission.Place
    
    var body: some View {
        ZStack {
            Color.zGray5
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("미션 리스트")
                        .font(.kotraBold(18))
                    
                    Spacer()
                }
                .padding(.top, 25)
                .padding(.horizontal)
                filterList
                missionList
            }
        }
    }
    
    var filterList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Mission.Theme.allCases, id: \.self) { tab in
                    Button("\(tab.description)") { 
                        self.selectedFilter = tab
                    }
                    .font(.system(size: 13, weight: .semibold))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 7)
                    .foregroundColor(
                        self.selectedFilter == tab ? .zWhite : .zGray2
                    )
                    .background(
                        self.selectedFilter == tab ? Color.zBlackHole : Color.zWhite
                    )
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.zGray2, lineWidth: 1)
                    )   
                }
            }
            .frame(height: 40)
        }
        .padding(.leading, 15)
    }
    
    var missionList: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
//                ForEach(missionLists, id: \.id) { cell in
                ForEach(0..<10) { cell in
                    NavigationLink(
                        destination: MissionView(),
                        label: {
                            MissionCell()
                        }
                    )
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct MissionListView_Previews: PreviewProvider {
    
    static var previews: some View {
        MissionListView(selectedTab: .constant(.all))
    }
}
