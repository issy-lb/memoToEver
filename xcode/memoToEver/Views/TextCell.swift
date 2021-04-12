//
//  TextCell.swift
//  memoToEver
//
//  Created by 石田洋輔 on 2021/02/28.
//

import Foundation
import UIKit
class TextCell:UITableViewCell{
    private var onChanged:(()->Void)!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cellContents: UIView!
    
    func initialize(_ text:String,chanded: @escaping () -> Void){
        textView.text = text
        textView.isEditable = true
        onChanged = chanded
        textView.delegate = self
        textView.layer.cornerRadius = self.frame.size.width * 0.02
        textView.clipsToBounds = true
    }
}
extension TextCell:UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            self.onChanged()
        }
        return true
    }
    
}
