//
//  ResultsVC.swif
//  Odds
//
//  Created by Elkana Antonio on 30/04/21.
//  Copyright © 2021 Elkana Antonio. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {
    
    // UI Elements
    let titleLabel = UILabel()
    let userNumberLabel = UILabel()
    let computerNumberLabel = UILabel()
    let resultNumberStack = UIStackView()
    let resultLabel = UILabel()
    
    // Class Properties
    var selectedOdds: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Custom programmatic UI
        view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.6039215686, blue: 0.8705882353, alpha: 1)
        navigationController?.isNavigationBarHidden = true
        // Show a  label with "1 in \(odds)"
        configureTitleLabel()
        playGame()
    }
    
    // MARK: UI Configuration
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "1 in \(selectedOdds!)"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureResultNumbers(userNumber: Int, computerNumber: Int) {
        view.addSubview(resultNumberStack)
        resultNumberStack.translatesAutoresizingMaskIntoConstraints = false
        resultNumberStack.axis = .horizontal
        resultNumberStack.alignment = .center
        resultNumberStack.distribution = .equalCentering
        
        NSLayoutConstraint.activate([
            resultNumberStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            resultNumberStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            resultNumberStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            resultNumberStack.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        resultNumberStack.addArrangedSubview(userNumberLabel)
        userNumberLabel.text = "\(userNumber)"
        userNumberLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        userNumberLabel.textColor = .white
        
        resultNumberStack.addArrangedSubview(computerNumberLabel)
        computerNumberLabel.text = "\(computerNumber)"
        computerNumberLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        computerNumberLabel.textColor = .white
    }
    
    // Inform the player of the game results
    private func showGameResults(sameOdds: Bool){
        if(sameOdds){
            resultLabel.text = "The numbers are the same, you must do the dare!"
        } else {
            resultLabel.text = "The numbers are different, and you're safe!"
        }
        resultLabel.lineBreakMode = .byWordWrapping
        resultLabel.numberOfLines = 2
        resultLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        resultLabel.textAlignment = .center
        resultLabel.textColor = .white
        
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    // MARK: Game Logic
    
    private func playGame(){
        let firstNumber = generateNumber(range: selectedOdds)
        let secondNumber = generateNumber(range: selectedOdds)
        
        configureResultNumbers(userNumber: firstNumber, computerNumber: secondNumber)
        
        var sameOdds = false
        if(firstNumber == secondNumber){
            sameOdds = true
        }
        showGameResults(sameOdds: sameOdds)
    }
    
    // Generate a number between 1 and the passed parameter, range
    private func generateNumber(range: Int) -> Int {
        return Int.random(in: 1...range)
    }
    
}
