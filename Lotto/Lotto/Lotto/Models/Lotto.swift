//
//  Lotto.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/07.
//

import Foundation

struct Lotto: Equatable, Hashable {
	let numbers: [Int]
	init?(numbers: [Int], numberRange: ClosedRange<Int>) {
		guard numbers.filter({ numberRange.contains($0) }).count == LottoOption.numberOfLottoNumbers,
					Set(numbers).count == LottoOption.numberOfLottoNumbers
		else {
			return nil
		}
					
		self.numbers = numbers.sorted(by: <)
	}
}

extension Lotto {
	func checkWinningRanking(with winningLotto: WinningLotto) -> Winnings {
		let numberOfMatchingNumbers = findNumberOfMatchingNumbers(with: winningLotto)
		return findWinningRanking(numberOfMatchingNumbers: numberOfMatchingNumbers, bonusNumber: winningLotto.bonusNumber)
	}
	
	private func findNumberOfMatchingNumbers(with winningLotto: WinningLotto) -> Int {
		Set(numbers).intersection(Set(winningLotto.lotto.numbers)).count
	}
	
	private func findWinningRanking(numberOfMatchingNumbers: Int, bonusNumber: Int) -> Winnings {
		Winnings.from(matchingCount: numberOfMatchingNumbers, matchBonus: numbers.contains(bonusNumber))
	}
}
