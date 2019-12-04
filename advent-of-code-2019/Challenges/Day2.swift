//
//  Day2.swift
//  advent-of-code-2018
//
//  Created by Toni Sučić on 03/12/2019.
//  Copyright © 2019 Toni Sučić. All rights reserved.
//

import Foundation

class Day2 {

    func getState() -> [Int] {
        getInput().split(separator: ",").compactMap { Int($0) }
    }

    class Program {
        private(set) var memory: [Int]
        private(set) var instrPtr: Int
        private(set) var isTerminated: Bool

        var input1Address: Int {
            memory[instrPtr+1]
        }
        var input2Address: Int {
            memory[instrPtr+2]
        }
        var storageAddress: Int {
            memory[instrPtr+3]
        }

        init(state: [Int] = []) {
            self.memory = state
            self.instrPtr = 0
            self.isTerminated = false
        }

        func reset(with state: [Int]) {
            self.memory = state
            self.instrPtr = 0
            self.isTerminated = false
        }

        func run() {
            while !isTerminated {
                runCurrentInstruction()
                incrementInstrPtr()
            }
        }

        func runCurrentInstruction() {
            guard !isTerminated else {
                assertionFailure("This program is terminated")
                return
            }
            switch Opcode(rawValue: memory[instrPtr]) {
            case .add:
                memory[storageAddress] = memory[input1Address] + memory[input2Address]
            case .mul:
                memory[storageAddress] = memory[input1Address] * memory[input2Address]
            case .halt:
                isTerminated = true
            default:
                fatalError("Something went wrong: unsupported opcode")
            }
        }

        func incrementInstrPtr() {
            guard instrPtr + 4 < memory.count && !isTerminated else { return }
            instrPtr += 4
        }

        enum Opcode: Int {
            case add = 1
            case mul = 2
            case halt = 99
        }
    }
}

extension Day2: Challenge {

    func getAnswerPartOne() -> Any? {
        var state = getState()
        state[1] = 12
        state[2] = 2

        let program = Program(state: state)
        program.run()

        return program.memory[0]
    }

    func getAnswerPartTwo() -> Any? {
        let program = Program()

        for noun in 0...99 {
            for verb in 0...99 {
                var state = getState()
                state[1] = noun
                state[2] = verb

                program.reset(with: state)
                program.run()

                if program.memory[0] == 19690720 {
                    return 100 * noun + verb
                }
            }
        }
        return nil
    }

    func getInput() -> String {
        """
        1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,1,6,19,23,1,23,13,27,2,6,27,31,1,5,31,35,2,10,35,39,1,6,39,43,1,13,43,47,2,47,6,51,1,51,5,55,1,55,6,59,2,59,10,63,1,63,6,67,2,67,10,71,1,71,9,75,2,75,10,79,1,79,5,83,2,10,83,87,1,87,6,91,2,9,91,95,1,95,5,99,1,5,99,103,1,103,10,107,1,9,107,111,1,6,111,115,1,115,5,119,1,10,119,123,2,6,123,127,2,127,6,131,1,131,2,135,1,10,135,0,99,2,0,14,0
        """
    }
}
