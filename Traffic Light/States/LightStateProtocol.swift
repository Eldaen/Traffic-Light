//
//  LightStateProtocol.swift
//  Traffic Light
//
//  Created by Денис Сизов on 11.02.2022.
//

import Foundation

/// Протокол состояний светофора
protocol LightStateProtocol {
	var controller: ViewController? { get set }
	func begin()
}
