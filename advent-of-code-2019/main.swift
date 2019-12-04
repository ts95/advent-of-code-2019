//
//  main.swift
//  advent-of-code-2018
//
//  Created by Toni Sučić on 03/12/2019.
//  Copyright © 2019 Toni Sučić. All rights reserved.
//

import Foundation

let challenges: [Challenge] = [
    Day1(),
    Day2(),
    Day3(),
    Day4(),
]

for challenge in challenges {
    challenge.printAnswers()
    print()
}
