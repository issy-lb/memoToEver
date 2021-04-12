//
//  ViewController.swift
//  memoToEver
//
//  Created by 石田洋輔 on 2021/02/27.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    var noteContents = NoteContents(contents: ["a","b","ああああいいいううううええええ"])


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        tableView.dragInteractionEnabled = true
        tableView.keyboardDismissMode = .interactive
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSendEN(_ sender: Any) {
        
    }
    @IBAction func onSave(_ sender: Any) {
    }
    
    
}







