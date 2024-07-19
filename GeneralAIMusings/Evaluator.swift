//
//  Evaluator.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Evaluator {
    
    var trials = [Trial_OnePlusOne()]
    
    func evaluate(brain: Brain) -> Evaluation {
        
        /*
        if (brain.neurons.count > 0) || (brain.axons.count > 0) {
            var allEvaluations = [Evaluation]()
            for trial in trials {
                
                let result = brain.process(dataStream: trial.input)
                let evaluation = evaluate(dataStreamInput: trial.input, dataStreamOutput: trial.expectedOutput)
                
                if result.bytes.count > 0 {
                    print("Trial [\(trial.input.string)] => [\(result.bytes.map { $0.uint8 } )], \(evaluation) (Brain had \(brain.neurons.count) neurons and \(brain.axons.count) axons")
                }
            }
            
            if allEvaluations.count > 0 {
                return allEvaluations[0]
            }
        }
        */
        
        
        return .feasible(.high)
    }
    
    func evaluate(dataStreamInput: DataStream, dataStreamOutput: DataStream) -> Evaluation {
        
        /*
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
        */
        
        return Evaluation.useless(.low)
    }
}
