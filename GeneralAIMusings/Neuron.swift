//
//  Neuron.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Neuron {
    
    enum NeuronIndex {
        case input
        case output
        case body(Int)
    }
    
    var inputBits = [Bit]()
    var outputBits = [Bit]()
    
    var rules = [Rule]()
    
    /*
    func process() -> [Bit] {
        var result = [Bit]()
        return result
    }
    */
    
    var connections = [Neuron]()
    
    var ruleIndex = 0
    var bitIndex = 0
    
    func clone() -> Neuron {
        
        return Neuron()
    }
    
    func appendByteToInput(byte: Byte) {
        inputBits.append(byte.bit0)
        inputBits.append(byte.bit1)
        inputBits.append(byte.bit2)
        inputBits.append(byte.bit3)
        
        inputBits.append(byte.bit4)
        inputBits.append(byte.bit5)
        inputBits.append(byte.bit6)
        inputBits.append(byte.bit7)
    }
    
}
