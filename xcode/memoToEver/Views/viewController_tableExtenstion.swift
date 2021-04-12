//
//  viewController_tableExtenstion.swift
//  memoToEver
//
//  Created by 石田洋輔 on 2021/02/28.
//

import Foundation
import UIKit


//TableViewの実装
extension ViewController:UITableViewDelegate,UITableViewDataSource{
//    セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteContents.contents.count
    }
    
//    セルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! TextCell
        cell.initialize(noteContents.contents[indexPath.row] as! String){
            tableView.performBatchUpdates(nil, completion: nil)
            self.noteContents.update(sourcePath: indexPath.row, text: cell.textView.text)
        }
        return cell
    }
    
//    セルの削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            noteContents.contents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }

    
}


extension ViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let cells = tableView.visibleCells as! [TextCell]
        cells.forEach{cell in
            let textField = cell.textView!
            textField.isEditable = false
        }
        // Todo: implementation
        return [noteContents.dragItem(for: indexPath)]
    }
}

extension ViewController: UITableViewDropDelegate {
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession,
        withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
    }

    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        guard let item = coordinator.items.first,
            let destinationIndexPath = coordinator.destinationIndexPath,
            let sourceIndexPath = item.sourceIndexPath else { return }

        tableView.performBatchUpdates({ [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.noteContents.moveItem(sourcePath: sourceIndexPath.row, destinationPath: destinationIndexPath.row)
            tableView.deleteRows(at: [sourceIndexPath], with: .automatic)
            tableView.insertRows(at: [destinationIndexPath], with: .automatic)
            }, completion: nil)
        coordinator.drop(item.dragItem, toRowAt: destinationIndexPath)
        let cells = tableView.visibleCells as! [TextCell]
        cells.forEach{cell in
            let textField = cell.textView!
            textField.isEditable = true
        }
    }
}
