//
//  ViewController.swift
//  RehberAppLocalData
//
//  Created by Sinan Kulen on 25.01.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var tvList: UITableView!
    
    var kisi = [Kisiler]()
    var telefon = [Telefon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tvList.register(UINib(nibName: "TVC_Kisiler", bundle: nil), forCellReuseIdentifier: "TVC_Kisiler")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        kisi = DAL.tumKisileriGetir() ?? []
        tvList.reloadData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TVC_Kisiler", owner: self, options: nil)?.first as! TVC_Kisiler
        cell.lblAd.text = kisi[indexPath.row].ad
        cell.lblSoyad.text = kisi[indexPath.row].soyad
        cell.ivResim.image = UIImage(named: "kisi")
     /* if kisi[indexPath.row].resim != nil {
            if let data = kisi[indexPath.row].resim {
                cell.ivResim.image = UIImage(data: data)
            }
        } else {
            cell.ivResim.image = UIImage(systemName: "person")
        } */
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sgGuncelle", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgGuncelle"
        {
            let vc = segue.destination as! VC_Detay
            vc.guncellenecekKisi = kisi[sender as! Int]
            vc.guncellenecekTel = telefon
        }
    }
    


}

