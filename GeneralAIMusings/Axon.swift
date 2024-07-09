//
//  Axon.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/9/24.
//

import Foundation

class Axon {
    
    enum AxonDirection {
        case a_to_b
        case b_to_a
        case both
    }
    
    let neuronIndexA: Neuron.NeuronIndex
    let neuronIndexB: Neuron.NeuronIndex
    let direction: AxonDirection
    
    init(neuronIndexA: Neuron.NeuronIndex,
         neuronIndexB: Neuron.NeuronIndex,
         direction: AxonDirection) {
        self.neuronIndexA = neuronIndexA
        self.neuronIndexB = neuronIndexB
        self.direction = direction
    }
    
    func clone() -> Axon {
        Axon(neuronIndexA: neuronIndexA,
             neuronIndexB: neuronIndexB,
             direction: direction)
    }
}
