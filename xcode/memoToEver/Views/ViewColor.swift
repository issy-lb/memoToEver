//
//  ViewColor.swift
//  memoToEver
//
//  Created by 石田洋輔 on 2021/02/28.
//
//色を定義するファイル

import Foundation
import UIKit

let textColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
    // ダークモードの場合
    if traitCollection.userInterfaceStyle == .dark {
        return .white
    } else {
        return .blue
    }
}
