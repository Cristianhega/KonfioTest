//
//  HomeRouter.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    
    class func createModule() -> UIViewController {
        let view = HomeView()
        let router: HomeRouterProtocol = HomeRouter()
        let presenter: HomePresenterProtocol & HomeOutputInteractorProtocol = HomePresenter()
        let interactor: HomeInteractorProtocol = HomeInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
    
    func pushToDetailView(from view: UIViewController, dogs: [Dog]) {
        let controller = DetailRouter.createModule() as! DetailView
        controller.dogs = dogs
        view.navigationController?.pushViewController(controller, animated: true)
    }
}
