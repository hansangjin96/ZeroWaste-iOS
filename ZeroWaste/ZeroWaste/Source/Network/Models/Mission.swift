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
        case likesCount = "likes_count"
        case successfulCount = "successful_count"
        case inProgressCount = "in_progress_count"
        case creater
    }
}

extension Mission {
    enum Place: String, Codable, CaseIterable {
        case all
        case kitchen
        case cafe
        case restaurant
        case etc
        
        case bathroom
        case outside
        
        var description: String {
            switch self {
            case .all: return "전체"
            case .kitchen: return "주방"
            case .cafe: return "카페"
            case .restaurant: return "식당"
            case .etc: return "기타"
            case .bathroom: return "화장실"
            case .outside: return "실외"
            }
        }
    }
    
    enum Difficulty: String, Codable {
        case veryEasy = "very_easy"
        case easy
        case medium
        case hard
        case extraHard = "extra_hard"
    }
    
    enum Theme: String, Codable, CaseIterable {
        case all
        case refuse
        case reduce
        case reuse
        case recycle
        case rot
        
        var description: String {
            switch self {
            case .all: return "전체"
            case .refuse: return "거절하기"
            case .reduce: return "줄이기"
            case .reuse: return "재사용"
            case .recycle: return "재활용"
            case .rot: return "썩히기"
            }
        }
    }
    
    enum Ordering: String, Codable {
        case recent
        case popularity
        case participation
    }
}
