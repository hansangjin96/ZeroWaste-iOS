//
//  MissionTabView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/08.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI

struct MissionTabView: View {
    
    @ObservedObject private var viewModel: MissionTabViewModel
    @State private var selectedPlaceTab: Mission.Place = .all
    @State private var selectedThemeTab: Mission.Theme = .all
    @State private var isDraggedUp: Bool = false
    
    init(viewModel: MissionTabViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
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
                        
                        Image("mission_place_\(selectedPlaceTab.rawValue)")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                        
                    }
                    .transition(.opacity)
                }
                
                missionView
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
                        self.selectedPlaceTab = tab
                        viewModel.apply(.fetchMissionList(place: selectedPlaceTab, theme: selectedThemeTab))
                    }) {
                        HStack {
                            Spacer()
                            VStack {
                                Text(tab.description)
                                    .font(.system(size: 15, weight: .semibold))
                                if self.selectedPlaceTab == tab {
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
                        self.selectedPlaceTab == tab ? .zMain : .zWhite
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
    
    private var missionView: some View {
        ZStack {
            Color.zGray5
                .ignoresSafeArea()
            
            VStack {
                missionListTitleView
                filterListView
                missionListView
            }
        }
        .onAppear {
            viewModel.apply(.fetchMissionList(place: selectedPlaceTab, theme: selectedThemeTab))
        }
    }
    
    private var missionListTitleView: some View {
        HStack {
            Text("미션 리스트")
                .font(.kotraBold(18))
            
            Spacer()
        }
        .padding(.top, 25)
        .padding(.horizontal)
    }
    
    private var filterListView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Mission.Theme.allCases, id: \.self) { tab in
                    Button("\(tab.description)") { 
                        self.selectedThemeTab = tab
                        self.viewModel.apply(.fetchMissionList(place: selectedPlaceTab, theme: selectedThemeTab))
                    }
                    .font(.system(size: 13, weight: .semibold))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 7)
                    .foregroundColor(
                        self.selectedThemeTab == tab ? .zWhite : .zGray2
                    )
                    .background(
                        self.selectedThemeTab == tab ? Color.zBlackHole : Color.zWhite
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
    
    private var missionListView: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.missionList, id: \.id) { mission in
                    NavigationLink(
                        destination: MissionView(mission: mission),
                        label: {
                            MissionCell(mission: mission)
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

struct MissionTabView_Previews: PreviewProvider {
    static var previews: some View {
        MissionTabView(viewModel: .init(networkService: .init()))
    }
}
