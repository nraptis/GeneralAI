//
//  Rule.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

// The whole idea of this is to keep the "Rules"
// very simple. 

@frozen enum Rule {
    case dupe
    case remove
    case copy
    case invert
    case one
    case zero
    func process(bit: Bit) -> [Bit] {
        var output = [Bit]()
        switch self {
        case .dupe:
            output.append(bit.clone())
            output.append(bit.clone())
        case .remove:
            break
        case .copy:
            output.append(bit.clone())
        case .invert:
            output.append(bit.cloneAndInvert())
        case .one:
            output.append(Bit.one)
        case .zero:
            output.append(Bit.zero)
        }
        return output
    }
}
