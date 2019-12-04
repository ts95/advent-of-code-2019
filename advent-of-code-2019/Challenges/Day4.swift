//
//  Day4.swift
//  advent-of-code-2018
//
//  Created by Toni Sučić on 04/12/2019.
//  Copyright © 2019 Toni Sučić. All rights reserved.
//

import Foundation

class Day4 {

    func getRange() -> ClosedRange<Int> {
        let numbers = getInput().split(separator: "-")
        return Int(numbers[0])!...Int(numbers[1])!
    }

    func doesIncrease(_ string: String) -> Bool {
        for (i, c) in string.enumerated().dropFirst() {
            let current = Int("\(c)")!
            let previous = Int("\(string[.init(utf16Offset: i-1, in: string)])")!
            if previous > current {
                return false
            }
        }
        return true
    }

    func hasDuplicates(_ string: String) -> Bool {
        var set = Set<Character>()
        for c in string {
            if !set.insert(c).inserted {
                return true
            }
        }
        return false
    }

    func strictlyHasDuplicates(_ string: String) -> Bool {
        var dict = [Character : Int]()
        for c in string {
            dict[c] = dict[c] ?? 0
            dict[c]! += 1
        }
        return dict.values.contains(2)
    }

    func meetsCriterea(_ string: String) -> Bool {
        doesIncrease(string) && hasDuplicates(string)
    }

    func actuallyMeetsCriterea(_ string: String) -> Bool {
        doesIncrease(string) && strictlyHasDuplicates(string)
    }
}

extension Day4: Challenge {

    func getAnswerPartOne() -> Any? {
        return getRange().filter { meetsCriterea(String($0)) }.count
    }

    func getAnswerPartTwo() -> Any? {
        return getRange().filter { actuallyMeetsCriterea(String($0)) }.count
    }

    func getInput() -> String {
        "168630-718098"
    }
}
