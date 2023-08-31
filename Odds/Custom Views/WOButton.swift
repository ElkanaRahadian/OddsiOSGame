//
//  WOButton.swift
//  Odds
//
//  Created by Elkana Antonio on 30/04/21.
//  Copyright © 2021 Elkana Antonio. All rights reserved.
//

import UIKit

class WOButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure(){
        layer.cornerRadius = 10
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline) //System font
        translatesAutoresizingMaskIntoConstraints = false //Use autolayout
    }

}
