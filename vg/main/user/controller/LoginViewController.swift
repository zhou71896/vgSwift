//
//  LoginViewController.swift
//  vg
//
//  Created by Zry on 2017/11/18.
//  Copyright © 2017年 com.ala.main. All rights reserved.
//

import UIKit
import SVProgressHUD
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputMobile: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnForgetPsw: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataFormate()
        btnLogin.addTarget(self, action: #selector(login), for:.touchUpInside)
        btnRegister.addTarget(self, action: #selector(register), for:.touchUpInside)
    }
    private func initDataFormate(){
        inputMobile.tag = 11
        inputPassword.tag = 12
        inputMobile.delegate = self
        inputPassword.delegate = self
        inputPassword.isSecureTextEntry = true
    }

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            return true
        }
        let newLength = text.count + string.count - range.length
        if(textField.tag == 11){
            return newLength <= 11
        }
       else if(textField.tag == 12){
            return newLength <= 12
        }
        return true
    }
    @objc func login(){
        let mobile = inputMobile.text!;
        let password = inputPassword.text!;
        if(validate(mobile: mobile, password: password)){
            SVProgressHUD.setForegroundColor(UIColor.white)
            SVProgressHUD.setBackgroundColor(UIColor.black)
            SVProgressHUD.show(withStatus: "正在登录中...")
            NetWork.login(mobile: mobile, password: password){ (result) in
                let myResult = result.resultStatus as Bool!
                SVProgressHUD.dismiss();
                if(myResult)!{
                    SVProgressHUD.showInfo(withStatus: "登录成功")
                    SVProgressHUD.dismiss();
                    let destinationStoryboard = UIStoryboard(name:"Main",bundle:nil)
                    let destinationViewController = destinationStoryboard.instantiateViewController(withIdentifier: "MainCustomerScene") as UIViewController
                    self.present(destinationViewController, animated: true, completion: nil)
                }else{
                    SVProgressHUD.showInfo(withStatus: "登录失败,密码或者手机号错误")
                }
            }
        }else{
            SVProgressHUD.showInfo(withStatus: "请输入有效的用户名和密码");
        }
        SVProgressHUD.dismiss(withDelay: 1)
    }
    
    
    private func saveUserData(){
        
    }
    
    func validate(mobile:String, password:String) -> Bool{
        var myResult = false
        if(mobile.count>0&&password.count>0){
          
                myResult = true
            
        }
        return myResult
    }
    @objc func register(){
       
        
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
