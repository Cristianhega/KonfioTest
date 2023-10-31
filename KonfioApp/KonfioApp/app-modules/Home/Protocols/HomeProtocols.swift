//
//  HomeProtocols.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    // Presenter -> View
    func showLoader()
    func hideLoader()
    func disableButton()
    func enableButton()
}

protocol HomeInputViewProtocol: AnyObject {
    // Presenter -> View
}

protocol HomePresenterProtocol: AnyObject {
    // View -> Presenter
    var interactor: HomeInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var router: HomeRouterProtocol? {get set}
    func fetchDogs()
    func showLoader()
    func hideLoader()
    func disableButton()
    func enableButton()
}

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomeOutputInteractorProtocol? {get set}
    // Presenter -> Interactor
    func getDogsData(from view: UIViewController)
}

protocol HomeOutputInteractorProtocol: AnyObject {
    // Interactor -> PresenterOutput
    func retry()
    func sendInfo(dogs: [Dog])
}

protocol HomeRouterProtocol: AnyObject {
    //Presenter -> Wireframe
    static func createModule() -> UIViewController
    func pushToDetailView(from view: UIViewController, dogs: [Dog])
}
