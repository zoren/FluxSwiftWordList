//
//  WordListViewController.swift
//  FluxDictionary
//
//  Created by Søren Sjørup on 07/02/15.
//  Copyright (c) 2015 ZORENDK. All rights reserved.
//


import UIKit

class WordListViewController: UITableViewController, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        registerWithAppDelegate()
    }

    func registerWithAppDelegate(){
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.registerViewController(self)
    }

    func setPasteWord(word : String){

    }
    @IBOutlet weak var pasteBarButton: UIBarButtonItem!
//
    @IBAction func lookupPasteWord(sender: AnyObject) {
//        addAndLookupWord(self.pasteboardWord!)
    }

    func addPasteWordToList(){

    }
}
