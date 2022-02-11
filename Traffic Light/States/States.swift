//
//  States.swift
//  Traffic Light
//
//  Created by Денис Сизов on 11.02.2022.
//

import Foundation

/// Варианты состояний светофора
enum States {
	case red
	case yellow
	case green
	
	var next: States {
		switch self {
		case .red: return .yellow
		case .yellow: return .green
		case .green: return .red
		}
	}
}
