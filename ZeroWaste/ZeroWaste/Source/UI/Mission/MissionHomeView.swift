//
//  MissionHomeView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import SwiftUI

struct MissionHomeView: View {
    
    let mission = Mission(
        id: 1,
        name: "테스트 미션", 
        owner: 2,
        place: .etc,
        theme: [.rot],
        difficulty: .veryEasy,
        bannerImgUrls: [
            URL(string: "https://zerowaste-bucket1.s3.amazonaws.com/users/2/QJ6OSKEGVP")!,
            URL(string: "https://zerowaste-bucket1.s3.amazonaws.com/users/2/UKMDY49DHH")!,
            URL(string: "https://zerowaste-bucket1.s3.amazonaws.com/users/2/XYC1E2IJGX")!
        ],
        content: "테스트 미션 설명",
        sentenceForCheer: "호우",
        likesCount: 2,
        successfulCount: 2,
        inProgressCount: 0,
        creater: User(
            id: 2,
            nickname: "hwang",
            level: 1,
            isNotify: true,
            completedMissionCount: 5,
            progressingMissionCount: 2,
            likeMissionCount: 7,
            description: ""
        )
    )
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                // MARK: '진행중인 미션' Section

                Text("오늘도 우쥬를\n지키러 와주셨군요!")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)

                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<3) { _ in
                            NavigationLink(destination: MissionView(mission: mission)) {
                                OngoingMissionCell()
                                    .frame(minWidth: 284)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }

                    }
                    .padding(.horizontal)
                    .frame(height: 134)
                }
                .shadow(radius: 10, y: 8)

                .padding(.bottom)

                // MARK: '참여 가능 미션' Section

                Group {
                    Text("참여 가능한 미션")
                        .font(.title2)
                        .bold()

                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVStack {
                            ForEach(0..<10) { _ in
                                NavigationLink(destination: MissionView(mission: mission)) {
                                    MissionCell(mission: mission)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        //                    .frame(height: 150)
                    }
                }
                .padding(.horizontal)


                Button(action: {
                    // Code
                }) {
                    Text("직접 미션 등록하기")
                }
                .padding()
                .frame(maxWidth: .infinity)

            }

        }
    }
}


struct MissionHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MissionHomeView()
                .navigationBarTitle("미션", displayMode: .inline)
        }

    }
}
