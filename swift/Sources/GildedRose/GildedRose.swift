public class GildedRose {
    var items: [Item]
    
    // MARK: - Init

    public init(items: [Item]) {
        self.items = items
    }
    
    // MARK: - Public Functions

    public func updateQuality() {
        items.forEach { updateQuality(for: $0) }
    }
    
    // MARK: - Helpers
    
    private func updateQuality(for item: Item) {
        switch item.name {
        case "Aged Brie": updateQualityForAgedBrieItem(item: item)
        case "Sulfuras, Hand of Ragnaros": updateQualityForSulfuras(item: item)
        case "Backstage passes to a TAFKAL80ETC concert": updateQualityForBackstagePassItem(item: item)
        default: updateQualityForOther(item: item)
        }
    }
    
    private func updateQualityForAgedBrieItem(item: Item) {
        if item.quality < 50 {
            item.quality = item.quality + 1
        }
        
        item.sellIn = item.sellIn - 1
        
        if item.sellIn < 0 {
            if item.quality < 50 {
                item.quality = item.quality + 1
            }
        }
    }
    
    private func updateQualityForBackstagePassItem(item: Item) {
        if item.quality < 50 {
            item.quality = item.quality + 1

            if item.sellIn < 11 {
                if item.quality < 50 {
                    item.quality = item.quality + 1
                }
            }

            if item.sellIn < 6 {
                if item.quality < 50 {
                    item.quality = item.quality + 1
                }
            }
        }

        item.sellIn = item.sellIn - 1

        if item.sellIn < 0 {
            item.quality = item.quality - item.quality
        }
    }
    
    private func updateQualityForSulfuras(item: Item) {}
    
    private func updateQualityForOther(item: Item) {
        if item.quality > 0 {
            item.quality = item.quality - 1
        }

        item.sellIn = item.sellIn - 1

        if item.sellIn < 0 {
            if item.quality > 0 {
                item.quality = item.quality - 1
            }
        }
    }
}
