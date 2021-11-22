import Foundation

extension StringEncoder {
    public static func pure(_ a: List<Character>) -> Self {
        StringEncoder { _ in .success(a) }
    }
}
