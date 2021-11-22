import Foundation

extension StringEncoder {
    public func count(_ n: UInt) -> Self {
        map { list in
            List(repeating: list, count: n).flatMap { $0 }
        }
    }
}
