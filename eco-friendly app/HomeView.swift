import SwiftUI

struct HomeView: View {
    
    @AppStorage("bobuc") var bobuc = 0
    @AppStorage("challengesCompleted") var challengesCompleted = 0
    @AppStorage("lastCO2e") var lastCO2e = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Tip Of The Day: Use public transport.")
                .font(.title3)
                .bold()
                .foregroundColor(.blue)
                .padding(15)
                .background(Color.yellow)
                .cornerRadius(10)
                .underline()
                .padding(.top, 80)
            
            Spacer()

            Image(systemName: "leaf.fill")
                .font(.system(size: 350)) // Adjust the size as needed
                .foregroundColor(.green)
                .padding(.bottom, 50)
                .offset(y: 10)
            
            Text("Calculate your latest carbon emissions!")
                .font(.title2)
            
            Text("Last result: \(lastCO2e) kg CO2e")
                .font(.title2)
                .padding(5)
            
            Text("Number of challenges completed: \(challengesCompleted)/8")
                .font(.title2)
                .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.gray]),
                startPoint: .topLeading,
                endPoint: .bottom
            )
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
