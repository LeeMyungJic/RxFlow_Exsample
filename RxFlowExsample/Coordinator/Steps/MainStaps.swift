//
//  MainStaps.swift
//  RxFlowExsample
//
//  Created by 이명직 on 2022/07/18.
//

import RxFlow

enum MainSteps: Step {
    case initialization
    case back
    case dismiss
    // Main
    case home
    case setting
    // Home
    case infoRequired
    // Setting
    case firstRequired
    case secondRequired
    case thirdRequired
    case modalRequired
    // News
    case newsRequired
}

