import Foundation

@resultBuilder public struct StringEncoderBuilder {
    public typealias Component = Result<List<Character>, StringEncoderFailure>
    
    public static func buildExpression(_ expression: Component) -> Component {
        expression
    }
    
    public static func buildExpression(_ expression: UInt8) -> Component {
        .success("\(expression)".charactersList)
    }
    
    public static func buildExpression(_ expression: UInt16) -> Component {
        .success("\(expression)".charactersList)
    }
    
    public static func buildExpression(_ expression: UInt32) -> Component {
        .success("\(expression)".charactersList)
    }
    
    public static func buildExpression(_ expression: UInt64) -> Component {
        .success("\(expression)".charactersList)
    }
    
    public static func buildExpression(_ expression: String) -> Component {
        .success(expression.charactersList)
    }
    
    public static func buildExpression(_ expression: Character) -> Component {
        .success(List.init(head: expression))
    }
    
    public static func buildExpression(_ expression: List<Character>) -> Component {
        .success(expression)
    }
    
    public static func buildExpression(_ expression: StringEncoder<Void>) -> Component {
        expression()
    }
    
    public static func buildExpression<T: StringEncodable>(_ expression: T) -> Component {
        expression.stringEncoded
    }
    
    public static func buildEither(first component: Component) -> Component {
        component
    }
    
    public static func buildEither(second component: Component) -> Component {
        component
    }
    
    public static func buildBlock() -> Component {
        .success(.empty)
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        components.reduce(.success(.empty), +)
    }
}

public func +<Failure, Primitive>(lhs: Result<List<Primitive>, Failure>, rhs: Result<List<Primitive>, Failure>) -> Result<List<Primitive>, Failure> {
    lhs.flatMap { s1 in
        rhs.flatMap { s2 in
            .success(s1.append(s2))
        }
    }
}
