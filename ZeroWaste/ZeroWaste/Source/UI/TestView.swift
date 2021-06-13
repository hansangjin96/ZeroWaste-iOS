//
//  TestView.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/07.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import SwiftUI
import Combine

struct TestView: View {
    @State private var showDetails = false

        var body: some View {
            HStack {
                ForEach(0..<3) { _ in
                    Image("icon_character_would_you")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.zBlack, lineWidth: 2)
                        )
                        .overlay(
                            Circle()
                                .stroke(Color.zBlack, lineWidth: 2)
                                .padding(5)
                        )
                }
            }
//            VStack {
//                Button("Press to show details") {
//                    withAnimation {
//                        showDetails.toggle()
//                    }
//                }
//
//                if showDetails {
//                    // Moves in from the bottom
//                    Text("Details go here.")
//                        .transition(.move(edge: .bottom))
//
////                    // Moves in from leading out, out to trailing edge.
////                    Text("Details go here.")
////                        .transition(.slide)
////
////                    // Starts small and grows to full size.
////                    Text("Details go here.")
////                        .transition(.scale)
//                }
//            }
        }
    
//    var body: some View {
//        var bag = Set<AnyCancellable>()
//        Button("Test") {
//            NetworkManager().request(with: .missionsList(), for: ResultBase<[Mission]>.self)
//                .sink { 
//                    print("sink \($0)")
//                } receiveValue: { 
//                    print("receive \($0)")
//                }
//                .store(in: &bag)
//        }
//    }
    
//    @State private var currentPosition: CGSize = .zero
//    @State private var newPosition: CGSize = .zero
//    
//    var body: some View {
//        // 2.
//        Circle()
//            .frame(width: 100, height: 100)
//            .foregroundColor(Color.red)
//            .offset(x: self.currentPosition.width, y: self.currentPosition.height)
//            .gesture(
//                DragGesture(minimumDistance: 0, coordinateSpace: .local)
//                    .onEnded { value in
//                        if value.translation.height < 0 && value.translation.width < 100 && value.translation.width > -100 {
//                            print("up swipe ended")
//                        }
//                    }
//            )
//            // 3.
////            .gesture(DragGesture()
////                        .onChanged { value in
////                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
////                        }   // 4.
////                        .onEnded { value in
////                            self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
////                            print(self.newPosition.width)
////                            self.newPosition = self.currentPosition
////                        }
////            )
//    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
