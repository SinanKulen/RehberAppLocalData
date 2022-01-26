//
//  VC_Detay.swift
//  RehberAppLocalData
//
//  Created by Sinan Kulen on 25.01.2022.
//

import UIKit

class VC_Detay: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tvTelList: UITableView!
    @IBOutlet var tfTel: UITextField!
    @IBOutlet var tfSoyad: UITextField!
    @IBOutlet var tfAd: UITextField!
    @IBOutlet var ivResim: UIImageView!
    @IBOutlet var btnTelKaydet: UIButton!
    
    var guncellenecekKisi : Kisiler?
    var guncellenecekTel : [Telefon]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if guncellenecekKisi != nil
            {
            
            //idGöreTelgEtir
            tfTel.isEnabled = false
            btnTelKaydet.isEnabled = false
            tfAd.text = guncellenecekKisi?.ad
            tfSoyad.text = guncellenecekKisi?.soyad
            if guncellenecekKisi?.resim != nil {
                if let data = guncellenecekKisi?.resim {
                    self.ivResim.image = UIImage(data: data)
                }
            } else {
                ivResim.image = UIImage(systemName: "person")
            }
           
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  3//guncellenecekTel?.count > 0 ? guncellenecekTel!.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      //  cell.textLabel?.text = DAL.idGoreTelefonGetir(kisiid: (guncellenecekKisi?.id)!)?.telefon
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }

    @IBAction func btnTelKaydet_TUI(_ sender: Any) {
      
//        if  guncellenecekTel.kisiId == guncellenecekKisi?.id
//        {
//            DAL.idGoreTelefonGuncelle(kisiid: guncellenecekKisi?.id)
//        } else {
//            alertFunc(message: "Kişi ile telefon id uyumlu değil.")
//        }
        
    }
    
    @IBAction func btnKisiKaydet_TUI(_ sender: Any)
    {
        if guncellenecekKisi != nil
        {
            guncellenecekKisi?.ad = tfAd.text
            guncellenecekKisi?.soyad = tfSoyad.text
            DAL.kisiGuncelle()
        } else {
            DAL.kisiEkle(ad: tfAd.text!, soyad: tfSoyad.text!, resim: UIImage(named: "kisi")!)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnKisiSil_TUI(_ sender: Any) {
        silAlert()
    }
    
    func alertFunc(message: String)
    {
        let ac = UIAlertController(title: "Hata", message: "Uyari metni", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        ac.addAction(UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.default, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    func silAlert()
    {
        let ac = UIAlertController(title: "Kişiyi silmek istediğinizden emin misiniz ?", message: "Kişi siliniyor.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.default, handler: nil))
        ac.addAction(UIAlertAction(title: "Sil", style: UIAlertAction.Style.default, handler: { action in
            if self.guncellenecekKisi != nil
            {
                DAL.sil(kisi: self.guncellenecekKisi!)
            }
            self.navigationController?.popViewController(animated: true)
        }))
        present(ac, animated: true, completion: nil)
    }
}
