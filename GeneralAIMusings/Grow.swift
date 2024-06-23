//
//  Grow.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Grow {
    
    
    let input = DataStream()
    
    let brain = Brain()
    
    let evaluator = Evaluator()
    
    init() {
        
        let inputByte1 = Byte()
        inputByte1.bit0.value = true
        inputByte1.bit1.value = false
        inputByte1.bit2.value = false
        inputByte1.bit3.value = false
        inputByte1.bit4.value = true
        inputByte1.bit5.value = true
        inputByte1.bit6.value = false
        inputByte1.bit7.value = false
        
        let inputByte2 = Byte()
        inputByte2.bit0.value = true
        inputByte2.bit1.value = true
        inputByte2.bit2.value = false
        inputByte2.bit3.value = true
        inputByte2.bit4.value = false
        inputByte2.bit5.value = true
        inputByte2.bit6.value = false
        inputByte2.bit7.value = false
        
        let inputByte3 = Byte()
        inputByte3.bit0.value = true
        inputByte3.bit1.value = false
        inputByte3.bit2.value = false
        inputByte3.bit3.value = false
        inputByte3.bit4.value = true
        inputByte3.bit5.value = true
        inputByte3.bit6.value = false
        inputByte3.bit7.value = false
        
        input.bytes.append(inputByte1)
        input.bytes.append(inputByte2)
        input.bytes.append(inputByte3)
    }
    
    func run() {
        var bestResult = EvaluationResult()
        var bestBrain = brain.clone()
        for _ in 0...0 {
            
            brain.evolve()
            
            let output = brain.process(dataStream: input)
            let evaluation = evaluator.evaluate(dataStreamInput: input, dataStreamOutput: output)
            
            if evaluation < bestResult.evaluation {
                print("Bad Evolve")
                
                
                brain.restore(brain: bestBrain)
            } else {
                print("Good Evolve")
             
                bestBrain = brain.clone()
                bestResult.outputStream = output
                bestResult.evaluation = evaluation
            }
        }
    }
}
