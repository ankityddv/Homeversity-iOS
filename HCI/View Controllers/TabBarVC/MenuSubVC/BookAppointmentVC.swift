//
//  BookAppointmentVC.swift
//  HCI
//
//  Created by Ankit on 03/10/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)

import UIKit
import FSCalendar

class BookAppointmentVC: UIViewController,FSCalendarDelegate {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBAction func continueTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.layer.cornerRadius = 30
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formattor = DateFormatter()
        formattor.dateFormat = "EEEE MM-dd-YYYY at h:mm a"
        let string = formattor.string(from: date)
        print("\(string)")
    }
}
