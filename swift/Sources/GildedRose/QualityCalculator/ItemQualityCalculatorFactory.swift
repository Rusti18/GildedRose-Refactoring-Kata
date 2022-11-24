//
//  ItemQualityCalculatorFactory.swift
//  
//
//  Created by Mihai Andrei Rustiuc on 24.11.2022.
//

import Foundation

public enum ItemQualityCalculatorFactory {
    public static func createItemQualityCalculator(item: Item) -> ItemQualityCalculator {
        let qualityCalculator: ItemQualityCalculator
        
        switch item.name {
        case "Aged Brie": qualityCalculator = AgedBrieItemQualityCalculator(item: item)
        case "Sulfuras, Hand of Ragnaros": qualityCalculator = SulfurasItemQualityCalculator(item: item)
        case "Backstage passes to a TAFKAL80ETC concert": qualityCalculator = BackstagePassesItemCalculator(item: item)
        default:
            if item.name.starts(with: "Conjured") {
                qualityCalculator = ConjuredItemQualityCalculator(item: item)
            } else {
                qualityCalculator = ItemQualityCalculator(item: item)
            }
        }
        
        return qualityCalculator
    }
}
