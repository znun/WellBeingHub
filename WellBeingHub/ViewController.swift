//
//  ViewController.swift
//  WellBeingHub
//
//  Created by Mahmudul Hasan on 12/7/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let context = CoreDataManager.shared.context
    
    // UI Elements
    let stepsTextField = UITextField()
    let waterIntakeTextField = UITextField()
    let sleepHoursTextField = UITextField()
    let mealsTextField = UITextField()
    let saveButton = UIButton(type: .system)
    let fetchButton = UIButton(type: .system)
    let recommendationLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Well Being Hub"
        
        setupUI()
    }
    
    private func setupUI () {
        
        // Configure TextFields
        configureTextFields(stepsTextField, placeholder: "Steps")
        configureTextFields(waterIntakeTextField, placeholder: "Water Intake (L)")
        configureTextFields(sleepHoursTextField, placeholder: "Sleep Hours")
        configureTextFields(mealsTextField, placeholder: "Meals")
        
        // Configure Buttons
        configureButtons(saveButton, title: "Save Data", action: #selector(saveData))
        configureButtons(fetchButton, title: "Fetch Recommendations", action: #selector(fetchData))
        
        // Configure Recommendation Label
        recommendationLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendationLabel.textAlignment = .center
        recommendationLabel.numberOfLines = 0
        recommendationLabel.text = "Recommendations will be appear here"
        
        // Add Subviews
        view.addSubview(stepsTextField)
        view.addSubview(waterIntakeTextField)
        view.addSubview(sleepHoursTextField)
        view.addSubview(mealsTextField)
        view.addSubview(saveButton)
        view.addSubview(fetchButton)
        view.addSubview(recommendationLabel)
        
        // Setup Constrains
        setupConstrains()
        
    }
    
    private func configureTextFields(_ textField: UITextField, placeholder: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = placeholder
    }
    
    private func configureButtons(_ button: UIButton, title: String, action: Selector) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
        
            // Steps TextField
            stepsTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stepsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stepsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stepsTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Water Intake TextField
            waterIntakeTextField.topAnchor.constraint(equalTo: stepsTextField.bottomAnchor, constant: 20),
            waterIntakeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            waterIntakeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            waterIntakeTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Sleep Hours TextField
            sleepHoursTextField.topAnchor.constraint(equalTo: waterIntakeTextField.bottomAnchor, constant: 20),
            sleepHoursTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sleepHoursTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sleepHoursTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Meals TextField
            mealsTextField.topAnchor.constraint(equalTo: sleepHoursTextField.bottomAnchor, constant: 20),
            mealsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mealsTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mealsTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Save Button
            saveButton.topAnchor.constraint(equalTo: mealsTextField.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Fetch Button
            fetchButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            fetchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            fetchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fetchButton.heightAnchor.constraint(equalToConstant: 50),
            
            // Recommendation Label
            recommendationLabel.topAnchor.constraint(equalTo: fetchButton.bottomAnchor, constant: 20),
            recommendationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            recommendationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            
            
        
        ])
    }

    @objc private func saveData() {
        guard let steps = Int64(stepsTextField.text ?? ""),
              let waterIntake = Double(waterIntakeTextField.text ?? ""),
              let sleepHours = Double(sleepHoursTextField.text ?? ""),
              let meals = mealsTextField.text else {return}
        
        let healthData = HealthData(context: context)
        healthData.date = Date()
        healthData.steps = steps
        healthData.waterIntake = waterIntake
        healthData.sleepHours = sleepHours
        healthData.meals = meals
        
        CoreDataManager.shared.saveContext()
    }
    
    @objc private func fetchData() {
        
    }

}

