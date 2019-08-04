//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by alekseykolesnik on 21/06/2019.
//  Copyright © 2019 alekseykolesnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var resultTextField: UILabel!

    @IBAction func findDay() {
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else { return }
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        let weekday = dateFormatter.string(from: date)
        
        //С большой буквы
        let capitalizedDayweek = weekday.capitalized
        
        resultTextField.text = capitalizedDayweek
        
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

