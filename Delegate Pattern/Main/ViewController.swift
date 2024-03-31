//
//  ViewController.swift
//  DeprecatedBootcamp
//
//  Created by Erdem on 31.03.2024.
//

import UIKit
import SnapKit


final class ViewController: UIViewController {
  
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .init(resource: .chooseYourSide)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var selectButton: UIButton = {
      
        let button = UIButton(configuration: .borderedProminent())
        button.configuration?.title = "Choose Some"
        button.configuration?.image = .init(systemName: "flag.2.crossed")
        button.configuration?.imagePadding = 20
        button.configuration?.background.backgroundColor = #colorLiteral(red: 0.2983503758, green: 0.322191368, blue: 0.468277927, alpha: 1)
        button.addAction(UIAction(handler: {  _ in
            self.presentToSelectionVC()
        }), for: .primaryActionTriggered)
        return button
    }()
    
    private lazy var counterLabel: UILabel = {
       let label = UILabel()
        label.text = "\(0)"
        label.textColor = .black
        return label
    }()
    
    private lazy var counterBackView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        let titlelabel = UILabel()
        titlelabel.text = "Counter:"
        titlelabel.textColor = .blue
        view.addSubview(titlelabel)
        titlelabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        view.addSubview(counterLabel)
        counterLabel.snp.makeConstraints { make in
            make.leading.equalTo(titlelabel.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBack()
        configureSubviews()
    }
    
    private func configureBack() {
        view.backgroundColor = #colorLiteral(red: 0.5003213882, green: 0.5386104584, blue: 0.7708742023, alpha: 1)
        
    }
    private func configureSubviews() {
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(300)
        }
        view.addSubview(selectButton)
        selectButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(200)
            make.width.equalTo(250)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        view.addSubview(counterBackView)
        counterBackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainImage.snp.bottom).offset(50)
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
    }
    private func presentToSelectionVC() {
        let selectionVC = SelectionViewController()
        selectionVC.delegate = self
        selectionVC.modalPresentationStyle = .pageSheet
        selectionVC.sheetPresentationController?.detents = [.medium(), .large()]
        selectionVC.sheetPresentationController?.prefersGrabberVisible = true
        present(selectionVC, animated: true)
    }
    
}
extension ViewController: SelectionViewController.SelectionViewDelegate {
    
    func changeColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    func changeImage(image: UIImage) {
        mainImage.image = image
    }
    
    func increaseRating() {
      
        if let counterText = counterLabel.text, var counterInt = Int(counterText) {
            counterInt += 1
            self.counterLabel.text = "\(counterInt)"
        }
       
    }
    
    func decreaseRating() {
        if let counterText = counterLabel.text, var counterInt = Int(counterText) {
            counterInt -= 1
            self.counterLabel.text = "\(counterInt)"
        }
    }
    
    
}
