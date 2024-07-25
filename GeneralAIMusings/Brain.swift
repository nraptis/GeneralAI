//
//  Brain.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

class Brain<WordType: Wordable> {
    
    let queryBus = Bus<WordType>()
    let responseBus = Bus<WordType>()
    
    let inputNeuron: Neuron<WordType>
    let outputNeuron: Neuron<WordType>
    private let placeholderNeuron: Neuron<WordType>
    
    let queueSize: Int
    init(queueSize: Int) {
        self.queueSize = queueSize
        inputNeuron = Neuron<WordType>(queueSize: queueSize)
        outputNeuron = Neuron<WordType>(queueSize: queueSize)
        placeholderNeuron = Neuron<WordType>(queueSize: queueSize)
    }
    
    
    var pulseCount = 0
    
    var neurons = [Neuron<WordType>]()
    var axons = [Axon]()
    
    var processNeuronList = [Neuron<WordType>]()
    
    func getNeuronCount() -> Int {
        return 1 + 1 + neurons.count
    }
    
    func getRuleCount() -> Int {
        
        var result = 0
        result += inputNeuron.getRuleCount()
        result += outputNeuron.getRuleCount()
        neurons.forEach {
            result += $0.getRuleCount()
        }
        return result
    }
    
    func mutate() -> Brain<WordType> {
        let result = Brain<WordType>(queueSize: queueSize)
        result.pulseCount = 1
        
        
        /*
        let random_0_100 = Int.random(in: 0...100)
        
        var numberOfRulesToInsertAtHead = 0
        var numberOfRulesToInsertAtTail = 0
        var numberOfAxonsToInsertAtHead = 0
        var numberOfAxonsToInsertAtTail = 0
        
        var isPunctuatedEquilibrium = false
        
        if random_0_100 >= 90 {
            //
            // Puntuated Equilibrium
            // More Evoluton
            //
            isPunctuatedEquilibrium = true
        }
        
        if isPunctuatedEquilibrium {
            numberOfRulesToInsertAtHead = Int.random(in: 0...10)
            numberOfRulesToInsertAtTail = Int.random(in: 0...10)
            
            numberOfAxonsToInsertAtHead = Int.random(in: 0...10)
            numberOfAxonsToInsertAtTail = Int.random(in: 0...10)
            
        } else {
            if Int.random(in: 0...10) == 0 {
                numberOfRulesToInsertAtHead = Int.random(in: 0...2)
            }
            if Int.random(in: 0...10) == 0 {
                numberOfRulesToInsertAtTail = Int.random(in: 0...2)
            }
            if Int.random(in: 0...10) == 0 {
                numberOfAxonsToInsertAtHead = Int.random(in: 0...5)
            }
            if Int.random(in: 0...10) == 0 {
                numberOfAxonsToInsertAtTail = Int.random(in: 0...5)
            }
        }
        
        for _ in 0..<numberOfRulesToInsertAtHead {
            result.neurons.append(Neuron().mutate())
        }
        
        for neuron in neurons {
            let mutationAction = Neuron.getMutationAction(isPunctuatedEquilibrium: isPunctuatedEquilibrium)
            switch mutationAction {
            case .none:
                result.neurons.append(neuron.clone())
            case .insert:
                result.neurons.append(neuron.clone())
                result.neurons.append(Neuron().mutate())
            case .delete:
                break
            case .replace:
                result.neurons.append(Neuron().mutate())
            }
        }
        
        for _ in 0..<numberOfRulesToInsertAtTail {
            result.neurons.append(Neuron().mutate())
        }
        
        for _ in 0..<numberOfAxonsToInsertAtHead {
            result.axons.append(Axon.random(neuronCount: result.neurons.count))
        }
        
        for axon in axons {
            let mutationAction = Neuron.getMutationAction(isPunctuatedEquilibrium: isPunctuatedEquilibrium)
            switch mutationAction {
            case .none:
                //TODO: We should shift this neuron.
                result.axons.append(axon.clone())
            case .insert:
                result.axons.append(axon.clone())
                result.axons.append(Axon.random(neuronCount: result.neurons.count))
            case .delete:
                break
            case .replace:
                result.axons.append(Axon.random(neuronCount: result.neurons.count))
            }
        }
        
        result.outputNeuron = outputNeuron.mutate()
        */
        
        return result
    }
    
    func removeNeuron(at index: Int) {
        if index >= 0 && index < neurons.count {
            neurons.remove(at: index)
        }
    }
    
    func addNeuron(_ neuron: Neuron<WordType>) {
        neurons.append(neuron)
    }
    
    func clone() -> Brain<WordType> {
        let result = Brain<WordType>(queueSize: queueSize)
        
        return result
    }
    
