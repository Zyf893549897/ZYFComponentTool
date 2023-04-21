//
//  RxViewController.swift
//  ZYFComponentTool_Example
//
//  Created by 张云飞 on 2023/2/21.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class RxViewController: ZYFBaseViewController {
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(phone)
        view.addSubview(textA)
        view.addSubview(code)
        view.addSubview(textB)
        view.addSubview(sendBut)
        phone.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.top.equalTo(120)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        textA.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.top.equalTo(phone.snp.bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        code.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.top.equalTo(phone.snp.bottom).offset(80)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        textB.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.top.equalTo(code.snp.bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        sendBut.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.top.equalTo(textB.snp.bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        
        //rx 的简单使用
        
        let phoneValid = phone.rx.text.orEmpty
            .map{$0.count == 11}
            .share(replay: 1)
        phoneValid.bind(to: textA.rx.isHidden)
            .disposed(by: disposeBag)
        
        let codeValid = code.rx.text.orEmpty
            .map{$0.count == 6}
            .share(replay: 1)
        codeValid.bind(to: textB.rx.isHidden)
            .disposed(by: disposeBag)
        
        // 合并 2个输入框的 条件  &&  ||
        let butValid = Observable.combineLatest(phoneValid,codeValid){$0 && $1}
            .share(replay:1)
        //绑定 but 的使能状态
        butValid.bind(to: sendBut.rx.isEnabled)
            .disposed(by: disposeBag)
        
        //写法一
//        butValid.subscribe(onNext: { [weak self] isValid in
//            if isValid == false{
//                self?.sendBut.backgroundColor = .gray
//            }else{
//                self?.sendBut.backgroundColor = .blue
//            }
//        }, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposeBag)
//
        // 写法二
        butValid.subscribe {[weak self] event in
            if case let .next(isok) = event{
                if isok == false{
                    self?.sendBut.backgroundColor = .gray
                    self?.sendBut.isEnabled = false
                }else{
                    self?.sendBut.backgroundColor = .blue
                    self?.sendBut.isEnabled = true
                }
            }

        }.disposed(by: disposeBag)
        
        //多任务都完成后的 回调
        Observable.zip(taskA_action().asObservable(), taskB_action().asObservable(),taskC_action().asObservable()).subscribe{isokA,isokB,isokC in
            print("所有任务完成====\(isokA)====\(isokB)=====\(isokC)")
        }.disposed(by: disposeBag)
    }
    //task 1
    func taskA_action() -> Single<Bool>{
        return Single<Bool>.create { single in
            print("任务 一")
            //网络请求
            timeDelay(1) {
                single(.success(true)) //请求完成
//            single(.success(false))
            }
            

            return Disposables.create{}
        }
    }
    //task 2
    func taskB_action() -> Single<Bool>{
        return Single<Bool>.create { single in
            print("任务 二")
            //网络请求
            timeDelay(2) {
                single(.success(true)) //请求完成
//            single(.success(false))
            }
            return Disposables.create{}
        }
    }
    //task 3
    func taskC_action() -> Single<Bool>{
        return Single<Bool>.create { single in
            print("任务 三")
            //网络请求
            timeDelay(3) {
                single(.success(true)) //请求完成
//            single(.success(false))
            }

            return Disposables.create{}
        }
    }
    
    lazy var phone: UITextField={
        let textfiled = ZYFCreateTextfiled(frame: .zero, placeholder: "电话", Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), textcolor: .red, bgColor: .blue)
        return textfiled
    }()
    lazy var textA: UILabel={
        let label = ZYFCreatLable(frame: .zero, text: "电话", textcolor: .red, Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12), bgcolor: .clear, num: 1)
        return label
    }()
    
    lazy var code: UITextField={
        let textfiled = ZYFCreateTextfiled(frame: .zero, placeholder: "电话", Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 14), textcolor: .red, bgColor: .blue)
        return textfiled
    }()
    lazy var textB: UILabel={
        let label = ZYFCreatLable(frame: .zero, text: "验证码", textcolor: .red, Alignment: .left, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 12), bgcolor: .clear, num: 1)
        return label
    }()
    lazy var sendBut: UIButton={
        let but = ZYFCreateTitleButton(frame: .zero, text: "确定", bgcolor: .gray, textcolor: .white, font: UIFont.setFontStlye(style: .Peugeot_New, scaleFontSize: 18), Alignment: .center, offset: 0, target: nil, action: nil)
        return but
    }()
}
