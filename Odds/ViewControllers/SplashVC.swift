//
//  ViewController.swift
//  Odds
//
//  Created by Elkana Antonio on 30/04/21.
//  Copyright © 2021 Elkana Antonio. All rights reserved.
//

import UIKit

class SplashVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: UI Elements
    let titleLabel = UILabel()
    let callToActionButton = WOButton(backgroundColor: #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1), title: "Go!")
    let helpButton = WOButton(backgroundColor: .systemBlue, title: "How To Play")
    let horizontalStack = UIStackView()
    let oddsPicker = UIPickerView()
    
    // Class Properties
    var selectedOdds: Int = 0
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom programmatic UI
        view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.6039215686, blue: 0.8705882353, alpha: 1)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTitleLabel()
        configureCallToActionButton()
        configureHelpButton()
        configureHorizontalStack()
    }
    
    // MARK: UI Configuration
    private func configureHelpButton() {
        view.addSubview(helpButton)
        helpButton.addTarget(self, action: #selector(pushHelpVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            helpButton.bottomAnchor.constraint(equalTo: callToActionButton.topAnchor, constant: -20),
            helpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            helpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            helpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "What are the odds ?"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 34.0)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -52),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    private func configureCallToActionButton(){
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushResultsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    fileprivate func configurePickerLabel() {
        let label = UILabel(frame: .zero)
        label.text = "1 : "
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = .white
        horizontalStack.addArrangedSubview(label)
    }
    
    
    fileprivate func configureOddsPicker() {
        oddsPicker.dataSource = self
        oddsPicker.delegate = self
        horizontalStack.addArrangedSubview(oddsPicker)
        oddsPicker.setValue(UIColor.white, forKey: "textColor")
    }
    
    
    private func configureHorizontalStack() {
        view.addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center // .Leading .FirstBaseline .Center .Trailing .LastBaseline
        horizontalStack.distribution = .fillEqually // .FillEqually .FillProportionally .EqualSpacing .EqualCentering
        
        
        NSLayoutConstraint.activate([
            horizontalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            horizontalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            horizontalStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            horizontalStack.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        configurePickerLabel()
        configureOddsPicker()
    }
    
    
    // MARK: UI Event Handlers
    @objc func pushHelpVC() {
        let explainGameVC = ExplainGameVC()
        self.present(explainGameVC, animated: true, completion: nil)
    }
    
    
    @objc func pushResultsVC() {
        let resultsVC = ResultsVC()
        resultsVC.selectedOdds = self.selectedOdds + 2
        self.present(resultsVC, animated: true, completion: nil)
        //        navigationController?.pushViewController(resultsVC, animated: true)
    }
    
    
    // MARK: Picker Delegate Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 101
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rowTitle = row + 2
        return "\(rowTitle)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedOdds = row
    }
    
}

