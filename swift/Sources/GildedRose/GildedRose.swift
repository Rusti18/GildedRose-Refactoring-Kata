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
        let qualityCalculator: ItemQualityCalculator
        
        switch item.name {
        case "Aged Brie": qualityCalculator = AgedBrieItemQualityCalculator(item: item)
        case "Sulfuras, Hand of Ragnaros": qualityCalculator = SulfurasItemQualityCalculator(item: item)
        case "Backstage passes to a TAFKAL80ETC concert": qualityCalculator = BackstagePassesItemCalculator(item: item)
        default: qualityCalculator = ItemQualityCalculator(item: item)
        }
        
        qualityCalculator.updateQuality()
    }
}
