//
//  BackstagePassesItemCalculator.swift
//  
//
//  Created by Mihai Andrei Rustiuc on 24.11.2022.
//

import Foundation

public final class BackstagePassesItemCalculator: ItemQualityCalculator {
    
    public override func updateQuality() {
        increaseQuality()

        if isTenDaysOrLess {
            increaseQuality()
        }

        if isFiveDaysOrLess {
            increaseQuality()
        }

        passDay()

        if hasPassedSellDay {
            dropQuality()
        }
    }
    
    private var isTenDaysOrLess: Bool { item.sellIn < 11 }
    private var isFiveDaysOrLess: Bool { item.sellIn < 6 }
    
    private func dropQuality() {
        item.quality = 0
    }
}
