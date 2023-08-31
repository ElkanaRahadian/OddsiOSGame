//
//  ExplainGameVC.swift
//  Odds
//
//  Created by Elkana Antonio on 30/04/21.
//  Copyright © 2021 Elkana Antonio. All rights reserved.
//

import UIKit

class ExplainGameVC: UIViewController {
    
    // UI Elements
    let titleLabel = UILabel()
    let explanationText = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom programmatic UI
        view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.6039215686, blue: 0.8705882353, alpha: 1)
        navigationController?.isNavigationBarHidden = true
        configureTitleLabel()
        configureExplanation()
    }
    
    // MARK: UI Configuration
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "How To Play"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureExplanation(){
        view.addSubview(explanationText)
        explanationText.translatesAutoresizingMaskIntoConstraints = false
        
        explanationText.isEditable = false
        explanationText.textAlignment = .left
        explanationText.font = UIFont.preferredFont(forTextStyle: .title3)
        explanationText.textAlignment = NSTextAlignment.justified
        explanationText.text = """

            \"What Are The Odds\" is a simple game where one person dares another to do a ridiculous task.

            The players decide on a dare, and select the odds.

            If the 2 numbers generated are the same, the person playing must do the dare!

            """
        explanationText.textColor = UIColor.white
        explanationText.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.6039215686, blue: 0.8705882353, alpha: 1)
        
        
        NSLayoutConstraint.activate([
            explanationText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            explanationText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            explanationText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            explanationText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
    }
    
    
}

