//
//  MissionView.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import SwiftUI

struct MissionView: View {
    
    private let mission: Mission
    
    init(mission: Mission) {
        self.mission = mission
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    Text("{n}" + "회 인증 완료")
                        .font(.system(13, .regular))
                        .foregroundColor(.zBlackHole)

                    Text(mission.name)
                        .font(.kotraBold(22))
                        .bold()

                    CategoryCell(theme: mission.theme.first ?? .rot)

                    VStack(alignment: .leading) {

                        Text("걸리는 기간")
                        Text(mission.content) // 미션 설명
                        Text(mission.sentenceForCheer)

                        Divider()
                            .padding()

                        Text("리워드")
                            .font(.title)
                            .bold()
                            .padding(.vertical, 8)

                        Text("게이지 10 상승 / 00뱃지 획득 / 등등")
                    }
                    .padding(.bottom, 120)


                }
            }
            .padding(.horizontal)
            .padding(.top)

            VStack {
                Spacer()
                Button(action: {
                }, label: {
                    Text("참여하기")
                })
                .buttonStyle(CTAButtonStyle())
                .padding()
            }

        }
        
    }
}

struct MissionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionView(mission: Mission(
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
        ))
    }
}
