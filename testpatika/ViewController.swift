//
//  ViewController.swift
//  testpatika
//
//  Created by burak on 11.06.2023.
//

import UIKit

class ViewController: UIViewController {
    var username : String?
    var pass : String?
    var loadingTimer = Timer()
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var idPassControlLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func button(_ sender: UIButton) {
        username = nameText.text
        pass = passText.text
        
        if username == "burak" && pass == "123456"{
            loadingTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(loadingLogin), userInfo: nil, repeats: true)
            alertShow(message: "Giriş yapıldı", buttonMessage: "Devam et")
            idPassControlLabel.isHidden = true
        }
        else
        {
            if username == "" && pass == "" {
                idPassControlLabel.isHidden = false
                idPassControlLabel.text = "Kullanıcı adı ve şifre boş bırakılamaz."
                idPassControlLabel.textColor = .red
                
            }
            else if username == ""{
                idPassControlLabel.text = "Kullanıcı adı giriniz."
            }
            else if pass == ""{
                idPassControlLabel.text = "Şifre giriniz."
            }
                else{
                    
                    idPassControlLabel.text = "Hatalı giriş yaptınız."
                    idPassControlLabel.textColor = .red
                }
            
        }
        
        
        
    }
    @objc func loadingLogin(){
        
        activityIndicator.startAnimating()
        loadingTimer.invalidate()
        
        
    }
    func alertShow(message: String,buttonMessage: String){
        let alert = UIAlertController(title: "Uyarı", message: message, preferredStyle: .alert)
        let okbtn = UIAlertAction(title: buttonMessage, style: .cancel)
        alert.addAction(okbtn)
        self.present(alert, animated: true)
    }
    
}

