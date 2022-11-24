//
//  ConjuredItemQualityCalculator.swift
//  
//
//  Created by Mihai Andrei Rustiuc on 24.11.2022.
//

import Foundation

public final class ConjuredItemQualityCalculator: ItemQualityCalculator {
    override public func decreaseQuality() {
        if item.quality > 0 {
            item.quality = max(item.quality - 2, 0)
        }
    }
}
