//
//  OTPTextField.swift
//  MyOTPSample
//
//  Created by Fikri Adriansa Yudha on 12/06/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import UIKit

class OTPTextField: UITextField {

    private var isConfigure = false
    
    private var digitLabels = [UILabel]()
    
    private lazy var tapRecognizer: UITapGestureRecognizer = {
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self, action: #selector(becomeFirstResponder))
        return recognizer
    }()
    
    func configure(with countBox: Int = 4) {
        guard isConfigure == false else {
            return
        }
        isConfigure.toggle()
        configureTextField()
        
        addGestureRecognizer(tapRecognizer)
        
        let labelStackView = createLabelStackView(with: countBox)
        labelStackView.layer.cornerRadius = 20
        addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func configureTextField(){
        tintColor = .clear
        textColor = .clear
        keyboardType = .numberPad
        textContentType = .oneTimeCode
        
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    private func createLabelStackView(with count: Int) -> UIStackView{
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        
        for _ in 1 ... count{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont(name: "Poppins-Bold", size: 24)
            label.backgroundColor = .black
            label.textColor = .white
            label.layer.cornerRadius = 20
            label.isUserInteractionEnabled = true
            
            stackView.addArrangedSubview(label)
            
            digitLabels.append(label)
            
        }
        
        return stackView
    }
    
    @objc
    private func textDidChange(){
        guard let text = self.text, text.count <= digitLabels.count else {
            return
        }
        
        for i in 0 ..< digitLabels.count {
            let currentLabel = digitLabels[i]
            
            if i < text.count {
                let index = text.index(text.startIndex, offsetBy: i)
                currentLabel.text = String(text[index])
            }else{
                currentLabel.text?.removeAll()
            }
            
        }
    }
}
