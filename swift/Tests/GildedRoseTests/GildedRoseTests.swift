@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func test_foo() throws {
        let app = makeSUT(itemName: "foo", itemSellIn: 0, itemQuality: 0)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "foo, -1, 0")
    }
    
    func test_backstagePasses() throws {
        let app = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", itemSellIn: 0, itemQuality: 0)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Backstage passes to a TAFKAL80ETC concert, -1, 0")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(itemName: String, itemSellIn: Int, itemQuality: Int) -> GildedRose {
        let item = Item(name: itemName, sellIn: itemSellIn, quality: itemQuality)
        return GildedRose(items: [item])
    }
}

private extension GildedRose {
    var itemsDescription: String { items[0].description }
}
