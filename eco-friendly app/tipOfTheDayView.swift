//
//  tipOfTheDayView.swift
//  eco-friendly app
//
//  Created by Ian Loo on 21/11/23.
//

import SwiftUI




struct tipOfTheDayView: View {
    var body: some View {
        let tipsList = [
            // energy
            "Tip 1: Always be kind and compassionate.",
            "Tip 2: Never give up on your dreams.",
            "Tip 3: Embrace challenges as opportunities for growth.",
            "Tip 4: Unplug Devices: Unplug chargers and electronics when not in use.",
            "Tip 5: Use Energy Star Appliances: Choose appliances with the Energy Star label.",
            "Tip 6: Remember to turn off lights when leaving a room.",
            "Tip 7: Seal windows and doors to prevent drafts.",
            "Tip 8: Use a Programmable Thermostat: Set a schedule for heating and cooling.",
            "Tip 9: Ensure your home is well-insulated.",
            "Tip 10: Air Dry Clothes: Instead of using a dryer, air dry your clothes.",
            "Tip 11: Limit Hot Water Usage: Take shorter showers and use cold water when possible.",
            "Tip 12: Install Solar Panels: If feasible, consider solar panels for your home.",
            "Tip 13: Plant Shade Trees: Plant trees to provide shade and reduce cooling needs.",
            "Tip 14: Use Energy-Efficient Windows: Upgrade to energy-efficient windows.",
            "Tip 15: Opt for Natural Light: Use natural light during the day.",
            "Tip 16: Optimize Fridge and Freezer: Keep your fridge and freezer full but not overcrowded.",
            "Tip 17: Consider a tankless water heater for energy efficiency.",
            // transportation
            "Tip 18: Use public transportation when possible.",
            "Tip 19: Carpool or share rides with others.",
            "Tip 20: Bike or walk for short trips.",
            "Tip 21: Drive efficiently at a steady pace and maintain your vehicle.",
            "Tip 22: Choose electric or hybrid vehicles if possible.",
            "Tip 23: Telecommute: Work from home when possible.",
            "Tip 24: Plan errands efficiently to reduce driving.",
            "Tip 25: Use carpooling apps for ride-sharing.",
            "Tip 26: Choose fuel-efficient vehicles when buying a new car.",
            "Tip 27: Regularly service and maintain your vehicle.",
            "Tip 28: Consider using an electric bike for commuting.",
            "Tip 29: Advocate for and support public transit initiatives.",
            "Tip 30: Utilize car-sharing services when needed.",
            "Tip 31: Support and adopt green vehicle technologies.",
            "Tip 32: Plan routes to minimize travel time and distance.",
            "Tip 33: Join car-free days initiatives in your community.",
            "Tip 34: Use electric scooters for short distances.",
            "Tip 35: Select energy-efficient tires for your vehicle.",
            "Tip 36: Minimize air travel when alternatives are available.",
            "Tip 37: Consider carbon offset programs for air travel.",
            // waste reduction and recycling
            "Tip 38: Recycle properly following local guidelines.",
            "Tip 39: Compost food scraps and yard waste.",
            "Tip 40: Reduce single-use plastics.",
            "Tip 41: Bring reusable bags for shopping.",
            "Tip 42: Opt for products with minimal packaging.",
            "Tip 43: Repair items instead of discarding them.",
            "Tip 44: Recycle electronic devices responsibly.",
            "Tip 45: Purchase secondhand items when possible.",
            "Tip 46: Use reusable water bottles.",
            "Tip 47: Bring your own containers for takeout.",
            "Tip 48: Opt out of junk mail and catalogs.",
            "Tip 49: Prefer products with eco-friendly packaging.",
            "Tip 50: Recycle household batteries properly.",
            "Tip 51: Bring a reusable cup for coffee.",
            "Tip 52: Donate unwanted items instead of throwing them away.",
            "Tip 53: Use cloth diapers if applicable.",
            "Tip 54: Avoid disposable razors and use a reusable razor instead.",
            "Tip 55: Reduce packaging waste by buying in bulk.",
            "Tip 56: Use reusable containers for food storage.",
            "Tip 57: Donate or recycle old clothing.",
            // water conservation
            "Tip 58: Fix leaks promptly to conserve water.",
            "Tip 59: Install low-flow faucets and showerheads.",
            "Tip 60: Collect rainwater for plants.",
            "Tip 61: Use water-efficient appliances.",
            "Tip 62: Set a schedule for watering lawns.",
            "Tip 63: Air dry dishes instead of using a dishwasher.",
            "Tip 64: Take shorter showers and use cold water when possible.",
            "Tip 65: Install a water-efficient irrigation system.",
            "Tip 66: Choose drought-resistant plants for landscaping.",
            "Tip 67: Wash your car less often.",
            "Tip 68: Run dishwashers and washing machines only when full.",
            "Tip 69: Defrost your refrigerator regularly.",
            // Sustainable Lifestyle Choices
            "Tip 70: Plant trees to contribute to reforestation efforts.",
            "Tip 71: Choose energy providers that use renewable sources.",
            "Tip 72: Limit meat consumption for a lower carbon footprint.",
            "Tip 73: Purchase locally produced goods to reduce transportation emissions.",
            "Tip 74: Reduce paper usage and choose recycled paper products.",
            "Tip 75: Bring reusable utensils for takeout.",
            "Tip 76: Support and participate in local environmental initiatives.",
            "Tip 77: Stay informed about environmental issues and solutions.",
            "Tip 78: Choose sustainably sourced seafood options.",
            "Tip 79: Support and participate in community gardens.",
            "Tip 80: Organize or participate in clothing swap events.",
            "Tip 81: Advocate for and support policies promoting renewable energy.",
            "Tip 82: Choose energy-efficient electronics and gadgets.",
            "Tip 83: Practice mindful consumption and avoid overconsumption.",
            "Tip 84: Switch to cloth napkins instead of disposable ones.",
            "Tip 85: Share information about sustainable practices with friends and family.",
            "Tip 86: Opt for environmentally friendly cleaning products.",
            "Tip 87: Choose to support businesses with eco-friendly practices.",
            "Tip 88: Choose electronic tickets instead of paper whenever possible.",
            "Tip 89: Even reducing meat intake a few times a week can make a difference.",
        ]
    }
}

struct tipOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        tipOfTheDayView()
    }
}
