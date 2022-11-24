public class GildedRose {
    var items: [Item]
    let qualityCalculatorFactory: (Item) -> ItemQualityCalculator
    
    // MARK: - Init

    public init(items: [Item], qualityCalculatorFactory: @escaping (Item) -> ItemQualityCalculator = { ItemQualityCalculatorFactory.createItemQualityCalculator(item: $0) }) {
        self.items = items
        self.qualityCalculatorFactory = qualityCalculatorFactory
    }
    
    // MARK: - Public Functions

    public func updateQuality() {
        items.forEach { updateQuality(for: $0) }
    }
    
    // MARK: - Helpers
    
    private func updateQuality(for item: Item) {
        let calculator = qualityCalculatorFactory(item)
        calculator.updateQuality()
    }
}
