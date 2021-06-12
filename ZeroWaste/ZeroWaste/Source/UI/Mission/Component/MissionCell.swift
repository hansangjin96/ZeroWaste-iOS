//
//  MissionCell.swift
//  ZeroWaste
//
//  Created by Tim on 2021/04/25.
//

import SwiftUI

struct MissionCell: View {
    
    private let mission: Mission
    
    init(mission: Mission) {
        self.mission = mission
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                // MARK: 미션레벨
                ZStack {
                    Image("iconStar")
                    Text("1")
                        .bold()
                        .foregroundColor(.white)
                }

                // MARK: 미션 주제 / 참가인원
                VStack(alignment: .leading, spacing: 8) {
                    Text(mission.name)
                        .font(.system(18, .heavy))
                        .lineLimit(2)

                    HStack {
                        Image("iconPerson")

                        Text(mission.creater.nickname)
                            .font(.system(13, .regular))

                        Divider()
                            .frame(height: 10)

                        Text("\(mission.inProgressCount)")
                            .font(.system(13, .regular))
                    }
                }
                Spacer()
            }

            Spacer()
                .frame(height: 24)

            // MARK: 카테고리 / 좋아요
            HStack(alignment: .bottom) {
                ForEach(mission.theme, id: \.self) { theme in
                    CategoryCell(theme: theme)
                }
                
                Spacer()
                Image("iconHeart")
                    .renderingMode(.template)
                    .foregroundColor(.blue)
                    .padding(.vertical, 6)
            }
        }
        .padding()
        .background(Color.zWhite)
        .cornerRadius(16)
    }
}

struct MissionCell_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(ColorScheme.allCases, id: \.self) {
            MissionCell(mission: Mission(
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
                .previewLayout(.sizeThatFits)
//                .preferredColorScheme($0)
//        }

    }
}
