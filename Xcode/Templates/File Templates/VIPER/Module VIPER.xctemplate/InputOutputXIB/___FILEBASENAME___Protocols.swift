//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

// MARK: - Wireframe

/// Routerが公開するメソッドを定義する.
///
/// Routerに適用する.
/// Presenter -> Wireframe
public protocol ___VARIABLE_productName:identifier___WireframeProtocol: class {
}

// MARK: - Presenter

/// PresenterがViewに対して公開するメソッドを定義する.
///
/// Presenterに適用する.
/// ViewController -> Presenter
public protocol ___VARIABLE_productName:identifier___PresenterProtocol: class {
    var interactor: ___VARIABLE_productName:identifier___InteractorInputProtocol? { get set }

    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}

// MARK: - Interactor

/// Interactorからの出力を定義する.
///
/// Presenterに適用する.
/// Interactor -> Presenter
public protocol ___VARIABLE_productName:identifier___InteractorOutputProtocol: class {
}

/// Interactorが受け取る入力メソッドを定義する.
///
/// Interactorに適用する.
/// Presenter -> Interactor
public protocol ___VARIABLE_productName:identifier___InteractorInputProtocol: class {
    var presenter: ___VARIABLE_productName:identifier___InteractorOutputProtocol? { get set }
}

// MARK: - View

/// ViewがPresenterに対して公開するメソッドを定義する.
///
/// ViewControllerに適用する.
/// Presenter -> ViewController
public protocol ___VARIABLE_productName:identifier___ViewProtocol: class {
    var presenter: ___VARIABLE_productName:identifier___PresenterProtocol? { get set }
}
