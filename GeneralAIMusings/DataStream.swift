//
//  DataStream.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class DataStream<WordType: Wordable> {
    
    var words = [WordType]()
    func clone() -> DataStream {
        let result = DataStream()
        for word in words {
            result.words.append(word)
        }
        return result
    }
    
    var bitCount: Int {
        words.count * 16
    }
    
    init() {
        
    }
    
    init(string: String) {
        for unicodeScalar in string.unicodeScalars {
            let word = WordType(value: UInt32(unicodeScalar.value))
            words.append(word)
        }
    }
    
    func getBit(at bitIndex: Int) -> Bool {
        if WordType.numberOfBits > 0 {
            let byteIndex = bitIndex / WordType.numberOfBits
            if byteIndex >= 0 && byteIndex < words.count {
                let offset = bitIndex % WordType.numberOfBits
                return words[byteIndex].getBit(at: offset)
            }
        }
        return false
    }
    
    
    var string: String {
        words.compactMap { $0.getString() }.joined()
    }
    
    var values: [UInt32] {
        words.map { $0.getValue() }
    }
    
}
