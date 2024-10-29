//
//  RxSwiftTest.swift
//  HW7M3P8_2CoreData2
//
//  Created by Baha Sadyr on 10/28/24.
//

import RxSwift
import RxCocoa

class RxSwiftTest {
    let disposeBag = DisposeBag()
    
    func testRxSwift() {
        Observable.just("Hello RxSwift!")
            .subscribe(onNext: {string in
                print(string)
            })
            .disposed(by: disposeBag)
    }
}

