//
// Created by Søren Sjørup on 08/02/15.
// Copyright (c) 2015 ZORENDK. All rights reserved.
//

import Foundation

protocol Store{
    func processAction(action : Action)
}