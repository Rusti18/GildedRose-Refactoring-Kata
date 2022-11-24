//
//  AgedBrieItemQualityCalculator.swift
//  
//
//  Created by Mihai Andrei Rustiuc on 24.11.2022.
//

import Foundation

public final class AgedBrieItemQualityCalculator: ItemQualityCalculator {
    
    public override func updateQuality() {
        increaseQuality()
        
        passDay()
        
        if hasPassedSellDay {
            increaseQuality()
        }
    }
}
