//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 10/07/26.
//

import Foundation

class Alphabetizer {
    private let tileCount = 3
    private var vocab: Vocabulary
    
    var tiles = [Tile]()
    var score = 0
    
    init(vocab: Vocabulary = .oceanAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // TODO: Implement submit
        score += 1
    }
    
    // MARK: private implementation
    
    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        for word in newWords {
            tiles.append(Tile(word: word))
        }
    }
}
