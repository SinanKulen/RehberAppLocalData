//
//  DAL.swift
//  RehberAppLocalData
//
//  Created by Sinan Kulen on 25.01.2022.
//

import Foundation
import CoreData
import UIKit

class DAL
{

    static func getContext()-> NSManagedObjectContext
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    static func kisiEkle(ad: String, soyad: String, resim: UIImage)
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Kisiler", in: context)
        let kisi = NSManagedObject(entity: entity!, insertInto: context)
        kisi.setValue(ad, forKey: "ad")
        kisi.setValue(soyad, forKey: "soyad")
        let data = resim.pngData()
        kisi.setValue(data, forKey: "resim")
        
        do {
            try context.save()
        } catch {
            
        }
    }
    
    static func telEkle(kisiId: UUID, telefon: String)
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Kisiler", in: context)
        let telefon = NSManagedObject(entity: entity!, insertInto: context)
        telefon.setValue(telefon, forKey: "telefon")
        telefon.setValue(kisiId, forKey: "kisiId")
    }
    
    static func tumKisileriGetir() -> [Kisiler]?
    {
        let fetchRequest : NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        
        do {
           return try getContext().fetch(fetchRequest)
        } catch {
        }
        return nil
    }
    
    static func kisiGuncelle()
    {
        try? getContext().save()
    }
    
    static func sil(kisi: Kisiler)
    {
        getContext().delete(kisi)
        try? getContext().save()
    }

    static func idGoreKisileriGetir(id : UUID) -> Kisiler?
    {
        let fetchRequest : NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let kisiler = try getContext().fetch(fetchRequest)
            if kisiler.count > 0
            {
                return kisiler[0]
            }
        }
        catch {
        }
        return nil
    }
    
    static func idGoreTelefonGetir(kisiid: UUID) -> Telefon?
    {
        let fetchRequest : NSFetchRequest<Telefon> = Telefon.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", kisiid as CVarArg)
        
        do {
            let telefon = try getContext().fetch(fetchRequest)
            if telefon.count > 0
            {
                return telefon[0]
            }
        }  catch {
        }
        return nil
    }
}
