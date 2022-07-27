//
//  SecondViewController.swift
//  RxFlowExsample
//
//  Created by 이명직 on 2022/07/19.
//

import Foundation
import UIKit
import RxRelay
import RxSwift

class SecondViewController: UIViewController, ViewModelProtocol {
    typealias ViewModel = SettingViewModel
    var viewModel: SettingViewModel!
    
    var disposeBag = DisposeBag()
    
    let actionRelay = PublishRelay<SettingActionType>()
    
    lazy var secondView = SecondView()
    lazy var toastView = ModalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        bind()
    }
    
    // MARK: ViewModel Binding
    private func bind() {
        _ = viewModel.transform(req: ViewModel.Input(actionTrigger: actionRelay.asObservable()))
        
        secondView.setupDI(observable: actionRelay)
        toastView.setupDI(observable: actionRelay)
    }
    
    private func setupLayout() {
        view.addSubview(toastView)
        toastView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
