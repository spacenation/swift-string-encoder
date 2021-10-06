import Foundation
@_exported import Encoder

public typealias StringEncoder<Element> = Encoder<Element, Character>

public protocol StringEncodable {
    static var stringEncoder: StringEncoder<Self> { get }
}

public extension StringEncodable {
    var stringEncoded: StringEncodingResult {
        Self.stringEncoder(self)
    }
}
