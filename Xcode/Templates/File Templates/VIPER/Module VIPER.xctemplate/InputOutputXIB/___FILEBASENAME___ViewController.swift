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

final class ___VARIABLE_productName:identifier___ViewController: UIViewController, ___VARIABLE_productName:identifier___ViewProtocol {

    // MARK: - IBOutlet

    // MARK: Properties

	var presenter: ___VARIABLE_productName:identifier___PresenterProtocol?

    // MARK: - Life cycle

    deinit {
    }

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        presenter?.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter?.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        presenter?.viewWillDisappear(animated)
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        presenter?.viewDidDisappear(animated)
        super.viewDidDisappear(animated)
    }

    // MARK: Rotate

    // MARK: Override

    // MARK: - ViewProtocol
}

// MARK: - Methods
// MARK: - Actions
// MARK: - Notifications