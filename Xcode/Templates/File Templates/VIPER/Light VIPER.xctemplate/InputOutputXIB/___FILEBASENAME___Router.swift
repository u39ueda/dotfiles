//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

final class ___VARIABLE_productName:identifier___Router: ___VARIABLE_productName:identifier___WireframeProtocol {

    // MARK: Properties

    private weak var viewController: ___VARIABLE_productName:identifier___ViewController?

    /// Factory method
    static func createModule() -> ___VARIABLE_productName:identifier___ViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ___VARIABLE_productName:identifier___ViewController(nibName: nil, bundle: nil)
        let router = ___VARIABLE_productName:identifier___Router()
        let presenter = ___VARIABLE_productName:identifier___Presenter(interface: view, router: router)

        view.presenter = presenter
        router.viewController = view

        return view
    }

    // MARK: - Life cycle

    private init() {
    }

    deinit {
    }

    // MARK: - WireframeProtocol
}