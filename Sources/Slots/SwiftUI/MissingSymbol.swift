import Foundation

public struct MissingSymbol {
    public let name: String
    public let type: Any.Type

    init(type: Any.Type) {
        name = String(describing: type)
        self.type = type
    }
}
