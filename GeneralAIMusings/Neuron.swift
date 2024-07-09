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
    
}
