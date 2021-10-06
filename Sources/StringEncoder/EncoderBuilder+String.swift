import Foundation

public extension EncoderBuilder {
    typealias StringComponent = Result<List<Character>, EncodingFailure>
    
    static func buildBlock() -> StringComponent {
        .success(.empty)
    }
    
    static func buildExpression(_ expression: UInt8) -> StringComponent {
        .success("\(expression)".charactersList)
    }
    
    static func buildExpression(_ expression: UInt16) -> StringComponent {
        .success("\(expression)".charactersList)
    }
    
    static func buildExpression(_ expression: UInt32) -> StringComponent {
        .success("\(expression)".charactersList)
    }
    
    static func buildExpression(_ expression: UInt64) -> StringComponent {
        .success("\(expression)".charactersList)
    }
    
    static func buildExpression(_ expression: String) -> StringComponent {
        .success(expression.charactersList)
    }
    
    static func buildExpression(_ expression: Character) -> StringComponent {
        .success(List.init(head: expression))
    }
    
    static func buildExpression(_ expression: List<Character>) -> StringComponent {
        .success(expression)
    }
    
    static func buildExpression<T: Encodable>(_ expression: T) -> Result<List<T.Primitive>, T.Failure> where T.Primitive == Character, T.Failure == EncodingFailure {
        expression.encoded
    }
    
    static func buildExpression<T: StringEncodable>(_ expression: T) -> StringComponent {
        expression.stringEncoded
    }
}
