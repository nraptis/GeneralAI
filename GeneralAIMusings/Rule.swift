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
    func process(bit: Bool) -> [Bool] {
        var output = [Bool]()
        switch self {
        case .dupe:
            output.append(bit)
            output.append(bit)
        case .remove:
            break
        case .copy:
            output.append(bit)
        case .invert:
            output.append(!bit)
        case .one:
            output.append(true)
        case .zero:
            output.append(false)
        }
        return output
    }
}

extension Rule {
    static var random: Rule {
        let choice = Int.random(in: 0...5)
        if choice == 0 { return .dupe }
        else if choice == 0 { return .remove }
        else if choice == 0 { return .copy }
        else if choice == 0 { return .invert }
        else if choice == 0 { return .one }
        else { return .zero }
    }
}
