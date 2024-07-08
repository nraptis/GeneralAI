//
//  Brain.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Brain {
    
    
    
    var inputNeuron = Neuron()
    var outputNeuron = Neuron()
    var pulseCount = 0
    
    var neurons = [Neuron]()
    
    var outputBits = [Bit]()
    
    func evolve() {
        
        
        pulseCount = 100
        //+= Int.random(in: -5...5)
        
    }
    
    func breed(mate: Brain) -> Brain {
        return Brain()
    }
    
    func mutate() -> Brain {
        return Brain()
    }
    
    func removeNeuron(at index: Int) {
        if index >= 0 && index < neurons.count {
            neurons.remove(at: index)
        }
    }
    
    func addNeuron(_ neuron: Neuron) {
        neurons.append(neuron)
    }
    
    func clone() -> Brain {
        let result = Brain()
        
        
        return result
    }
    
    func restore(brain: Brain) {
        
    }
    
    func process(dataStream: DataStream) -> DataStream {
        
        outputBits.removeAll(keepingCapacity: true)
        
        var result = DataStream()
        
        var loopIndex = 0
        var bitIndex = 0
        while loopIndex < pulseCount {
            
            let bitToProcess = dataStream.getBit(at: bitIndex)
            pulse(inputBit: bitToProcess)
            
            bitIndex += 1
            if bitIndex >= dataStream.bitCount {
                bitIndex = 0
            }
            
            loopIndex += 1
        }
        
        return result
    }
    
    func pulse(inputBit: Bit) {
        
        inputNeuron.inputBits.removeAll(keepingCapacity: true)
        outputNeuron.inputBits.removeAll(keepingCapacity: true)
        
        for neuron in neurons {
            neuron.inputBits.removeAll(keepingCapacity: true)
        }
        
        inputNeuron.inputBits.append(inputBit)
        
        // Round robin distribution to connections...
        
        rrdist(neuron: inputNeuron)
        for neuron in neurons {
            rrdist(neuron: neuron)
        }
        rrdist(neuron: outputNeuron)
        
        outputBits.append(contentsOf: outputNeuron.outputBits)
    }
    
    func rrdist(neuron: Neuron) {
        
        if neuron.rules.count <= 0 {
            neuron.outputBits.removeAll(keepingCapacity: true)
        } else {
            
            if neuron.inputBits.count <= 0 {
                neuron.outputBits.removeAll(keepingCapacity: true)
            } else {
                
                let ruleCount = neuron.rules.count
                let inputBitCount = neuron.inputBits.count
                
            }
        }
    }
}
