//
//  WordListViewController.swift
//  FluxDictionary
//
//  Created by Søren Sjørup on 07/02/15.
//  Copyright (c) 2015 ZORENDK. All rights reserved.
//


import UIKit

class ZFDWordListViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    var items : [String] = []
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
        if let word = pasteButton.title {
            if(countElements(word) > 0) {
                let action = Action.AddWordToList(word)
                DispatchManager.sharedInstance.dispatch(action)
            }
        }
    }

    func setPasteWord(word : String){
        pasteButton.title = word
    }

    func setWords(words : [String]){
        let currentCount = countElements(items)
        items = words
        let newCount = countElements(words)
        if(newCount > currentCount ){
            var paths : [NSIndexPath] = []
            for index in currentCount ... newCount - 1 {
                paths.append(NSIndexPath(forItem:index - currentCount, inSection : 0))
            }
            self.tableView.beginUpdates()
            self.tableView.insertRowsAtIndexPaths(paths, withRowAnimation: UITableViewRowAnimation.Top)
            self.tableView.endUpdates()
        }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellViewId = "CELL"
        var cell = self.tableView.dequeueReusableCellWithIdentifier(cellViewId) as? UITableViewCell
        if(cell == nil){
            cell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier : cellViewId)
        }
        cell!.textLabel?.text = items[items.count - indexPath.row - 1]
        return cell!
    }
}
