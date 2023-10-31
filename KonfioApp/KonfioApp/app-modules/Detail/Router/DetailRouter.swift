//
//  DetailRouter.swift
//  KonfioApp
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    
    class func createModule() -> UIViewController {
        let view = DetailView()
        let router: DetailRouterProtocol = DetailRouter()
        let presenter: DetailPresenterProtocol & DetailOutputInteractorProtocol = DetailPresenter()
        let interactor: DetailInteractorProtocol = DetailInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }
}
