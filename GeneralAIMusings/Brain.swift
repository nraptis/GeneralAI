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
    var axons = [Axon]()
    
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
    
    private let placeholderNeuron = Neuron()
    func getNeuron(at index: Neuron.NeuronIndex) -> Neuron {
        switch index {
        case .input:
            return inputNeuron
        case .output:
            return outputNeuron
        case .body(let index):
            if index >= 0 && index < neurons.count {
                return neurons[index]
            } else {
                return placeholderNeuron
            }
        }
    }
    
    func process(dataStream: DataStream) -> DataStream {
        
        outputBits.removeAll(keepingCapacity: true)
        
        // Very high level description of how this would work:
        //
        // 1.) Clear out all the in/out neurons for
        //     all of the neurons, including the input and output...
        // 2.) Load up the input neuron's "inputBits" with
        //     all the bits from the data stream.
        // 3.) Do N number of pulses... On each pulse, we do these:
        //     a.) For each neuron (in order)
        //       i.) For each input bit, paired with each rule
        //         > Perform the rule on the bit, then
        //           1.) round robin distribute to connectons (which was loaded base on axon)
        //     b.) Just die, there's nothing else.
        
        var result = DataStream()
        
        for neuron in neurons {
            neuron.connections.removeAll(keepingCapacity: true)
        }
        
        for axon in axons {
            let neuronA = getNeuron(at: axon.neuronIndexA)
            let neuronB = getNeuron(at: axon.neuronIndexA)
            switch axon.direction {
            case .a_to_b:
                neuronA.connections.append(neuronB)
            case .b_to_a:
                neuronB.connections.append(neuronA)
            case .both:
                neuronA.connections.append(neuronB)
                neuronB.connections.append(neuronA)
            }
        }
        
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
