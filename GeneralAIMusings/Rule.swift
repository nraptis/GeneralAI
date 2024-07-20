//
//  Rule.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

// The whole idea of this is to keep the "Rules"
// very simple. 

enum Rule {
    
    case dupe
    case remove
    case copy
    case invert
    case one
    case zero
    
    case and
    case or
    case xor
    case swap
    case equal
    
    var isTwoBitRule: Bool {
        switch self {
        case .and:
            return true
        case .or:
            return true
        case .xor:
            return true
        case .swap:
            return true
        case .equal:
            return true
        default:
            return false
        }
    }
    
    func processTwoBits(firstBit: Bool, secondBit: Bool) -> [Bool] {
        var output = [Bool]()
        switch self {
        case .and:
            output.append(firstBit && secondBit)
        case .or:
            output.append(firstBit || secondBit)
        case .xor:
            output.append(firstBit != secondBit)
        case .swap:
            output.append(firstBit)
            output.append(secondBit)
        case .equal:
            output.append(firstBit == secondBit)
        default:
            break
        }
        return output
    }
    
    func processSingleBit(bit: Bool) -> [Bool] {
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
        default:
            break
        }
        return output
    }
}

extension Rule {
    static var random: Rule {
        let choice = Int.random(in: 0...10)
        if choice == 0 { return .dupe }
        else if choice == 1 { return .remove }
        else if choice == 2 { return .copy }
        else if choice == 3 { return .invert }
        else if choice == 4 { return .one }
        else if choice == 5 { return .zero }
        else if choice == 6 { return .and }
        else if choice == 7 { return .or }
        else if choice == 8 { return .xor }
        else if choice == 9 { return .swap }
        else { return .equal }
    }
}
