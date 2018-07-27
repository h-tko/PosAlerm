//
//  SetAlermController.swift
//  PosAlerm
//
//  Created by 竹尾広章 on 2018/07/19.
//  Copyright © 2018年 竹尾広章. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialButtons
import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialTextFields_ColorThemer

class SetAlermController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleText: MDCTextField!
    @IBOutlet weak var alermTime: UIDatePicker!
    @IBOutlet weak var timeText: MDCTextField!
    @IBOutlet weak var RegistButton: MDCRaisedButton!
    
    var titleTextController: MDCTextInputController!
    var timeTextController: MDCTextInputController!
    var toolBar: UIToolbar!
    var alermPicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let colorScheme = MDCSemanticColorScheme()
        //MDCTextFieldColorThemer.apply(colorScheme as! MDCColorScheme, to: titleText)

        initUIItems()
    }
    
    func initUIItems() {
        RegistButton.setElevation(.raisedButtonResting, for: .normal)
        
        titleText.placeholder = "タイトル"
        titleText.delegate = self
        titleTextController = MDCTextInputControllerUnderline(textInput: titleText)
        
        timeText.placeholder = "アラームを設定する日時"
        timeText.delegate = self
        timeTextController = MDCTextInputControllerUnderline(textInput: timeText)

        alermPicker = UIDatePicker()
        alermPicker.addTarget(self, action: Selector(("changedAlermDateEvent")), for: UIControlEvents.valueChanged)
        alermPicker.datePickerMode = UIDatePickerMode.dateAndTime
        timeText.inputView = alermPicker
        
        toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height / 6, width: self.view.frame.size.width, height: 40.0))
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height - 20.0)
        toolBar.barStyle = .blackTranslucent
        toolBar.tintColor = UIColor.white
        toolBar.backgroundColor = UIColor.lightGray
        
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(SetAlermController.tappedToolBarBtn))
        let toolBarNowBtn = UIBarButtonItem(title: "今の時間", style: .plain, target: self, action: #selector(SetAlermController.tappedToolBarNowBtn))
        
        toolBarBtn.tag = 1
        toolBar.items = [toolBarBtn, toolBarNowBtn]
        
        timeText.inputAccessoryView = toolBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changedAlermDateEvent(sender: AnyObject?) {
        _ = sender as! UIDatePicker
        self.changeLabelDate(date: alermPicker.date)
    }

    @objc func tappedToolBarBtn(sender: UIBarButtonItem) {
        timeText.resignFirstResponder()
    }
    
    @objc func tappedToolBarNowBtn(sender: UIBarButtonItem) {
        let now = Date()
        alermPicker.date = now
        
        changeLabelDate(date: now)
    }
    
    func changeLabelDate(date: Date) {
        timeText.text = date.toString()
    }
    
    @IBAction func onTouchDownRegist(_ sender: Any) {
        let alerm = Alerm()
        alerm.datetime = alermPicker.date
        alerm.title = titleText.text!
        alerm.isEnable = true
        
        AlermRepository().save(alerm: alerm)
    }
}

