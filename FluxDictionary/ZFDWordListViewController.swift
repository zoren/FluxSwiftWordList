//
//  WordListViewController.swift
//  FluxDictionary
//
//  Created by Søren Sjørup on 07/02/15.
//  Copyright (c) 2015 ZORENDK. All rights reserved.
//


import UIKit

class ZFDWordListViewController: UITableViewController, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        registerWithAppDelegate()
    }

    func registerWithAppDelegate(){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.registerViewController(self)
    }

    @IBOutlet weak var pasteButton: UIBarButtonItem!
    
    @IBAction func addPasteWordToList(sender: AnyObject) {
        // todo
    }

    func setPasteWord(word : String){
        pasteButton.title = word
    }
}
