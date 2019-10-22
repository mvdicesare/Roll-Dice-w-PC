//
//  ViewController.swift
//  Roll Dice w-PC
//
//  Created by Michael Di Cesare on 10/22/19.
//  Copyright © 2019 Michael Di Cesare. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
 
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }
    
    var segmentedSwitch: UISegmentedControl {
        return diceAmount
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        activateButton()
        centerDiceImage.isHidden = true
        lowerStackView.isHidden = true
        diceAmount.selectedSegmentIndex = 0
        segmetedColor()
    }
    
    override func loadView() {
        super.loadView()
        addAllSubViews()
        constrainViews()
        setUpLowerStackView()
        setUpUpperStackView()
        segmetedColor()
    }

    // MARK: - Create Features
    let rollButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "Roll"), for: .normal)
        button.setTitle("ROLL", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentHorizontalAlignment = .center
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 20
        button.backgroundColor = .red
        return button
    }()
    
    let backgroundImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = (UIImage(named: "table"))
        return imageView
    }()
    
    let leftDiceImage: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let centerDiceImage: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let rightDiceImage: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let lowerLeftDiceImage: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let lowerRightDiceImage: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let backgtoundView: UIView = {
       let view = UIView()
        return view
    }()
    
    let upperStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    let lowerStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 0
        return stackView
    }()
    
    let diceAmount: UISegmentedControl = {
        let amount = UISegmentedControl()
      //  amount.numberOfSegments = 3
        amount.insertSegment(withTitle: "2", at: 0, animated: true)
        amount.insertSegment(withTitle: "3", at: 1, animated: true)
        amount.insertSegment(withTitle: "5", at: 2, animated: true)

        return amount
    }()
    let sumLabel: UILabel = {
        let label = UILabel()
        label.text = "The sum of the Dice are:"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    // MARK: - add subviews
    
    func addAllSubViews() {
        self.view.addSubview(backgtoundView)
        self.view.addSubview(backgroundImage)
        self.view.addSubview(sumLabel)
        self.view.addSubview(upperStackView)
        self.view.addSubview(leftDiceImage)
        self.view.addSubview(centerDiceImage)
        self.view.addSubview(rightDiceImage)
        self.view.addSubview(diceAmount)
        self.view.addSubview(rollButton)
        self.view.addSubview(lowerLeftDiceImage)
        self.view.addSubview(lowerRightDiceImage)
        self.view.addSubview(lowerStackView)
    }
    
    func setUpUpperStackView() {
        upperStackView.translatesAutoresizingMaskIntoConstraints = false
        upperStackView.addArrangedSubview(leftDiceImage)
        upperStackView.addArrangedSubview(centerDiceImage)
        upperStackView.addArrangedSubview(rightDiceImage)
    }
    
    func setUpLowerStackView() {
        lowerStackView.translatesAutoresizingMaskIntoConstraints = false
        lowerStackView.addArrangedSubview(lowerLeftDiceImage)
        lowerStackView.addArrangedSubview(lowerRightDiceImage)
    }
    
    // MARK: - constarain views
    func constrainViews() {
        backgtoundView.anchor(top: self.safeArea.topAnchor, bottom: self.safeArea.bottomAnchor, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 0, bottomPadding: 0, leadingPadding: 0, trailingPadding: 0)
        backgroundImage.anchor(top: self.safeArea.topAnchor, bottom: self.safeArea.bottomAnchor, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 0, bottomPadding: 0, leadingPadding: 0, trailingPadding: 0)
        sumLabel.anchor(top: self.safeArea.topAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 60, bottomPadding: 0, leadingPadding: 0, trailingPadding: 0)
        upperStackView.anchor(top: sumLabel.bottomAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 24, bottomPadding: 0, leadingPadding: 0, trailingPadding: 0, width: 300, hight: 150)
        diceAmount.anchor(top: upperStackView.bottomAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 20, bottomPadding: 0, leadingPadding: 0, trailingPadding: 0)
        rollButton.anchor(top: diceAmount.bottomAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 40, bottomPadding: 0, leadingPadding: 100, trailingPadding: 100, width: 100, hight: 75)
        lowerStackView.anchor(top: rollButton.bottomAnchor, bottom: nil, leading: self.safeArea.leadingAnchor, trailing: self.safeArea.trailingAnchor, topPadding: 80, bottomPadding: 0, leadingPadding: 0, trailingPadding: 0, width: 300, hight: 150)
    }
    
    // MARK: -  IBActions
    
    func activateButton() {
        rollButton.addTarget(self, action: #selector(rollDiceButtonTapped(sender:)), for: .touchUpInside)
    }
    @objc func rollDiceButtonTapped(sender: UIButton) {
        
        let num1 = arc4random_uniform(6) + 1
        let num2 = arc4random_uniform(6) + 1
        let num3 = arc4random_uniform(6) + 1
        let num4 = arc4random_uniform(6) + 1
        let num5 = arc4random_uniform(6) + 1
        
        leftDiceImage.image = UIImage(named: "Dice\(num1)")
        centerDiceImage.image = UIImage(named: "Dice\(num2)")
        rightDiceImage.image = UIImage(named: "Dice\(num3)")
        lowerLeftDiceImage.image = UIImage(named: "Dice\(num4)")
        lowerRightDiceImage.image = UIImage(named: "Dice\(num5)")
        
        if diceAmount.selectedSegmentIndex == 0 {
            centerDiceImage.isHidden = true
            lowerStackView.isHidden = true
            sumLabel.text = "The sum of the Dice are \(num1 + num2)"
        } else if diceAmount.selectedSegmentIndex == 1 {
            centerDiceImage.isHidden = false
            lowerStackView.isHidden = true
            sumLabel.text = "The sum of the Dice are \(num1 + num2 + num3)"
        } else {
            centerDiceImage.isHidden = false
            lowerStackView.isHidden = false
            sumLabel.text = "The sum of the Dice are \(num1 + num2 + num3 + num4 + num5)"

        }
    }
    
    func segmetedColor() {
        self.diceAmount.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        
            self.diceAmount.selectedSegmentTintColor = .red
        self.diceAmount.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .selected)
    }
}

