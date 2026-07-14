//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by feed0 on 10/07/26.
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
    
    // MARK: Computed properties
    
    // Alternates true and false
    private var isAlphabetized = false
    
    // MARK: - Init
    
    init(vocab: Vocabulary = .oceanAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    // MARK: - Public methods
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // Check if the tiles are alphabetized
        
        // TODO: Compare alphabetical order to position
        isAlphabetized.toggle()
        
        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
        }
        
        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
        
        // Flip over correct tiles
        for tile in tiles {
            // TODO: Check if this tile is in the correct position
            let tileIsAlphabetized = isAlphabetized
            tile.flipped = tileIsAlphabetized
        }
        
        Task { @MainActor in
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))
            
            // If alphabetized, generate new tiles
            if isAlphabetized {
                startNewGame()
            }
            
            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }
            
            // Display instructions
            message = .instructions
        }
    }
    
    // MARK: - Private methods
    
    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            // Assign new words to existing tiles
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }
    }
}
