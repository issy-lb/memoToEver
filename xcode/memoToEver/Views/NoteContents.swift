//
//  Note.swift
//  memoToEver
//
//  Created by 石田洋輔 on 2021/02/28.
//

import Foundation
import UIKit
struct NoteContents{
    var contents:[Any]
}

extension NoteContents{
    func dragItem(for indexPath: IndexPath) -> UIDragItem {
        let content = contents[indexPath.row]
        let itemProvider = NSItemProvider(object: content as! NSString)
        return UIDragItem(itemProvider: itemProvider)

}
    
    mutating func moveItem(sourcePath: Int, destinationPath: Int) {
          let content = contents.remove(at: sourcePath)
          contents.insert(content, at: destinationPath)
      }
    mutating func remove(at:Int){
        contents.remove(at: at)
    }
    mutating func update(sourcePath: Int, text:String){
        contents[sourcePath] = text
    }
}
