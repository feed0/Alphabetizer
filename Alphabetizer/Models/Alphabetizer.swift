//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by Felipe Eduardo Campelo Ferreira Osorio on 10/07/26.
//

import Foundation

@Observable
class Alphabetizer {
    
    // MARK: - Properties
    
    private let tileCount = 3
    private var vocab: Vocabulary
    
    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions
    
    // MARK: - Init
    
    init(vocab: Vocabulary = .oceanAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    // MARK: - Public methods
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // TODO: Implement submit
        score += 1
    }
    
    // MARK: - Private methods
    
    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        for word in newWords {
            tiles.append(Tile(word: word))
        }
    }
}
