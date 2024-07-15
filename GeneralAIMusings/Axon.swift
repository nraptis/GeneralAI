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
    
    static func random(neuronCount: Int) -> Axon {
        
        let direction: AxonDirection
        let directionIndex = Int.random(in: 0...2)
        if directionIndex == 0 {
            direction = .a_to_b
        } else if directionIndex == 1 {
            direction = .b_to_a
        } else {
            direction = .both
        }
        
        var slotA = 0
        var slotB = 0
        
        var ceiling = 0
        ceiling += 1 // input neuron
        ceiling += 1 // output neuron
        ceiling += neuronCount
        
        if ceiling > 0 {
            slotA = Int.random(in: 0..<ceiling)
            slotB = Int.random(in: 0..<ceiling)
        }
        
        var neuronIndexA = Neuron.NeuronIndex.input
        var neuronIndexB = Neuron.NeuronIndex.input
        
        if slotA <= 0 {
            neuronIndexA = .input
        } else if (slotA >= (ceiling - 1)) {
            neuronIndexA = .output
        } else {
            neuronIndexA = .body(slotA)
        }
        
        if slotB <= 0 {
            neuronIndexB = .input
        } else if (slotB >= (ceiling - 1)) {
            neuronIndexB = .output
        } else {
            neuronIndexB = .body(slotB)
        }
        
        return Axon(neuronIndexA: neuronIndexA, neuronIndexB: neuronIndexB, direction: direction)
    }
}
