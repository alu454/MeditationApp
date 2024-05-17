//
//  Item.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
