//
//  SMTextField.swift
//  CustomTextField
//
//  Created by Sihem MOHAMED on 18/07/2018.
//  Copyright © 2018 SIMO. All rights reserved.
//

import UIKit

@IBDesignable class SMTextField: UITextField {

    @IBInspectable var rightImage : UIImage?{
        didSet{
            setupRightImage()
        }
    }

    @IBInspectable var leftImage : UIImage?{
        didSet{
            setupLeftImage()
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.white{
        didSet{
            setupBorderColor(borderColor)
        }
    }
    
    @IBInspectable var isBottomBorder : Bool = false{
        didSet{
            setupBorder()
        }
    }
    
    @IBInspectable var isLeftViewHidden : Bool = false{
        didSet{
            setupLeftImage()
        }
    }
    
    @IBInspectable var isRightViewHidden : Bool = false{
        didSet{
            setupRightImage()
        }
    }
    
    func setupBorder() {
        self.borderStyle = .none
        let borderLayer = CALayer()
        let width = CGFloat(2.0)
        borderLayer.borderColor = borderColor.cgColor
        borderLayer.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        borderLayer.borderWidth = width
        self.layer.addSublayer(borderLayer)
        self.layer.masksToBounds = true
    }
    
    func setupBorderColor(_ color: UIColor) {
        self.borderStyle = .line
        self.layer.borderColor = borderColor.cgColor
    }
    
    func setupLeftImage() {
        if isLeftViewHidden {
            self.leftViewMode = .never
        } else {
            let imageViewHeight = self.frame.height*0.8
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageViewHeight, height: imageViewHeight))
            imageView.image = leftImage
            self.leftView = imageView
            self.leftViewMode = .always
        }
    }
    
    func setupRightImage() {
        if isRightViewHidden {
            self.rightViewMode = .never
        } else {
            let imageViewHeight = self.frame.height*0.8
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageViewHeight, height: imageViewHeight))
            imageView.image = rightImage
            self.rightView = imageView
            self.rightViewMode = .always
        }
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text)
    }
    
    func setupView() {
        self.clipsToBounds = true
        setupRightImage()
        setupLeftImage()
        setupBorder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
}
