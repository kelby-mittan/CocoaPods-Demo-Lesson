//
//  CocktailView.swift
//  CocoaPods-Demo
//
//  Created by Kelby Mittan on 2/27/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit
import SnapKit

class CocktailView: UIView {
    
    public lazy var cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 2
        label.text = "Cocktail Name"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var cocktailIngredients: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 5
        label.text = "Ingredients:"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var cocktailImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "photo.fill")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupCocktailImageConstraints()
        setupLabelConstraints()
        setupIngredientsConstraints()
    }
    
    private func setupCocktailImageConstraints() {
        addSubview(cocktailImage)
        cocktailImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(self)
        }
    }
    
    private func setupLabelConstraints() {
        addSubview(cocktailNameLabel)
        
        cocktailNameLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
    private func setupIngredientsConstraints() {
        addSubview(cocktailIngredients)
        
        cocktailIngredients.snp.makeConstraints { (make) in
            make.top.equalTo(cocktailImage).offset(200)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
    }
    
}

