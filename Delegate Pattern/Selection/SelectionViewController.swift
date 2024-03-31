//
//  SelectionViewController.swift
//  DeprecatedBootcamp
//
//  Created by Erdem on 31.03.2024.
//

import UIKit


final class SelectionViewController: UIViewController {
    
    protocol SelectionViewDelegate: AnyObject {
        func changeColor(color: UIColor)
        func changeImage(image: UIImage)
        func increaseRating()
        func decreaseRating()
    }
    
    weak var delegate: SelectionViewDelegate?
    private let viewModel = SelectionViewModel()
    
    private lazy var changeBackgroundColorSelection: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
        button.configuration?.title = "Change Color"
        button.configuration?.imagePadding = 20
        button.configuration?.background.backgroundColor = #colorLiteral(red: 0.2983503758, green: 0.322191368, blue: 0.468277927, alpha: 1)
        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self else {return}
            delegate?.changeColor(color: viewModel.returnRandomColor())
        }), for: .primaryActionTriggered)
        return button
    }()
    
    private lazy var changeBackgroundImageSelection: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
        button.configuration?.title = "Change Image"
        button.configuration?.imagePadding = 20
        button.configuration?.background.backgroundColor = #colorLiteral(red: 0.2983503758, green: 0.322191368, blue: 0.468277927, alpha: 1)
        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self else {return}
            delegate?.changeImage(image: viewModel.returnRandomImage())
        }), for: .primaryActionTriggered)
        return button
    }()
    
    private lazy var plusSelection: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
        button.configuration?.title = "+1 Counter"
        button.configuration?.imagePadding = 20
        button.configuration?.background.backgroundColor = #colorLiteral(red: 0.2983503758, green: 0.322191368, blue: 0.468277927, alpha: 1)
        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self else {return}
            delegate?.increaseRating()
        }), for: .primaryActionTriggered)
        return button
    }()
    
    private lazy var minusSelection: UIButton = {
        let button = UIButton(configuration: .borderedProminent())
        button.configuration?.title = "-1 Counter"
        button.configuration?.imagePadding = 20
        button.configuration?.background.backgroundColor = #colorLiteral(red: 0.2983503758, green: 0.322191368, blue: 0.468277927, alpha: 1)
        button.addAction(UIAction(handler: { [weak self] _ in
            guard let self else {return}
            delegate?.decreaseRating()
        }), for: .primaryActionTriggered)
        return button
    }()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBack()
        configureSubviews()
        
    }
    
    private func configureBack() {
        view.backgroundColor = .white
    }
    private func configureSubviews() {
        view.addSubview(changeBackgroundColorSelection)
        changeBackgroundColorSelection.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        view.addSubview(changeBackgroundImageSelection)
        changeBackgroundImageSelection.snp.makeConstraints { make in
            make.top.equalTo(changeBackgroundColorSelection.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        
        view.addSubview(plusSelection)
        plusSelection.snp.makeConstraints { make in
            make.top.equalTo(changeBackgroundImageSelection.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
        view.addSubview(minusSelection)
        minusSelection.snp.makeConstraints { make in
            make.top.equalTo(plusSelection.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
    }
    
   
}

