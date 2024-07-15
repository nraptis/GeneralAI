//
//  DataStream.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class DataStream {
    
    var bytes = [Byte]()
    func clone() -> DataStream {
        let result = DataStream()
        for byte in bytes {
            result.bytes.append(byte.clone())
        }
        return result
    }
    
    var bitCount: Int {
        bytes.count * 8
    }
    
    private let placeholderBit = Bit()
    func getBit(at bitIndex: Int) -> Bit {
        let byteIndex = bitIndex / 8
        if byteIndex >= 0 && byteIndex < bytes.count {
            let offset = bitIndex % 8
            return bytes[byteIndex].getBit(at: offset)
        }
        return placeholderBit
    }
    
    
    var string: String {
        bytes.map { $0.string }.joined()
    }
    
    var uint8s: [UInt8] {
        bytes.map { $0.uint8 }
    }
   
}
