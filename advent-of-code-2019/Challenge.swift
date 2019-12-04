//
//  Challenge.swift
//  advent-of-code-2018
//
//  Created by Toni Sučić on 03/12/2019.
//  Copyright © 2019 Toni Sučić. All rights reserved.
//

import Foundation

protocol Challenge {
    var name: String { get }

    func getAnswerPartOne() -> Any?
    func getAnswerPartTwo() -> Any?

    func getInput() -> String
    func printAnswers()
}

extension Challenge {

    var name: String {
        String(describing: Self.self)
    }

    func printAnswers() {
        if let partOneAnswer = getAnswerPartOne() {
            print("\(name) part one: \(partOneAnswer)")
        }

        if let partTwoAnswer = getAnswerPartTwo() {
            print("\(name) part two: \(partTwoAnswer)")
        }
    }
}
