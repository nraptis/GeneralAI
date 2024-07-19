//
//  DataStream.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class DataStream {
    
    var words = [Word]()
    func clone() -> DataStream {
        let result = DataStream()
        for word in words {
            result.words.append(word.clone())
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
            let word = Word(uint16: UInt16(unicodeScalar.value))
            words.append(word)
        }
    }
    
    private let placeholderBit = Bit()
    func getBit(at bitIndex: Int) -> Bit {
        let byteIndex = bitIndex / 16
        if byteIndex >= 0 && byteIndex < words.count {
            let offset = bitIndex % 16
            return words[byteIndex].getBit(at: offset)
        }
        return placeholderBit
    }
    
    
    var string: String {
        words.map { $0.string }.joined()
    }
    
    var uint16s: [UInt16] {
        words.map { $0.uint16 }
    }
   
}
