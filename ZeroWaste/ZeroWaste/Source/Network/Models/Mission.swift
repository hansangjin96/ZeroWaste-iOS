//
//  Mission.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/05/23.
//

import Foundation

struct Mission: Codable {
    let id: Int
    let name: String
    let owner: Int
    let place: Place
    let theme: [Theme]
    let difficulty: Difficulty
    let bannerImgUrls: [URL]
    let content: String
    let sentenceForCheer: String
//    let signedUrlNum: Int?
    let likesCount: Int
    let successfulCount: Int
    let inProgressCount: Int
    let creater: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case place
        case theme
        case difficulty
        case bannerImgUrls = "banner_img_urls"
        case content
        case sentenceForCheer = "sentence_for_cheer"
//        case signedUrlNum = "signed_url_num"
        case likesCount = "likes_count"
        case successfulCount = "successful_count"
        case inProgressCount = "in_progress_count"
        case creater
    }
}

extension Mission {
    enum Place: String, Codable {
        case etc
        case kitchen
        case bathroom
        case cafe
        case restaurant
        case outside
    }
    
    enum Difficulty: String, Codable {
        // TODO: 이거 되는지 확인
        case veryEasy = "very_easy"
        case easy
        case medium
        case hard
        case extraHard = "extra_hard"
    }
    
    enum Theme: String, Codable {
        case refuse
        case reduce
        case reuse
        case recycle
        case rot
    }
    
    enum Ordering: String, Codable {
        case recent
        case popularity
        case participation
    }
}
