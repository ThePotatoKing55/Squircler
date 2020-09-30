//
//  ViewController.swift
//  squircler
//
//  Created by Aidan Cline on 9/29/20.
//

import Cocoa

class ConfigViewController: NSViewController, NSTextFieldDelegate {
    
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var field: NSTextField!
    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var previewBox: NSBox!
    
    var screenSize: CGSize {
        return view.window?.screen?.frame.size ?? .zero
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        setCornerRadius(Defaults.screenCornerRadius)
        slider.action = #selector(sliderDidChange)
        field.placeholderString = String(Defaults.defaultScreenCornerRadius)
        let fieldFormatter = field.formatter as? NumberFormatter
        fieldFormatter?.minimum = 0
        fieldFormatter?.maximum = NSNumber(value: Float(min(screenSize.height / 2, screenSize.width / 2)))
        fieldFormatter?.allowsFloats = true
        fieldFormatter?.minimumFractionDigits = 1
        field.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        setCornerRadius(fieldEditor.string.isEmpty ? -1 : Float(fieldEditor.string) ?? Defaults.screenCornerRadius)
        return true
    }
    
    @objc func sliderDidChange(_ slider: NSSlider) {
        setCornerRadius(slider.floatValue)
    }
    
    func setCornerRadius(_ cornerRadius: Float) {
        Defaults.screenCornerRadius = cornerRadius
        let radius = Defaults.screenCornerRadius
        slider.minValue = 0
        slider.maxValue = Double(screenSize.height / 2)
        slider.floatValue = radius
        field.stringValue = String(radius)
        previewBox.layer?.cornerRadius = (CGFloat(radius) / screenSize.height) * imageView.frame.height
    }
    
}

