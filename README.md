# Generalized AI

![alt text](https://github.com/nraptis/GeneralAI/blob/main/brain_test_dinky_boy.jpg)</br></br>
</br>
The first simple brain model to build. This diagram has gone through several rounds of consideration. To evolve, through the genetic algorithm, even a simple number adder, an entirely random process will take trillions of iterations. So my first plan is to evolve a brain which can solve "1+1" as "2" using a narrow language, such as a 4 byte language. By pruning "bad paths" early, it may be a problem which is solve-able in realistic time. I still don't know.

![alt text](https://raw.githubusercontent.com/nraptis/GeneralAI/main/1000_yard_view.jpg)</br></br>
</br>
This is the overview / meta goal...

Anyone is allowed to contribute to this. I will review any pull request until April 17, 2028, at which time I will re-evaluate this policy.</br></br>

The idea is this:</br>
1.) A generalized AI is created through a Darwinian algorithm.</br>
2.) A generalized AI constantly improves itself.</br>
3.) A generalized AI is initially seeded by a human-directed fitness function.</br>
4.) A generalized AI will eventually be evolved from a "population" of AI's (we call them "Brain").</br>
5.) A generalized AI can be built from simple constituent parts.</br></br>



It is intentional that I keep the brain as alien as possible;</br>
Similar to the animal brain, it has neurons and axons;</br>
However, the brain is ALL MACHINE... and ALL ALIEN... Meaning that it doesn't</br>
"Think like a human" at all... For example, it operates only on bits and rules...</br>
There is no concept of a byte... There is no concept of arithmetic...</br>
Through the genetic algorithm, the brain will LEARN the concepts of bytes and arithmetic...</br>
Similar to natural selection, we will only verify the quality of the brain's output...</br>
For the brain to exceed human intelligence, it cannot play by human rules... It must EVOLVE...!!!</br></br></br>
The way I invision this actually working is to eventually evolve up "brain pieces", and possibly have the brain able</br>
to brew "brain pieces" by itself. Then, through the random wiring, wire together these larger pieces. The</br>
larger pieces would still be "Neuron" but there would be many sub-Neurons and sub-Axons...
</br></br>
The shell of the program is remarkably simple. This is the exact shell, it doesn't need to change.</br></br>
</br>

```
func generateSuperHumanIntelligence() {
    
    // The evaluator computes the fitness level of a "Brain..."
    let evaluator = Evaluator()
    
    // The population of AI brains...
    var population = Population()
    
    // Try to load the results from previous executions... [A1]
    population.load()
    
    // Continuously run...
    while true {
        
        // 1.) Mutate the population members until we reach [count].
        population = growAndEvolve_Step1(population: population,
                                         count: 10_000)
        
        // 2.) Interbreed the population members until we reach [count] * 2.
        population = growAndEvolve_Step2(population: population,
                                         count: 10_000)
        
        // 3.) Evaluate the fitness of the breeding population and keep best [count].
        population = growAndEvolve_Step3(population: population,
                                         evaluator: evaluator,
                                         count: 10_000)
        
        // Every time, save the result. [A1]
        population.save()
    }
}
```
</br></br>
Step 1, mutating the seed population.
```
func growAndEvolve_Step1(population: Population, count: Int) -> Population {
    
    // Create the growing population.
    var growingPopulation = Population()
    
    // Add all of the original brains to the test population.
    population.brains.forEach { brain in
        growingPopulation.brains.append(brain.clone())
    }
    
    // Mutate the population members until we reach [count].
    while growingPopulation.brains.count < count {
        let anyBrain: Brain
        if let randomBrain = population.brains.randomElement() {
            // Choose a random brain from the seed population.
            anyBrain = randomBrain.clone()
        } else {
            // We have no brains, start with a fresh one...
            anyBrain = Brain<Word16>()
        }
        
        // Mutate the internal wiring of the brain...
        let mutatedBrain = anyBrain.mutate()
        growingPopulation.brains.append(mutatedBrain)
    }
    
    return growingPopulation
}
```
</br></br>
Step 2, "breeding" the brains to over-grow population.
```
func growAndEvolve_Step2(population: Population, count: Int) -> Population {
    
    // Create the breeding population. This can grow beyond [count]...
    var breedingPopulation = Population()
    
    // Add all of the original brains to the breeding population.
    population.brains.forEach { brain in
        breedingPopulation.brains.append(brain.clone())
    }
    
    // Interbreed the population members until we reach [count] * 2.
    while breedingPopulation.brains.count < (count * 2) {
        
        let brain1 = population.brains.randomElement()!
        let brain2 = population.brains.randomElement()!
        
        let combinedBrain = brain1.breed(mate: brain2)
        breedingPopulation.brains.append(combinedBrain)
    }
    
    return breedingPopulation
}
```
</br></br>
Step 3, culling the over-grown population, keeping best brains.
```
func growAndEvolve_Step3(population: Population, evaluator: Evaluator, count: Int) -> Population {
    
    // Create the prime population. We will keep the best [count]...
    var primePopulation = Population()
    
    // Evaluate each brain using the fitness function...
    var brainAndEvaluations = [(Brain, Evaluation)]()
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
```

![alt text](https://raw.githubusercontent.com/nraptis/GeneralAI/main/research.png)</br></br>

