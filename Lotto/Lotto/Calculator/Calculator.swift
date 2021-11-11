//
//  Calculator.swift
//  Lotto
//
//  Created by Mephrine on 2021/11/06.
//

import Foundation

enum CalculatorOption {
	static let seperator: [String.Element] = [",", ":"]
}

struct Calculator {
	func add(_ input: String?) throws -> Int {
		try split(input)
			.map { try $0.toPositiveInt() }
			.reduce(0) { partialResult, number in
				partialResult + number
			}
	}
	
	private func split(_ input: String?) -> [String] {
		guard let input: String = input else { return [] }
		return input.split {
			CalculatorOption.seperator.contains($0)
		}.map(String.init)
	}
}
