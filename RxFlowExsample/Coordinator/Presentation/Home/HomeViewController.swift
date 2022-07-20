//
//  ViewController.swift
//  RxFlowExsample
//
//  Created by 이명직 on 2022/07/18.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import RxFlow

class HomeViewController: UIViewController, Stepper {
    var disposeBag = DisposeBag()
    var steps = PublishRelay<Step>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        bind()
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        MainTabBarContoller.shared.tabBarItem.title = "홈"
        
        view.addSubview(moveButton)
        
        moveButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(CGSize(width: 150, height: 40))
        }
    }
    
    // MARK: Binding
    private func bind() {
        moveButton.rx.tap
            .subscribe(onNext: {
                HomeStepper.shared.steps.accept(MainSteps.infoRequired)
            }).disposed(by: disposeBag)
    }
    
    // MARK: View
    lazy var moveButton = UIButton().then {
        $0.setTitle("Move To InfoVC", for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        $0.layer.cornerRadius = 4
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.titleLabel?.textColor = .white
    }
}

