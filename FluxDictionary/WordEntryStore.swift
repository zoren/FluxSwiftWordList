//
// Created by Søren Sjørup on 08/02/15.
// Copyright (c) 2015 ZORENDK. All rights reserved.
//

import Foundation
import UIKit

class WordEntryStore : Store {
    var viewController : ZFDWordListViewController!
    var pasteWordOpt : String?
    var wordList : [String] = []

    init(){
    }

    private func updateView(){
        if viewController == nil{
            return
        }
        if let word = pasteWordOpt {
            viewController.setPasteWord(word)
        }else{
            viewController.setPasteWord("")
        }
    }

    func setViewController(viewController : ZFDWordListViewController){
        self.viewController = viewController
        self.updateView()
    }

    func processAction(action : Action){
        switch action {
        case .LookupFromPasteboard(let wordOpt):
            if let word = wordOpt {
                if(UIReferenceLibraryViewController.dictionaryHasDefinitionForTerm(word)) {
                    pasteWordOpt = word
                    break
                }
            }
            pasteWordOpt = nil
        }
        self.updateView()
    }
}
