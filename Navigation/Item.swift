//
//  Item.swift
//  Navigation
//
//  Created by Karan Singh on 01/03/24.
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
