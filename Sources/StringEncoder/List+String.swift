import Foundation
import List

public extension String {
    var charactersList: List<Character> {
        List(self)
    }
}
