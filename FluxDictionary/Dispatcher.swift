//
// Created by Søren Sjørup on 08/02/15.
// Copyright (c) 2015 ZORENDK. All rights reserved.
//

import Foundation

class DispatchManager {

    class var sharedInstance: Dispatcher {
        struct Static {
            static let instance : Dispatcher = Dispatcher()
        }
        return Static.instance
    }

    class Dispatcher {

        private var stores: [Store] = []

        func register(store: Store) {
            stores.append(store)
        }

        func dispatch(action: Action) {
            stores.map({ $0.processAction(action) })
        }
    }
}