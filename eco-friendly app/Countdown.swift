//
//  Countdown.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 27/11/23.
//

import SwiftUI
import UserNotifications


struct Countdown {

    @State private var currentDate = Date()
    @AppStorage("daysLeft") var daysLeft: Int = 0
    @AppStorage("daysleftchecked") var totaldaysleft: Int = 0
    
    // Set your predetermined date here
    let predeterminedDate: Date = {
        var components = DateComponents()
        components.year = 2023
        components.month = 11
        components.day = 26
        components.hour = 0
        components.minute = 0
        components.second = 0
        return Calendar.current.date(from: components)!
    }()
    
    private var checkedDate: Int {
        Calendar.current.dateComponents([.day], from: currentDate, to: predeterminedDate).day ?? 0
    }
    
    private var daysLeftCalculated: Int {
         max(0, 14 - abs(checkedDate))
    }
    init() {
            totaldaysleft = daysLeftCalculated
        }
  
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.body = "You have 7 days left! Keep going!"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "sevenDaysLeftNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            if success {
                UNUserNotificationCenter.current().add(request)
            } else if let error = error {
                print("Error requesting authorization for notifications: \(error.localizedDescription)")
            }
        }
    }
}



