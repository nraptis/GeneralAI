//
//  Simulation.swift
//  GeneralAIMusings
//
//  Created by Nicky Taylor on 7/8/24.
//

import Foundation

class Simulation {
    
    var iteration = 0
    
    func generateSuperHumanIntelligence() {
        
        // The evaluator computes the fitness level of a "Brain..."
        let evaluator = Evaluator<Word4>()
        
        for trial in evaluator.trials {
            let input = trial.input.string
            let output = trial.expectedOutput.string
            
            print("Trial: [\(input)] => [\(output)]")
            
        }
        
        // The population of AI brains...
        var population = Population<Word4>()
        
        // Try to load the results from previous executions... [A1]
        population.load()
        
        // Continuously run...
        while true {
            
            // 1.) Mutate the population members until we reach [count].
            
            population = growAndEvolve_Step1(population: population,
                                             count: 100)
            
            // 2.) Interbreed the population members until we reach [count] * 2.
            population = growAndEvolve_Step2(population: population,
                                             count: 100)
            
            // 3.) Evaluate the fitness of the breeding population and keep best [count].
            population = growAndEvolve_Step3(population: population,
                                             evaluator: evaluator,
                                             count: 100)
            
            // Every time, save the result. [A1]
            population.save()
            
            iteration += 1
        }
        
    }
    
    func growAndEvolve_Step1(population: Population<Word4>, count: Int) -> Population<Word4> {
        
        // Create the growing population.
        var growingPopulation = Population<Word4>()
        
        // Add all of the original brains to the test population.
        population.brains.forEach { brain in
            growingPopulation.brains.append(brain.clone())
        }
        
        // Mutate the population members until we reach [count].
        while growingPopulation.brains.count < count {
            let anyBrain: Brain<Word4>
            if let randomBrain = population.brains.randomElement() {
                // Choose a random brain from the seed population.
                anyBrain = randomBrain.clone()
            } else {
                // We have no brains, start with a fresh one...
                anyBrain = Brain<Word4>(queueSize: 8)
            }
            
            // Mutate the internal wiring of the brain...
            let mutatedBrain = anyBrain.mutate()
            growingPopulation.brains.append(mutatedBrain)
        }
        
        return growingPopulation
    }
    
    func growAndEvolve_Step2(population: Population<Word4>, count: Int) -> Population<Word4> {
        
        // Create the breeding population. This can grow beyond [count]...
        var breedingPopulation = Population<Word4>()
        
        // Add all of the original brains to the breeding population.
        population.brains.forEach { brain in
            breedingPopulation.brains.append(brain.clone())
        }
        
        
        
        // Interbreed the population members until we reach [count] * 2.
        while breedingPopulation.brains.count < (count * 2) {
            
            // For now, we will just mutate, not evolve.
            
            let brain = population.brains.randomElement()!
            breedingPopulation.brains.append(brain.mutate())
        }
        
        
        if (iteration % 10) == 0 {
            
            var mostRules = 0
            var leastRules = 100_000_000_000
            
            var mostNeurons = 0
            var leastNeurons = 100_000_000_000
            
            for brain in breedingPopulation.brains {
                let ruleCount = brain.getRuleCount()
                if ruleCount > mostRules {
                    mostRules = ruleCount
                }
                if ruleCount < leastRules {
                    leastRules = ruleCount
                }
                
                let neuronCount = brain.getNeuronCount()
                if neuronCount > mostNeurons {
                    mostNeurons = neuronCount
                }
                if neuronCount < leastNeurons {
                    leastNeurons = neuronCount
                }
            }
            
            print("@ \(iteration) - We have \(breedingPopulation.brains.count) brains")
            print("@ \(iteration) - We \(mostNeurons) as the highest number of neurons")
            print("@ \(iteration) - We \(leastNeurons) as the lowest number of neurons")
            print("@ \(iteration) - We \(mostRules) as the highest number of rules")
            print("@ \(iteration) - We \(leastRules) as the lowest number of rules")
        }
        
        return breedingPopulation
    }
    
    func growAndEvolve_Step3(population: Population<Word4>,
                             evaluator: Evaluator<Word4>, count: Int) -> Population<Word4> {
        
        // Create the prime population. We will keep the best [count]...
        var primePopulation = Population<Word4>()
        
        // Evaluate each brain using the fitness function...
        var brainAndEvaluations = [(Brain<Word4>, Evaluation)]()
        population.brains.forEach { brain in
            let evaluation = evaluator.evaluate(brain: brain)
            brainAndEvaluations.append((brain, evaluation))
        }
        
        // Sort by evaluation...
        brainAndEvaluations.sort {
            $0.1 < $1.1
        }
        
        // Add the first [count] to the prime population...
        
        var loopIndex = 0
        while loopIndex < count && loopIndex < brainAndEvaluations.count {
            let brainAndEvaluation = brainAndEvaluations[loopIndex]
            let brain = brainAndEvaluation.0.clone()
            
            primePopulation.brains.append(brain)
            
            loopIndex += 1
        }
        
        return primePopulation
    }
}
