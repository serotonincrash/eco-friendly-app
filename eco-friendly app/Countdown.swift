//
//  Countdown.swift
//  eco-friendly app
//
//  Created by Jonaven Tan on 27/11/23.
//

import SwiftUI
import UserNotifications
import Forever

import SwiftUI
import UserNotifications

struct Countdown {
    var currentDate = Date()
    @AppStorage("daysLeft") var daysLeft: Int = 0
    @AppStorage("transfer") var transfer = 0
    @Forever("countdown") var lastCycleDate: Date = .now
    
    // Uncomment and integrate the predeterminedDate into your struct
    /*
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
    */
    
    private var checkedDate: Int {
        Calendar.current.dateComponents([.day], from: currentDate, to: lastCycleDate).day ?? 0
    }
    
    var daysLeftCalculated: Int {
        max(0, 14 - abs(checkedDate))
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Notification Title"
        content.body = "You have \(daysLeftCalculated) days left! Keep going!"
        content.sound = UNNotificationSound.default
        
        // Adjust the time interval based on your requirements
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "countdownNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            if success {
                UNUserNotificationCenter.current().add(request)
            } else if let error = error {
                print("Error requesting authorization for notifications: \(error.localizedDescription)")
            }
        }
    }
}

