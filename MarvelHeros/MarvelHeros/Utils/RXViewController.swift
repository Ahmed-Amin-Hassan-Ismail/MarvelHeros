//
//  RXViewController.swift
//  MarvelHeros
//
//  Created by Ahmed Amin on 24/02/2024.
//

import UIKit
import RxSwift

class RXViewController: UIViewController {
    
    
    #if TRACE_RESOURCES
    private let startResourceCount = RxSwift.resourceCount
    #endif
    
    let disposableBag = DisposeBag()
    let rx_viewDidLoad: Observable<Void> = PublishSubject()
    let rx_viewWillAppear: Observable<Void> = PublishSubject()
    let rx_viewDidAppear: Observable<Void> = PublishSubject()
    let rx_viewWillDisappear: Observable<Void> = PublishSubject()
    let rx_viewDidDisappear: Observable<Void> = PublishSubject()
  
    override func viewDidLoad() {
       super.viewDidLoad()
       #if TRACE_RESOURCES
          print("Number of start resources = \(resourceCount)")
       #endif
        //(rx_viewDidLoad as? PublishSubject<Void>)?.on(.next(<#Void#>))
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       //(rx_viewWillAppear as? PublishSubject<Void>)?.on(.Next())
    }
    
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
       //(rx_viewDidAppear as? PublishSubject<Void>)?.on(.Next())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       //(rx_viewWillDisappear as? PublishSubject<Void>)?.on(.Next())
    }
    
    override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(animated)
       //(rx_viewDidDisappear as? PublishSubject<Void>)?.on(.Next())
    }
    
    deinit {
       #if TRACE_RESOURCES
          print("deinit \(self)")
          print("View controller disposed with \(RxSwift.resourceCount) resources")
          let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.1 * Double(NSEC_PER_SEC)))
          dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
             print("Number of resource after deinit \(RxSwift.resourceCount)")
          })
       #endif
    }
    
}
