//
//  ViewController.swift
//  Les Dates
//
//  Created by Tamatini Teahui on 12/24/18.
//  Copyright © 2018 Tamatini Teahui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    //Obtenir un String au format de votre choix
    @IBOutlet weak var dateStringLbl: UILabel!
    
    //Time Interval (un peu de recherche)
    @IBOutlet weak var timeIntervalLbl: UILabel!
    
    //Si aujourd'hui, demain, hier week end
    @IBOutlet weak var calendarLbl: UILabel!
    
    //il y'a + mois, jours, heures
    @IBOutlet weak var ilYaLbl: UILabel!
    
    let format = "EEEE dd MMMM yyyy - HH:mm:ss - zzzz"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }

    @IBAction func dateChoisi(_ sender: UIDatePicker) {
        let date = sender.date
             //dateStringLbl.text = date.toString()
            dateStringLbl.text = date.convertString(format)
            timeIntervalLbl.text = date.timestamp()
            calendarLbl.text = date.quelJour(date: date)
            ilYaLbl.text = date.component()
    }
    
}

extension Date {
    
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier : "fr_FR")
        return formatter.string(from: self)
    }
    
    func convertString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "fr_FR")
            return formatter.string(from: self)
        }
    
    func timestamp() -> String {
        let tempsEcoule = self.timeIntervalSinceNow
        return String(format: "%.2f", tempsEcoule)
    }
    
    func quelJour(date: Date) -> String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Ajourd'hui"
        }
        
        if calendar.isDateInTomorrow(date) {
            return "Demain"
        }
        
        if calendar.isDateInYesterday(date) {
            return "Hier"
        }
        
        if calendar.isDateInWeekend(date) {
            return "c'est le week end"
        }
        
        return ""
    }
        
    func component() -> String {
        let calendar = Calendar.current
        let component = calendar.dateComponents([.month, .day, .hour, .minute], from: self, to: Date())
        let month = component.month ?? 0
        let day = component.day ?? 0
        let hour = component.hour ?? 0
        let minute = component.minute ?? 0
        return "Temps écoulé -> mois: \(month), jour(s): \(day), heure(s): \(hour), minute(s): \(minute)"
        
        }
    }


