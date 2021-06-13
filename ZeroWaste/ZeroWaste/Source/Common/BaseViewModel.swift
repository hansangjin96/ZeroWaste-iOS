//
//  File.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/06/12.
//  Copyright © 2021 Depromeet. All rights reserved.
//

import Foundation

protocol BaseViewModel {
    associatedtype Input
    
    func apply(_ input: Input)
}
