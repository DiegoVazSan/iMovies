//
//  HomeRouter.swift
//  iMovies
//
//  Created by Diego Vazquez Sanchez on 05/03/24.
//

import Foundation
import UIKit

class HomeRouter {
    var vc:UIViewController {
        return createVC()
    }
    
    private var sourceView: UIViewController?
    
    ///Create and return a UIViewController
    private func createVC() -> UIViewController {
        let vc = HomeVC(nibName: "HomeVC", bundle: Bundle.main)
        return vc
    }
    
    func setThisSourceView(_ sourceView: UIViewController?){
        guard let view = sourceView else { fatalError("Error desconocido") }
        return self.sourceView = view
    }
}
