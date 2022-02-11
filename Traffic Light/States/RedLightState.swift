//
//  RedLightState.swift
//  Traffic Light
//
//  Created by Денис Сизов on 11.02.2022.
//

import Foundation

/// Горит красный
final class RedLightState: LightStateProtocol {
	weak var controller: ViewController?
	
	func begin() {
		controller?.enableRedLight()
	}
}
