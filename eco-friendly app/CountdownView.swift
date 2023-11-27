import SwiftUI
import AVFoundation
import UserNotifications


struct CountdownView: View {
    @State private var currentDate = Date()
    @AppStorage("daysLeft") var daysLeft: Int = 0
    @State var audioPlayer: AVAudioPlayer?

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

    var body: some View {
        VStack {
            Image("youcandoit2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            
            Text("Days Left: \(daysLeftCalculated)")
                .padding()
                .background(.yellow)
            
            Image("Youcandoit1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
            
            
            if daysLeftCalculated <= 3{
                Image("sadhamster")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
            } else{
                Image("hamster")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
            }
        }
        .onAppear {
            playSound()
            updateDaysLeft()
            
            if daysLeft <= 7 {
                            scheduleNotification()
                        }
        }
    }

    func playSound() {
        guard let soundURL = Bundle.main.url(forResource: "youcandoit3", withExtension: "mp3") else {
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    func updateDaysLeft() {
        daysLeft = daysLeftCalculated
    }
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


struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}

