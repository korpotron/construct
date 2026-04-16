@testable import Slots
import SwiftUI
import Testing

@MainActor struct SlotContentBuilderTests {
    @Test func `example 1`() {
        let sut = SlotContentBuilder {
            SlotItem(for: Foo.self) { foo in
                Text(String(describing: foo))
            }
            SlotItem(for: Bar.self) { bar in
                Text(String(describing: bar))
            }
        }

        #expect(sut.store.count == 2)
        #expect(sut.store[Foo.self] != nil)
        #expect(sut.store[Bar.self] != nil)
        #expect(sut.store[Baz.self] == nil)
    }

    @Test func `example 2`() {
        let sut = SlotContentBuilder {
            BazItem()
        }

        #expect(sut.store.count == 1)
        #expect(sut.store[Foo.self] == nil)
        #expect(sut.store[Bar.self] == nil)
        #expect(sut.store[Baz.self] != nil)
    }

    @Test func `example if first`() {
        let sut = SlotContentBuilder {
            if true {
                FooItem()
            } else {
                BazItem()
            }
        }

        #expect(sut.store.count == 1)
        #expect(sut.store[Foo.self] != nil)
        #expect(sut.store[Bar.self] == nil)
        #expect(sut.store[Baz.self] == nil)
    }

    @Test func `example if second`() {
        let sut = SlotContentBuilder {
            if false {
                FooItem()
            } else {
                BazItem()
            }
        }

        #expect(sut.store.count == 1)
        #expect(sut.store[Foo.self] == nil)
        #expect(sut.store[Bar.self] == nil)
        #expect(sut.store[Baz.self] != nil)
    }

    @Test func `example empty`() {
        let sut = SlotContentBuilder {}
        #expect(sut.store.count == 0)
    }
}

private enum Foo {
    case foo1
    case foo2
}

private enum Bar {
    case bar1
    case bar2
}

private enum Baz {
    case baz1
    case baz2
}

private struct FooItem: SlotContent {
    var body: some SlotContent {
        SlotItem(for: Foo.self) { foo in
            Text(String(describing: foo))
        }
    }
}

private struct BazItem: SlotContent {
    var body: some SlotContent {
        SlotItem(for: Baz.self) { baz in
            Text(String(describing: baz))
        }
    }
}
