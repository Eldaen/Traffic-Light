//
//  GreenLightState.swift
//  Traffic Light
//
//  Created by Денис Сизов on 11.02.2022.
//

import Foundation

/// Горит зелёный
final class GreenLightState: LightStateProtocol {
	weak var controller: ViewController?
	
	func begin() {
		controller?.enableGreenLight()
	}
}
