//
//  MissionTabViewModel.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/12.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation
import Combine
import CancelBag

final class MissionTabViewModel: BaseViewModel, ObservableObject {
    
    // MARK: Action
    
    enum Input {
        case fetchMissionList(place: Mission.Place, theme: Mission.Theme)
    }
    
    // MARK: Mutation
    
    private let fetchMissionSubject: PassthroughSubject<(Mission.Place, Mission.Theme), Never> = .init()
    
    // MARK: State
    
    @Published var missionList: [Mission] = []
    
    // MARK: Property
    
    private let missionService: MissionServiceType
    private var cancelBag = CancelBag() // Set<AnyCancellable>()
    
    // MARK: Init
    
    init(missionService: MissionServiceType) {
        self.missionService = missionService
    }
    
    // MARK: Transform
    
    func apply(_ input: Input) {
        switch input {
        case let .fetchMissionList(place, theme):
            missionService.fetchMissionList(place: place, theme: theme)
                .assign(to: \.missionList, on: self)
                .cancel(with: cancelBag)
        }
    }
}
