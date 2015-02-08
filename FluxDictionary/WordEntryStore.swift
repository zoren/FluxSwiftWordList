//
// Created by Søren Sjørup on 08/02/15.
// Copyright (c) 2015 ZORENDK. All rights reserved.
//

import Foundation
import UIKit

class WordEntryStore : Store {
    let viewController : WordListViewController
    var pasteWordOpt : String?
    var wordList : [String] = []

    init(_ viewController : WordListViewController){
        self.viewController = viewController
    }

    func processAction(action : Action){
        switch action {
        case .LookupFromPasteboard(let wordOpt):
            if let word = wordOpt {
                if(UIReferenceLibraryViewController.dictionaryHasDefinitionForTerm(word)) {
                    viewController.setPasteWord(word)
                }else{
                    viewController.setPasteWord("")
                }
            }else{
                viewController.setPasteWord("")
            }
        }
    }
}
