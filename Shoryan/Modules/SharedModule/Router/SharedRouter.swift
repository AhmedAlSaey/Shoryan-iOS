//
//  RequestRouter.swift
//  Shoryan
//
//  Created by Ahmed AlSai on 22/03/2021.
//

import UIKit

class SharedRouter: BaseRouter {
    static let shared = SharedRouter()
    
    func dismissRequestView(vc: UIViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
}
