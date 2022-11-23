@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func test_foo() throws {
        let app = makeSUT(itemName: "foo", itemSellIn: 0, itemQuality: 0)
        app.updateQuality()
        XCTAssertEqual(app.items[0].name, "foo")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(itemName: String, itemSellIn: Int, itemQuality: Int) -> GildedRose {
        let item = Item(name: itemName, sellIn: itemSellIn, quality: itemQuality)
        return GildedRose(items: [item])
    }
}
