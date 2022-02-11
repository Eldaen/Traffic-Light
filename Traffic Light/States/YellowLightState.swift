//
//  YellowLightState.swift
//  Traffic Light
//
//  Created by Денис Сизов on 11.02.2022.
//

import Foundation

/// Горит жёлтый
final class YellowLightState: LightStateProtocol {
	weak var controller: ViewController?
	
	func begin() {
		controller?.enableYellowLight()
	}
}
