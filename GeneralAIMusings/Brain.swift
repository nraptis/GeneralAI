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
            if index > 0 && index <= neurons.count {
                return neurons[index - 1]
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
        inputNeuron.clear()
        outputNeuron.clear()
        for neuron in neurons {
            neuron.clear()
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
    
    private func prepareInputNeuronForPulse() {
        if let rule = inputNeuron.getCurrentRule() {
            let numberOfWordsRequired = rule.getNumberOfWordsRequired()
            let additionalWordsRequired = numberOfWordsRequired - inputNeuron.queue.count
            if additionalWordsRequired > 0 {
                if queryBus.canRead(additionalWordsRequired) {
                    let additionalFetchedWordsForPulse = queryBus.read(additionalWordsRequired)
                    inputNeuron.queue.write(additionalFetchedWordsForPulse)
                }
            }
        }
    }
    
    private var visitedStackIndex = 0
    private var visitedStack = [Neuron<WordType>]()
    private func executeVisitedStack() {
        while visitedStackIndex < visitedStack.count {
            let neuron = visitedStack[visitedStackIndex]
            neuron.isVisited = true
            if neuron.isVisitedCurrentPulse == false {
                neuron.isVisitedCurrentPulse = true
                if let rule = neuron.getCurrentRule(), let connection = neuron.getCurrentConnection() {
                    let numberOfWordsRequired = rule.getNumberOfWordsRequired()
                    if neuron.queue.canRead(numberOfWordsRequired) {
                        let wordsToProcess = neuron.queue.read(numberOfWordsRequired)
                        let resultOfRule = rule.process(words: wordsToProcess)
                        if connection == outputNeuron {
                            responseBus.write(resultOfRule)
                        } else {
                            connection.queue.write(resultOfRule)
                            
                            if connection.isVisitedCurrentPulse == false {
                                visitedStack.append(connection)
                            }
                        }
                        neuron.cycle()
                    }
                }
            }
            visitedStackIndex += 1
        }
        
    }
    
    func pulse() {
        
        for neuron in processNeuronList {
            neuron.isVisitedCurrentPulse = false
        }
        
        prepareInputNeuronForPulse()
        
        visitedStack.removeAll(keepingCapacity: true)
        visitedStackIndex = 0
        visitedStack.append(inputNeuron)
        
        
        executeVisitedStack()
        
        for neuron in processNeuronList {
            if neuron.isVisited {
                if neuron.isVisitedCurrentPulse == false {
                    visitedStack.append(neuron)
                    executeVisitedStack()
                }
            }
        }
        
    }
    
    func process() {
        
        process_step_0()
        
        process_step_1()
        
        // 3.) Do N number of pulses... On each pulse, we do these:
        var loopIndex = 0
        while loopIndex < pulseCount {
            
            pulse()
            
            loopIndex += 1
        }
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
