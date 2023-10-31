//
//  DetailProtocols.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    // Presenter -> View
}

protocol DetailInputViewProtocol: AnyObject {
    // Presenter -> View
}

protocol DetailPresenterProtocol: AnyObject {
    // View -> Presenter
    var interactor: DetailInteractorProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var router: DetailRouterProtocol? {get set}
}

protocol DetailInteractorProtocol: AnyObject {
    var presenter: DetailOutputInteractorProtocol? {get set}
    // Presenter -> Interactor
}

protocol DetailOutputInteractorProtocol: AnyObject {
    // Interactor -> PresenterOutput
}

protocol DetailRouterProtocol: AnyObject {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
}
