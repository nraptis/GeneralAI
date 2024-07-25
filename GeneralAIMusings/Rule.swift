//
//  Rule.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

enum Rule<WordType: Wordable> {
    
    case dupe
    case remove
    case copy
    case invert
    case one
    case zero
    
    case and
    case or
    case xor
    case equal
    
    func getNumberOfWordsRequired() -> Int {
        switch self {
        case .and:
            return 2
        case .or:
            return 2
        case .xor:
            return 2
        case .equal:
            return 2
        default:
            return 1
        }
    }
    
    func process(words: [WordType]) -> [WordType] {
        var result = [WordType]()
        switch self {
        case .dupe:
            if words.count > 0 {
                result.append(words[0])
                result.append(words[0])
            }
        case .remove:
            break
        case .copy:
            if words.count > 0 {
                result.append(words[0])
            }
        case .invert:
            if words.count > 0 {
                result.append(words[0].invert())
            }
        case .one:
            result.append(WordType(value: 1))
        case .zero:
            result.append(WordType(value: 0))
        case .and:
            if words.count > 1 {
                result.append(words[0].and(words[1]))
            }
        case .or:
            if words.count > 1 {
                result.append(words[0].and(words[1]))
            }
        case .xor:
            if words.count > 1 {
                result.append(words[0].xor(words[1]))
            }
        case .equal:
            if words.count > 1 {
                result.append(words[0].equals(words[1]))
            }
        }
        return result
    }
}

extension Rule {
    static var random: Rule {
        let choice = Int.random(in: 0...9)
        if choice == 0 { return .dupe }
        else if choice == 1 { return .remove }
        else if choice == 2 { return .copy }
        else if choice == 3 { return .invert }
        else if choice == 4 { return .one }
        else if choice == 5 { return .zero }
        else if choice == 6 { return .and }
        else if choice == 7 { return .or }
        else if choice == 8 { return .xor }
        else { return .equal }
    }
}
