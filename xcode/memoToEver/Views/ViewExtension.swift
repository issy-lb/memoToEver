//
//  ViewExtension.swift
//  memoToEver
//
//  Created by 石田洋輔 on 2021/02/28.
//

import Foundation
import UIKit

//カラーコード
extension UIColor {
    
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int = 255) {
        let rgba = [red, green, blue, alpha].map { i -> CGFloat in
            switch i {
            case let i where i < 0:
                return 0
            case let i where i > 255:
                return 1
            default:
                return CGFloat(i) / 255
            }
        }
        self.init(red: rgba[0], green: rgba[1], blue: rgba[2], alpha: rgba[3])
    }
}
