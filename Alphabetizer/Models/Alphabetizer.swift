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
    var totalAttempts = 0
    var wins = 0

    /// Calculates the win percentage (0-100)
    var winPercentage: Double {
        guard totalAttempts > 0 else { return 0 }
        return Double(wins) / Double(totalAttempts) * 100.0
    }

    // MARK: - Init
    
    init(vocab: Vocabulary = .landAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    // MARK: - Public methods
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // Track the attempt
        totalAttempts += 1

        // Check if the tiles are alphabetized
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        
        let isAlphabetized = userSortedTiles == alphabeticallySortedTiles
        
        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
            wins += 1
        }
        
        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
        
        // Flip over correct tiles
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            let tileIsAlphabetized = tile == correctTile
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
        
        switchVocabulary()
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
    
    private func switchVocabulary() {
        switch vocab {
            case .landAnimals:
                vocab = .oceanAnimals
            case .oceanAnimals:
                vocab = .landAnimals
            default:
                vocab = .landAnimals
        }
    }
}
