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

    private func updatePasteWordView(){
        if viewController == nil {
            return
        }
        viewController.setPasteWord(pasteWordOpt ?? "")
    }

    func setViewController(viewController : ZFDWordListViewController){
        self.viewController = viewController
        self.updatePasteWordView()
    }

    func processAction(action : Action){
        switch action {
        case .LookupFromPasteboard(let wordOpt):
            if let word = wordOpt {
                pasteWordOpt =
                        UIReferenceLibraryViewController.dictionaryHasDefinitionForTerm(word) ? word : nil
            }
            self.updatePasteWordView()
            break
        case .ShowDictionary(let word):
            viewController.showAndAddToList(word)
            break
        case .AddWordToList(let word):
            wordList.append(word)
            viewController.setWords(wordList)
            break
        }
    }

}
