//
//  RegisterViewController.swift
//  vg
//
//  Created by Zry on 2017/11/18.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import UIKit
import SVProgressHUD
class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnCode: UIButton!
    @IBOutlet weak var psw2: UITextField!
    @IBOutlet weak var psw1: UITextField!
    @IBOutlet weak var messageCode: UITextField!
    @IBOutlet weak var mobile: UITextField!

    @IBOutlet weak var btn_return: UIButton!
    
    private var countTimer: Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataFormate()
       
        //messageCode.addTarget(self, action: #selector(codeLimit), for: .editingChanged)
        
        btn_return.addTarget(self, action: #selector(returnBack), for: .touchUpInside)
        btnCode.addTarget(self, action:  #selector(CountCode), for: .touchUpInside)
        btnRegister.addTarget(self, action: #selector(register), for: .touchUpInside)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        let newLength = text.count + string.count - range.length
        if(textField.tag == 11){
            return newLength <= 11
        }else if(textField.tag == 4){
            return newLength <= 4
        }else if(textField.tag == 12){
            return newLength <= 12
        }
        return true
    }
   
    
    private func initDataFormate(){
        mobile.tag = 11
        messageCode.tag = 4
        psw1.tag = 12
        psw2.tag = 12
        psw1.delegate = self
        psw2.delegate = self
        mobile.delegate = self
        messageCode.delegate = self
        psw1.isSecureTextEntry = true
        psw2.isSecureTextEntry = true
    }

    @objc func register(){
        let mobile = self.mobile.text
        let pass1 = self.psw1.text
        let pass2 = self.psw2.text
        let messageCode = self.messageCode.text
        if(validate(mobile: mobile!, pass1: pass1!, pass2: pass2!, messageCode: messageCode!)){
            SVProgressHUD.setForegroundColor(UIColor.white)
            SVProgressHUD.setBackgroundColor(UIColor.black)
            SVProgressHUD.show(withStatus: "正在注册中...")
        }else{
            SVProgressHUD.show(withStatus: "数据输入有误...")
        }
        SVProgressHUD.dismiss(withDelay: 1)

    }
    
    private func validate(mobile: String, pass1: String, pass2: String,messageCode: String) -> Bool{
        var myResult = false
        if(mobile.count>0&&pass1.count>0&&pass2.count>0&&messageCode.count>0){
            if(pass1 == pass2){
                myResult = true
            }else{
                myResult=false
                SVProgressHUD.show(withStatus: "两次密码输入不相同...")
            }
        }
        return myResult
    }
    
    @objc func returnBack(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func CountCode(){
         isCounting = true
    }
    private var remainingSeconds: Int = 0{
        willSet{
            btnCode.setTitle("\(newValue)", for: .normal)
            if newValue <= 0 {
                btnCode.setTitle("获取验证码", for: .normal)
                isCounting=false
            }
        }
    }
    
    var isCounting = false {
        willSet {
            if newValue {
                countTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){_ in
                    self.remainingSeconds -= 1
                }
                remainingSeconds = 60
            }else{
                countTimer?.invalidate()
                countTimer = nil
            }
            btnCode.isEnabled = !newValue
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


