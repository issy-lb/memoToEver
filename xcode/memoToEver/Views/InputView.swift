//
//  InputView.swift
//  memoToEver
//
//  Created by 石田洋輔 on 2021/02/28.
//

import Foundation
import UIKit

class InputView:UIView{
    @IBOutlet weak var albamBtn: UIBarButtonItem!
    @IBOutlet weak var cameraBtn: UIBarButtonItem!
    @IBOutlet weak var listBtn: UIBarButtonItem!
    @IBOutlet weak var timeBtn: UIBarButtonItem!
    @IBOutlet weak var inputField: UITextView!
    
    var delegate:InputViewDelegate!
    
    override init(frame:CGRect){
        super.init(frame:frame)
        setFromXib()
        autoresizingMask = .flexibleHeight
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setFromXib(){
        let nib = UINib.init(nibName: "InputView", bundle: nil)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        addSubview(view)
    }
    
    
//    バーのボタンを押した時のアクション
    @IBAction func onAlbam(_ sender: Any) {
    }
    @IBAction func onCamera(_ sender: Any) {
    }
    @IBAction func onList(_ sender: Any) {
    }
    @IBAction func onTime(_ sender: Any) {
    }
    
//    送信ボタンを押した時のアクション
    @IBAction func onSend(_ sender: Any) {
        if inputField.text != ""{
        delegate.sendTapped(text: inputField.text!)
        inputField.text = ""
        }
    }
    
    
}

protocol  InputViewDelegate:class {
    func sendTapped(text:String)
}
