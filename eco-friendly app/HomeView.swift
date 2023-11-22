import SwiftUI

struct HomeView: View {

    @AppStorage("bobuc") var bobuc = 0
    @AppStorage("challengesCompleted") var challengesCompleted = 0
    @AppStorage("lastCO2e") var lastCO2e = 0
    
    let dailyTips = [
        "Use public transport.",
        "Reduce water usage by fixing leaks.",
        "Switch to energy-efficient light bulbs.",
        "Plant a tree and nurture green spaces.",
        "Choose local and seasonal produce for meals.",
        "Always be kind and compassionate.",
        "Never give up on your dreams.",
        " Embrace challenges as opportunities for growth.",
        "Unplug Devices: Unplug chargers and electronics when not in use.",
        "Use Energy Star Appliances: Choose appliances with the Energy Star label.",
        "Remember to turn off lights when leaving a room.",
        "Seal windows and doors to prevent drafts.",
        "Use a Programmable Thermostat: Set a schedule for heating and cooling.",
        "Ensure your home is well-insulated.",
        "Air Dry Clothes: Instead of using a dryer, air dry your clothes.",
        "Limit Hot Water Usage: Take shorter showers and use cold water when possible.",
        "Install Solar Panels: If feasible, consider solar panels for your home.",
        "Plant Shade Trees: Plant trees to provide shade and reduce cooling needs.",
        "Use Energy-Efficient Windows: Upgrade to energy-efficient windows.",
        "Opt for Natural Light: Use natural light during the day.",
        "Optimize Fridge and Freezer: Keep your fridge and freezer full but not overcrowded.",
        "Consider a tankless water heater for energy efficiency.",
        "Use public transportation when possible.",
        "Carpool or share rides with others.",
        "Bike or walk for short trips.",
        "Drive efficiently at a steady pace and maintain your vehicle.",
        "Choose electric or hybrid vehicles if possible.",
        "Telecommute: Work from home when possible.",
        "Plan errands efficiently to reduce driving.",
        "Use carpooling apps for ride-sharing.",
        "Choose fuel-efficient vehicles when buying a new car.",
        "Regularly service and maintain your vehicle.",
        "Consider using an electric bike for commuting.",
        "Advocate for and support public transit initiatives.",
        "Utilize car-sharing services when needed.",
        " Support and adopt green vehicle technologies.",
        "Plan routes to minimize travel time and distance.",
        "Join car-free days initiatives in your community.",
        "Use electric scooters for short distances.",
        "Select energy-efficient tires for your vehicle.",
        "Minimize air travel when alternatives are available.",
        "Consider carbon offset programs for air travel.",
        "Recycle properly following local guidelines.",
        "Compost food scraps and yard waste.",
        "Reduce single-use plastics.",
        "Bring reusable bags for shopping.",
        "Opt for products with minimal packaging.",
        "Repair items instead of discarding them.",
        "Recycle electronic devices responsibly.",
        "Purchase secondhand items when possible.",
        "Use reusable water bottles.",
        "Bring your own containers for takeout.",
        "Opt out of junk mail and catalogs.",
        "Prefer products with eco-friendly packaging.",
        "Recycle household batteries properly.",
        "Bring a reusable cup for coffee.",
        "Donate unwanted items instead of throwing them away.",
        "Use cloth diapers if applicable.",
        "Avoid disposable razors and use a reusable razor instead.",
        "Reduce packaging waste by buying in bulk.",
        "Use reusable containers for food storage.",
        "Donate or recycle old clothing.",
        "Fix leaks promptly to conserve water.",
        "Install low-flow faucets and showerheads.",
        "Collect rainwater for plants.",
        "Use water-efficient appliances.",
        "Set a schedule for watering lawns.",
        "Air dry dishes instead of using a dishwasher.",
        "Take shorter showers and use cold water when possible.",
        "Install a water-efficient irrigation system.",
        "Choose drought-resistant plants for landscaping.",
        "Wash your car less often.",
        "Run dishwashers and washing machines only when full.",
        "Defrost your refrigerator regularly.",
        "Plant trees to contribute to reforestation efforts.",
        "Choose energy providers that use renewable sources.",
        "Limit meat consumption for a lower carbon footprint.",
        "Purchase locally produced goods to reduce transportation emissions.",
        "Reduce paper usage and choose recycled paper products.",
        "Bring reusable utensils for takeout.",
        "Support and participate in local environmental initiatives.",
        "Stay informed about environmental issues and solutions.",
        "Choose sustainably sourced seafood options.",
        "Support and participate in community gardens.",
        "Organize or participate in clothing swap events.",
        "Advocate for and support policies promoting renewable energy.",
        "Choose energy-efficient electronics and gadgets.",
        "Practice mindful consumption and avoid overconsumption.",
        "Switch to cloth napkins instead of disposable ones.",
        "Share information about sustainable practices with friends and family.",
        "Opt for environmentally friendly cleaning products.",
        "Choose to support businesses with eco-friendly practices.",
        "Choose electronic tickets instead of paper whenever possible.",
        "Even reducing meat intake a few times a week can make a difference.",
        "Pack a reusable lunch instead of buying disposable food containers.",
        "Print documents double-sided to save paper.",
        "Cook in bulk and freeze leftovers to avoid food waste.",
        "Use a refillable water bottle and carry it with you throughout the day.",
        "Switch to energy-efficient lightbulbs.",
        "Unplug idle electronics.",
        "Wash clothes in cold water.",
        "Hang clothes to dry instead of using a dryer.",
        "Plant trees or support organizations that plant trees.",
        "Educate yourself about environmental issues and share your knowledge with others.",
        "Make small changes to your everyday routine, and encourage others to do the same. "
    ]
    
    var dailyTip: String {
        let index = Calendar.current.ordinality(of: .day, in: .era, for: Date()) ?? 0
        return dailyTips[index % dailyTips.count]
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Tip Of The Day: \(dailyTip)")
                .font(.title3)
                .bold()
                .foregroundColor(.blue)
                .padding(15)
                .background(Color.yellow)
                .cornerRadius(10)
                .underline()
                .padding(.top, 80)
            
            Spacer()

            Image(systemName: "tree.fill")
                .font(.system(size: 250)) // Adjust the size as needed
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
