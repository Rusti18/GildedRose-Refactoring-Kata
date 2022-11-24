//
//  ItemQualityCalculator.swift
//  
//
//  Created by Mihai Andrei Rustiuc on 24.11.2022.
//

import Foundation

public class ItemQualityCalculator {
    
    public let item: Item
    
    public init(item: Item) {
        self.item = item
    }
    
    public func updateQuality() {
        decreaseQuality()

        passDay()

        if hasPassedSellDay {
            decreaseQuality()
        }
    }
    
    public func increaseQuality() {
        if item.quality < 50 {
            item.quality = item.quality + 1
        }
    }
    
    public func decreaseQuality() {
        if item.quality > 0 {
            item.quality = item.quality - 1
        }
    }
    
    public func passDay() {
        item.sellIn = item.sellIn - 1
    }
    
    public var hasPassedSellDay: Bool {
        item.sellIn < 0
    }
}
