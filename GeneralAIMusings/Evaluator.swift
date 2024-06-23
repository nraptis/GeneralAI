//
//  Evaluator.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Evaluator {
    
    func evaluate(dataStreamInput: DataStream, dataStreamOutput: DataStream) -> Evaluation {
        
        let expectedByte = Byte()
        expectedByte.bit0.value = false
        expectedByte.bit1.value = true
        expectedByte.bit2.value = false
        expectedByte.bit3.value = false
        expectedByte.bit4.value = true
        expectedByte.bit5.value = true
        expectedByte.bit6.value = false
        expectedByte.bit7.value = false
        
        var doesAnyByteMatchExpectedByte = false
        for byte in dataStreamOutput.bytes {
            if byte == expectedByte {
                doesAnyByteMatchExpectedByte = true
            }
        }
        
        if doesAnyByteMatchExpectedByte {
            if dataStreamOutput.bytes.count == 1 {
                // This is an exact match...
                return Evaluation.correct(.high)
            } else if dataStreamOutput.bytes.count == 2 {
                return Evaluation.feasible(.high)
            } else if dataStreamOutput.bytes.count == 3 {
                return Evaluation.feasible(.low)
            } else {
                return Evaluation.useless(.high)
            }
        }
        
        if dataStreamOutput.bytes.count == 1 {
            return Evaluation.feasible(.medium)
        } else if dataStreamOutput.bytes.count == 2 {
            return Evaluation.feasible(.low)
        } else if dataStreamOutput.bytes.count == 3 {
            return Evaluation.useless(.high)
        } else if dataStreamOutput.bytes.count == 4 {
            return Evaluation.useless(.medium)
        } 
        
        return Evaluation.useless(.low)
    }
}
