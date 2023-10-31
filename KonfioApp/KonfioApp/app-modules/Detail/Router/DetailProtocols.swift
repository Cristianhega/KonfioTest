//
//  DetailProtocols.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

protocol DetailViewProtocol: class {
    // PRESENTER -> VIEW
}

protocol DetailPresenterProtocol: class {
    //View -> Presenter
    var interactor: DetailInteractorProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var router: DetailRouterProtocol? {get set}
    
    func viewDidLoad()
    func goToFavorites()
}

protocol DetailInteractorProtocol: class {
    var presenter: DetailOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
}

protocol DetailOutputInteractorProtocol: class {
    //Interactor -> PresenterOutput
}

protocol DetailRouterProtocol: class {
    //Presenter -> Wireframe
    static func createModule(movie: Results) -> UIViewController
    func pushToFavorites(from view: UIViewController)
}
