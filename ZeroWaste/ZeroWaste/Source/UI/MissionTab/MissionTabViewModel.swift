//
//  MissionTabViewModel.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/12.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation
import Combine

final class MissionTabViewModel: BaseViewModel, ObservableObject {
    
    // MARK: Event
    
    enum Input {
        case fetchMissionList(place: Mission.Place, theme: Mission.Theme)
    }
    
    enum Output {
        
    }
    
    // MARK: Property
    
    @Published var missionList: [Mission] = []
    
    private let fetchMissionSubject: PassthroughSubject<(Mission.Place, Mission.Theme), Never> = .init()
    
    private let networkService: NetworkManager
    private var bag = Set<AnyCancellable>()
    
    
    
    // MARK: Init
    
    init(networkService: NetworkManager) {
        self.networkService = networkService
        
        bindInput()
        bindOutput()
    }
}

extension MissionTabViewModel {
    func apply(_ input: Input) {
        switch input {
        case let .fetchMissionList(place, theme):
            networkService.request(
                with: .missionsList(place: place == .all ? nil : place, difficulty: nil, theme: theme == .all ? nil : theme, ordering: nil), 
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
            .assign(to: \.missionList, on: self)
            .store(in: &bag)
            
        }
    }
    
    func bindInput() {
        
    }
    
    func bindOutput() {
        
    }
}
