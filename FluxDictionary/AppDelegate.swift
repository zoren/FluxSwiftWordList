//
//  AppDelegate.swift
//  FluxDictionary
//
//  Created by Søren Sjørup on 07/02/15.
//  Copyright (c) 2015 ZORENDK. All rights reserved.
//


import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    let wordEntryStore : WordEntryStore = WordEntryStore()

    func dispatchPasteboardLookup(){
        let wordOpt = UIPasteboard.generalPasteboard().string
        if let word = wordOpt {
            let action: Action = Action.LookupFromPasteboard(word)
            DispatchManager.sharedInstance.dispatch(action)
        }
    }

    // unfortunately we have to do this as we do not instantiate the viewcontrollers ourselves
    func registerViewController( viewController : UIViewController ){
        if let wordListVC = viewController as? ZFDWordListViewController {
            self.wordEntryStore.setViewController(wordListVC)
        }
    }

    func setupFlux(){
        DispatchManager.sharedInstance.register(wordEntryStore)
    }

    func application(application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupFlux()
        dispatchPasteboardLookup()
        return true
    }

    func applicationWillEnterForeground(application: UIApplication) {
        dispatchPasteboardLookup()
    }
}