    func restore(brain: Brain<WordType>) {
        
    }
    
    
    func getNeuron(at index: NeuronIndex) -> Neuron<WordType> {
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
    
    func process_step_0() {
        
        // Very high level description of how this would work:
        //
        // 1.) Clear out all the in/out neurons for
        //     all of the neurons, including the input and output...
        inputNeuron.connections.removeAll(keepingCapacity: true)
        //inputNeuron.inputBits.removeAll(keepingCapacity: true)
        //inputNeuron.outputBits.removeAll(keepingCapacity: true)
        
        outputNeuron.connections.removeAll(keepingCapacity: true)
        //outputNeuron.inputBits.removeAll(keepingCapacity: true)
        //outputNeuron.outputBits.removeAll(keepingCapacity: true)
        for neuron in neurons {
            neuron.connections.removeAll(keepingCapacity: true)
            //neuron.inputBits.removeAll(keepingCapacity: true)
            //neuron.outputBits.removeAll(keepingCapacity: true)
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
    }
    
    func process_step_1() {
        
        processNeuronList.removeAll(keepingCapacity: true)
        
        processNeuronList.append(inputNeuron)
        processNeuronList.append(contentsOf: neurons)
        processNeuronList.append(outputNeuron)
        
        for index in processNeuronList.indices {
            processNeuronList[index].neuronIndex = index
        }
    }
    
    func pulse_step_0() {
        // Clear all the outputbits...
        for neuron in processNeuronList {
            //neuron.outputBits.removeAll(keepingCapacity: true)
            
        }
        
        //     a.) For each neuron (in order)
        /*
        for neuron in processNeuronList {
            //       i.) For each input bit, paired with corresponding rule
            if neuron.inputBits.count > 0 && neuron.rules.count > 0 {
                var bitIndex = 0
                var ruleIndex = 0
                while bitIndex < neuron.inputBits.count {
                    
                    let bit1 = neuron.inputBits[bitIndex]
                    let rule = neuron.rules[ruleIndex]
                    
                    if rule.isTwoBitRule {
                        bitIndex += 1
                        if bitIndex < neuron.inputBits.count {
                            let bit2 = neuron.inputBits[bitIndex]
                            
                            let bitsFromApplyingRuleToBit = rule.processTwoBits(firstBit: bit1, secondBit: bit2)
                            neuron.outputBits.append(contentsOf: bitsFromApplyingRuleToBit)
                            
                            bitIndex += 1
                        }
                        
                    } else {
                        let bitsFromApplyingRuleToBit = rule.processSingleBit(bit: bit1)
                        neuron.outputBits.append(contentsOf: bitsFromApplyingRuleToBit)
                        bitIndex += 1
                    }
                    
                    ruleIndex += 1
                    if ruleIndex >= neuron.rules.count {
                        ruleIndex = 0
                    }
                }
            }
        }
        */
    }
    
    func pulse_step_1() {
        
        // Clear all the inputbits...
        for neuron in processNeuronList {
            //neuron.inputBits.removeAll(keepingCapacity: true)
            
        }
        
        // Now we do the round robit distribution...
        // So the data zips all around in the brain...
        
        /*
        for neuron in processNeuronList {
            if (neuron.outputBits.count > 0) && (neuron.connections.count > 0) {
                
                var connectionIndex = 0
                for bit in neuron.outputBits {
                    
                    let connection = neuron.connections[connectionIndex]
                    connection.inputBits.append(bit)
                    
                    connectionIndex += 1
                    if connectionIndex == neuron.connections.count {
                        connectionIndex = 0
                    }
                }
            }
        }
        */
    }
    
    func process_step_3() {
        
        /*
        var resultBitIndex = 0
        while resultBitIndex < outputNeuron.inputBits.count {
            
            var resultValue = UInt32(0)
            
            var loopIndex = 0
            while loopIndex < WordType.numberOfBits {
                
                if resultBitIndex < outputNeuron.inputBits.count {
                    if outputNeuron.inputBits[resultBitIndex] {
                        resultValue |= (1 << loopIndex)
                    }
                }
                
                resultBitIndex += 1
                loopIndex += 1
            }
            
            let resultWord = WordType(value: resultValue)
            result.words.append(resultWord)
        }
        */
        
    }
    
    func process() {
        
        process_step_0()
        
        process_step_1()
        
        // 3.) Do N number of pulses... On each pulse, we do these:
        var loopIndex = 0
        while loopIndex < pulseCount {
            
            pulse_step_0()
            
            pulse_step_1()
            
            loopIndex += 1
        }
        
        return process_step_3()
    }
    
    func writeQuery(word: WordType) {
        queryBus.write(word)
    }
    
    func writeQuery(words: [WordType]) {
        queryBus.write(words)
    }
    
    func writeQuery(queryBus: Bus<WordType>) {
        self.queryBus.write(queryBus)
    }
    
}
