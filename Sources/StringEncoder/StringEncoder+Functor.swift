import Foundation

extension StringEncoder {
    public func map(_ transform: @escaping (List<Character>) -> List<Character>) -> Self {
        StringEncoder { input in
            switch self.encode(input) {
            case .success(let list):
                return .success(transform(list))
            case .failure(let failure):
                return .failure(failure)
            }
        }
    }
}
