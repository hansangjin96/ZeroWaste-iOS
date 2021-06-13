//
//  MissionService.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/12.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation
import Combine

protocol MissionServiceType {
    func fetchMissionList(place: Mission.Place, theme: Mission.Theme) -> AnyPublisher<[Mission], Never>
}

final class MissionService: MissionServiceType {
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func fetchMissionList(place: Mission.Place, theme: Mission.Theme) -> AnyPublisher<[Mission], Never> {
        return networkService.request(
            with: .missionsList(place: place, theme: theme), 
            for: ResultBase<[Mission]>.self
        )
        .catch { error -> Empty<ResultBase<[Mission]>, Never> in
            print("error occurred", error, error.localizedDescription)
            return .init()
        }
        .map { response -> [Mission] in
            print(response)
            
            guard response.errorCode.hasNoError else { return [] }
            
            return response.data
        }
        .eraseToAnyPublisher()
    }
}
