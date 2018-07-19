//
//  SMVerifiedTextField.swift
//  CustomTextField
//
//  Created by Sihem MOHAMED on 18/07/2018.
//  Copyright © 2018 SIMO. All rights reserved.
//

import UIKit

@IBDesignable class SMVerifiedTextField: UIControl, UITextFieldDelegate {

    var textField : UITextField = UITextField()
    var requiredImageView: UIImageView = UIImageView()
    var label : UILabel = UILabel()
    var labelTextAlignment : NSTextAlignment = .right{
        didSet{
            label.textAlignment = labelTextAlignment
        }
    }
    @IBInspectable var requiredImage : UIImage?{
        didSet{
            setupImageView()
        }
    }
    
    @IBInspectable var textLabel : String? = "label"{
        didSet{
            setupTextLabel(textLabel)
        }
    }
    
    @IBInspectable var labelTextColor : UIColor = UIColor.white{
        didSet{
            setupLabelTextColor(labelTextColor)
        }
    }
    
    
    
    @IBInspectable var textFieldColor : UIColor = UIColor.white{
        didSet{
            setupTextFieldColor(textFieldColor)
        }
    }
    
    @IBInspectable var textFieldBackgroundColor : UIColor = UIColor.white{
        didSet{
            setupTextFieldBackgroundColor(textFieldBackgroundColor)
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.white{
        didSet{
            setupBorderColor(borderColor)
        }
    }
    
    var textAlignment : NSTextAlignment = .center{
        didSet{
            textField.textAlignment = textAlignment
        }
    }
    
    var textFont : UIFont = UIFont.systemFont(ofSize: 18){
        didSet{
            textField.font = textFont
        }
    }
    
    @IBInspectable var interSpace: CGFloat = 10 {
        didSet{
            setupInterSpace(interSpace)
        }
    }
    
    @IBInspectable var isSecureTextFieldEntry : Bool = false {
        didSet{
            setupIsSecureTextFieldEntry(isSecureTextFieldEntry)
        }
    }
    
    @IBInspectable var isDecimalTextFieldEntry : Bool = false {
        didSet{
           setupIsDecimalTextFieldEntry(isDecimalTextFieldEntry)
        }
    }
    
    func setupTextField() {
        textField.delegate = self
        textField.textAlignment = textAlignment
        self.addSubview(textField)
    }
    
    func setupImageView() {
        requiredImageView.removeFromSuperview()
        requiredImageView.image = requiredImage
        self.addSubview(requiredImageView)
    }
    
    func setupTextLabel(_ text: String?) {
        label.removeFromSuperview()
        label.text = text
        label.textAlignment = labelTextAlignment
         self.addSubview(label)
    }
    
    func setupLabelTextColor(_ color: UIColor) {
        label.textColor = color
    }
    
    func setupTextFieldColor(_ color: UIColor) {
        textField.textColor = color
    }
    
    func setupTextFieldBackgroundColor(_ color: UIColor) {
        textField.backgroundColor = color.withAlphaComponent(0.7)
    }
    
    func setupBorderColor(_ color: UIColor) {
        textField.borderStyle = .line
        textField.layer.borderColor = borderColor.cgColor
    }
    
    func setupInterSpace(_ value: CGFloat) {
        let height = bounds.height
        let imageWidth = CGFloat(20)
        let labelWidth = (frame.width - 2*value) / 3
        let textFieldWidth = 2*labelWidth - imageWidth
        label = UILabel(frame: CGRect(x: 0, y: 0, width: labelWidth, height: height))
        textField = UITextField(frame: CGRect(x: labelWidth+value, y: 0, width: textFieldWidth, height: height))
        let xImgPosition = labelWidth+textFieldWidth+(2*value)
        let yImgPosition = imageWidth/2
        requiredImageView = UIImageView(frame: CGRect(x: xImgPosition, y: yImgPosition, width: imageWidth, height: imageWidth))
    }
    func setupIsSecureTextFieldEntry(_ value: Bool) {
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = value
    }
    
    func setupIsDecimalTextFieldEntry(_ value: Bool) {
        textField.keyboardType = isDecimalTextFieldEntry ? .decimalPad : .default
        textField.autocorrectionType = .no
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        backgroundColor = UIColor.clear
        
        setupInterSpace(interSpace)
        insertSubview(self.label, at: 0)
        insertSubview(self.textField, at: 0)
        insertSubview(self.requiredImageView, at: 0)
        setupTextField()
        setupImageView()
        setupTextLabel(textLabel)
        setupLabelTextColor(UIColor.white)
        setupTextFieldColor(UIColor.white)
        setupTextFieldBackgroundColor(UIColor.lightGray)
        setupBorderColor(UIColor.white)
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
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        let location = touch.location(in: self)
       
        if textField.frame.contains(location){
            sendActions(for: .editingChanged)
            requiredImageView.isHidden = false
        }
        
        
        return false
    }
    
    /// MARK : UITextFieldDelegate functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
}
