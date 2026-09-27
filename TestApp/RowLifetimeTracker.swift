//
//  RowLifetimeTracker.swift
//  TestApp
//
//  Created by Sam on 27/09/2026.
//

import Foundation

final class RowLifetimeTracker {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Init: \(id)")
    }
    
    deinit {
        print("Deinit: \(id)")
    }
}
