//
//  MissionTabView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/08.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI

struct MissionTabView: View {
    
    @State private var selectedTab: Mission.Place = .all
    @State private var isDraggedUp: Bool = false
    
    var body: some View {
        ZStack {
            Color.zBlack
                .ignoresSafeArea()
            
            VStack {
                missionTabTitle
                    .padding([.leading, .top])
                placeTab
                
                if isDraggedUp.isFalse {
                    ZStack {
                        Image("mission_place_background")
                            .resizable()
                            .scaledToFill()
                        // TODO: 이렇게 짜르면 이미지가 탭을 덮어 탭 제스쳐가 안먹음
//                            .frame(maxHeight: 220)
//                            .clipped()
                        
                        Image("mission_place_\(selectedTab.rawValue)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            
                    }
                    .transition(.opacity)
                }
                
                MissionListView(selectedTab: $selectedTab)
                    .gesture(dragGesture)
                    .cornerRadius(30)
                    .ignoresSafeArea()
            }
        }
    }
    
    private var missionTabTitle: some View {
        HStack {
            Text("장소 별 미션")
                .font(.kotraBold(22))
                .foregroundColor(.zWhite)
            
            Spacer()
        }
    }
    
    // https://github.com/QuynhNguyen/SlidingTabView/blob/master/Sources/SlidingTabView/SlidingTabView.swift
    private var placeTab: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Mission.Place.allCases, id: \.self) { tab in
                    Button(action: {
                        self.selectedTab = tab
                    }) {
                        HStack {
                            Spacer()
                            VStack {
                                Text(tab.description)
                                    .font(.system(size: 15, weight: .semibold))
                                if self.selectedTab == tab {
                                    Color.zMain
                                        .frame(width: 50, height: 3)
                                } else {
                                    Color.zBlack
                                        .frame(width: 50, height: 3)
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical, 16)
                    .foregroundColor(
                        self.selectedTab == tab ? .zMain : .zWhite
                    )
                }
            }
        }
    }
    
    private var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded { value in
                if value.translation.height < 0 && value.translation.width < 100 && value.translation.width > -100 {
                    print("up swipe ended")
                    
                    withAnimation { 
                        isDraggedUp = true
                    }
                }
                
                if value.translation.height > 0 && value.translation.width < 100 && value.translation.width > -100 {
                    print("down swipe")
                    
                    withAnimation { 
                        isDraggedUp = false
                    }
                }
            }
    } 
}

struct MissionTabView_Previews: PreviewProvider {
    static var previews: some View {
        MissionTabView()
    }
}
