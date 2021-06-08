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
    private let tabs: [Mission.Place] = [.all, .kitchen, .cafe, .restaurant, .etc]
    
    var body: some View {
        ZStack {
            Color.zBlack
                .ignoresSafeArea()
            
            // https://github.com/QuynhNguyen/SlidingTabView/blob/master/Sources/SlidingTabView/SlidingTabView.swift
            VStack {
                HStack {
                    ForEach(self.tabs, id: \.self) { tab in
                        Button(action: {
//                            let selection = self.tabs.firstIndex(of: tab) ?? 0
//                            self.selectionState = selection
                        }) {
                            HStack {
                                Spacer()
                                Text(tab.description)
                                Spacer()
                            }
                        }
                        .padding(.vertical, 16)
                        .foregroundColor(.zWhite)
//                        .accentColor(
//                            self.isSelected(tabIdentifier: tab)
//                                ? self.activeAccentColor
//                                : self.inactiveAccentColor
//                        )
//                        .background(
//                            self.isSelected(tabIdentifier: tab)
//                                ? self.activeTabColor
//                                : self.inactiveTabColor)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct MissionTabView_Previews: PreviewProvider {
    static var previews: some View {
        MissionTabView()
    }
}
