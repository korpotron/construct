@testable import Slots
import SwiftUI
import Testing

struct SlotItemTests {
    @Test func `initializer missing 1`() throws {
        let sut = SlotItem.missing { _ in }
        let (symbol, _) = try #require(sut.store.storage.first)

        #expect(symbol.name == "MissingSymbol")
    }

    @Test func `initializer missing 2`() throws {
        let sut = SlotItem.missing {}
        let (symbol, _) = try #require(sut.store.storage.first)

        #expect(symbol.name == "MissingSymbol")
    }

    @Test func `initializer some 1`() throws {
        let sut = SlotItem(for: SomeSymbol.self) { _ in }
        let (symbol, _) = try #require(sut.store.storage.first)

        #expect(symbol.name == "SomeSymbol")
    }

    @Test func `initializer some 2`() throws {
        let sut = SlotItem(for: SomeSymbol.self) {}
        let (symbol, _) = try #require(sut.store.storage.first)

        #expect(symbol.name == "SomeSymbol")
    }
}

private enum SomeSymbol {}
