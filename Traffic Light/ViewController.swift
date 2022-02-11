//
//  ViewController.swift
//  Traffic Light
//
//  Created by Денис Сизов on 11.02.2022.
//

import UIKit

/// Делегат контроллера для состояний
protocol LightStateDelegate {
	func enableRedLight()
	func enableYellowLight()
	func enableGreenLight()
}

/// Основной контроллер для отображения светофора
final class ViewController: UIViewController {
	
	@IBOutlet weak var stackView: UIStackView!
	@IBOutlet weak var redLight: UIView!
	@IBOutlet weak var yellowLight: UIView!
	@IBOutlet weak var greenLight: UIView!
	
	/// Цвет бортиков
	let borderColor = UIColor.black.cgColor
	
	/// Переключатель состояний
	var currentStateSwitcher = States.green {
		didSet {
			switch currentStateSwitcher {
			case .red:
				currentState = redLightState
			case .yellow:
				currentState = yellowLightState
			case .green:
				currentState = greenLightState
			}
			
			currentState?.begin()
		}
	}
	
	/// Текущее состояние
	var currentState: LightStateProtocol?
	
	// MARK: - States
	
	var redLightState: LightStateProtocol?
	var yellowLightState: LightStateProtocol?
	var greenLightState: LightStateProtocol?
	
	// MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureStack()
		configureLights()
		configureStates()
		setFirstState()
		startTheLights()
	}
	
	// MARK: - Private methods

	/// Конфигурирует стак
	private func configureStack() {
		stackView.isLayoutMarginsRelativeArrangement = true
		stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
		stackView.layer.borderWidth = 5
		stackView.layer.borderColor = borderColor
		stackView.subviews.forEach {
			$0.layer.borderWidth = 1
			$0.layer.borderColor = borderColor
		}
	}
	
	/// Конфигурирует вьюхи светофора
	private func configureLights() {
		redLight.layer.cornerRadius = redLight.frame.width / 2
		yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
		greenLight.layer.cornerRadius = greenLight.frame.width / 2
	}
	
	/// Выставляет первое состояние
	private func setFirstState() {
		currentState = greenLightState
		currentState?.begin()
	}
	
	/// Конфигурирует возможные состояния
	private func configureStates() {
		redLightState = RedLightState()
		redLightState?.controller = self
		
		yellowLightState = YellowLightState()
		yellowLightState?.controller = self
		
		greenLightState = GreenLightState()
		greenLightState?.controller = self
	}
	
	/// Запускает автопереключение
	private func startTheLights() {
		let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
			self.currentStateSwitcher = self.currentStateSwitcher.next
		}
	}
}

// MARK: - LightStateDelegate

extension ViewController: LightStateDelegate {
	func enableRedLight() {
		redLight.backgroundColor = .red
		yellowLight.backgroundColor = .gray
		greenLight.backgroundColor = .gray
	}
	
	func enableYellowLight() {
		redLight.backgroundColor = .gray
		yellowLight.backgroundColor = .orange
		greenLight.backgroundColor = .gray
	}
	
	func enableGreenLight() {
		redLight.backgroundColor = .gray
		yellowLight.backgroundColor = .gray
		greenLight.backgroundColor = .green
	}
}

