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
        inputNeuron.connections.removeAll(keepingCapacity: true)
        inputNeuron.inputBits.removeAll(keepingCapacity: true)
        inputNeuron.outputBits.removeAll(keepingCapacity: true)
        
        outputNeuron.connections.removeAll(keepingCapacity: true)
        outputNeuron.inputBits.removeAll(keepingCapacity: true)
        outputNeuron.outputBits.removeAll(keepingCapacity: true)
        for neuron in neurons {
            neuron.connections.removeAll(keepingCapacity: true)
            neuron.inputBits.removeAll(keepingCapacity: true)
            neuron.outputBits.removeAll(keepingCapacity: true)
        }
        
        
        for axon in axons {
            let neuronA = getNeuron(at: axon.neuronIndexA)
            let neuronB = getNeuron(at: axon.neuronIndexB)
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
        
        // 2.) Load up the input neuron's "inputBits" with
        //     all the bits from the data stream.
        
        for byte in dataStream.bytes {
            inputNeuron.appendByteToInput(byte: byte)
        }
        
        var neuronList = [inputNeuron]
        neuronList.append(contentsOf: neurons)
        neuronList.append(outputNeuron)
        
        // 3.) Do N number of pulses... On each pulse, we do these:
        var loopIndex = 0
        while loopIndex < pulseCount {
            
            // Clear all the outputbits...
            for neuron in neuronList {
                neuron.outputBits.removeAll(keepingCapacity: true)
            }
            
            //     a.) For each neuron (in order)
            for neuron in neuronList {
                //       i.) For each input bit, paired with corresponding rule
                if neuron.inputBits.count > 0 && neuron.rules.count > 0 {
                    var bitIndex = 0
                    var ruleIndex = 0
                    while bitIndex < neuron.inputBits.count {
                        
                        let bit = neuron.inputBits[bitIndex]
                        let rule = neuron.rules[bitIndex]
                        
                        //         > Perform the rule on the bit, then add to output bits
                        let bitsFromApplyingRuleToBit = rule.process(bit: bit)
                        neuron.outputBits.append(contentsOf: bitsFromApplyingRuleToBit)
                        
                        bitIndex += 1
                        ruleIndex += 1
                        if ruleIndex >= neuron.rules.count {
                            ruleIndex = 0
                        }
                    }
                }
            }
            
            // Clear all the inputbits...
            for neuron in neuronList {
                neuron.inputBits.removeAll(keepingCapacity: true)
            }
            
            // Now we do the round robit distribution...
            // So, output bits
            //     matches to
            //     connections...
            //     And becomes INPUT bits for
            //     the con...
            // TODO...
            
            loopIndex += 1
        }
        
        var result = DataStream()
        
        var resultBitIndex = 0
        while resultBitIndex < outputNeuron.outputBits.count {
            
            let bit0 = ((resultBitIndex + 0) < outputNeuron.outputBits.count) ? outputNeuron.outputBits[resultBitIndex + 0] : Bit()
            let bit1 = ((resultBitIndex + 1) < outputNeuron.outputBits.count) ? outputNeuron.outputBits[resultBitIndex + 1] : Bit()
            let bit2 = ((resultBitIndex + 2) < outputNeuron.outputBits.count) ? outputNeuron.outputBits[resultBitIndex + 2] : Bit()
            let bit3 = ((resultBitIndex + 3) < outputNeuron.outputBits.count) ? outputNeuron.outputBits[resultBitIndex + 3] : Bit()
            
            let bit4 = ((resultBitIndex + 4) < outputNeuron.outputBits.count) ? outputNeuron.outputBits[resultBitIndex + 4] : Bit()
            let bit5 = ((resultBitIndex + 5) < outputNeuron.outputBits.count) ? outputNeuron.outputBits[resultBitIndex + 5] : Bit()
            let bit6 = ((resultBitIndex + 6) < outputNeuron.outputBits.count) ? outputNeuron.outputBits[resultBitIndex + 6] : Bit()
            let bit7 = ((resultBitIndex + 7) < outputNeuron.outputBits.count) ? outputNeuron.outputBits[resultBitIndex + 7] : Bit()
            
            let resultByte = Byte()
            
            resultByte.bit0 = bit0
            resultByte.bit1 = bit1
            resultByte.bit2 = bit2
            resultByte.bit3 = bit3
            
            resultByte.bit4 = bit4
            resultByte.bit5 = bit5
            resultByte.bit6 = bit6
            resultByte.bit7 = bit7
            
            result.bytes.append(resultByte)
            
            resultBitIndex += 8
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
