@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func test_foo() throws {
        let app = makeSUT(itemName: "foo")
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "foo, -1, 0")
    }
    
    func test_fooWithSellIn() throws {
        let app = makeSUT(itemName: "foo", itemSellIn: 10)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "foo, 9, 0")
    }
    
    func test_fooWithQuality() throws {
        let app = makeSUT(itemName: "foo", itemQuality: 50)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "foo, -1, 48")
    }
    
    func test_fooWithSellInAndQuality() throws {
        let app = makeSUT(itemName: "foo", itemSellIn: 10, itemQuality: 50)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "foo, 9, 49")
    }
    
    func test_backstagePasses() throws {
        let app = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert")
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Backstage passes to a TAFKAL80ETC concert, -1, 0")
    }
    
    func test_backstagePassesWithSellIn() throws {
        let app = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", itemSellIn: 10)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Backstage passes to a TAFKAL80ETC concert, 9, 2")
    }
    
    func test_backstagePassesWithQuality() throws {
        let app = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", itemQuality: 50)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Backstage passes to a TAFKAL80ETC concert, -1, 0")
    }
    
    func test_backstagePassesWithSellInAndQuality() throws {
        let app = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", itemSellIn: 10, itemQuality: 50)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Backstage passes to a TAFKAL80ETC concert, 9, 50")
    }
    
    func test_backstagePassesWithSellIn20AndQuality40() throws {
        let app = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", itemSellIn: 20, itemQuality: 40)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Backstage passes to a TAFKAL80ETC concert, 19, 41")
    }
    
    func test_backstagePassesWithSellIn6AndQuality40() throws {
        let app = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", itemSellIn: 6, itemQuality: 40)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Backstage passes to a TAFKAL80ETC concert, 5, 42")
    }
    
    func test_backstagePassesWithSellIn5AndQuality40() throws {
        let app = makeSUT(itemName: "Backstage passes to a TAFKAL80ETC concert", itemSellIn: 5, itemQuality: 40)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Backstage passes to a TAFKAL80ETC concert, 4, 43")
    }
    
    func test_sulfuras() throws {
        let app = makeSUT(itemName: "Sulfuras, Hand of Ragnaros")
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Sulfuras, Hand of Ragnaros, 0, 0")
    }
    
    func test_sulfurasWithSellIn() throws {
        let app = makeSUT(itemName: "Sulfuras, Hand of Ragnaros", itemSellIn: 10)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Sulfuras, Hand of Ragnaros, 10, 0")
    }
    
    func test_sulfurasWithSellInAndQuality() throws {
        let app = makeSUT(itemName: "Sulfuras, Hand of Ragnaros", itemSellIn: 10, itemQuality: 50)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Sulfuras, Hand of Ragnaros, 10, 50")
    }
    
    func test_sulfurasWithSellInAndQuality40() throws {
        let app = makeSUT(itemName: "Sulfuras, Hand of Ragnaros", itemSellIn: 10, itemQuality: 40)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Sulfuras, Hand of Ragnaros, 10, 40")
    }
    
    func test_agedBrie() throws {
        let app = makeSUT(itemName: "Aged Brie")
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Aged Brie, -1, 2")
    }
    
    func test_agedBrieWithSellIn() throws {
        let app = makeSUT(itemName: "Aged Brie", itemSellIn: 10)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Aged Brie, 9, 1")
    }
    
    func test_agedBrieWithSellInAndQuality() throws {
        let app = makeSUT(itemName: "Aged Brie", itemSellIn: 10, itemQuality: 100)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Aged Brie, 9, 100")
    }
    
    func test_agedBrieWithSellInAndQuality50() throws {
        let app = makeSUT(itemName: "Aged Brie", itemSellIn: 10, itemQuality: 50)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Aged Brie, 9, 50")
    }
    
    func test_agedBrieWithSellInAndQuality40() throws {
        let app = makeSUT(itemName: "Aged Brie", itemSellIn: 10, itemQuality: 40)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Aged Brie, 9, 41")
    }
    
    func test_agedBrieWithQuality40() throws {
        let app = makeSUT(itemName: "Aged Brie", itemQuality: 40)
        app.updateQuality()
        XCTAssertEqual(app.itemsDescription, "Aged Brie, -1, 42")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(itemName: String, itemSellIn: Int = 0, itemQuality: Int = 0) -> GildedRose {
        let item = Item(name: itemName, sellIn: itemSellIn, quality: itemQuality)
        return GildedRose(items: [item])
    }
}

private extension GildedRose {
    var itemsDescription: String { items[0].description }
}
