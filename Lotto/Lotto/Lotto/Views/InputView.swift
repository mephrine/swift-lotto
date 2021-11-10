//
//  InputView.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/09.
//

import Foundation

protocol Inputable {
	func read(completion: (AmountInputable) -> Void) throws
	func read(completion: (WinningLotto) -> Void) throws
	func makeAmount() throws -> Amount
 	func makeWinningLotto() -> WinningLotto?
}

extension Inputable {
	func read(completion: (AmountInputable) -> Void) throws {
		let amount = try makeAmount()
		completion(amount)
	}
	
	func read(completion: (WinningLotto) -> Void) throws {
		guard let lotto = makeWinningLotto() else {
			throw InputError.invalid
		}
		completion(lotto)
	}
}

struct InputView: Inputable {
	func makeAmount() throws -> Amount {
		try Amount(input: readLine())
	}
	
	func makeWinningLotto() -> WinningLotto? {
		WinningLotto(input: readLine(), numberRange: LottoOption.lottoNumberRange)
	}
}
