//
//  ContentView.swift
//  AngularShadowClock
//
//  Created by Shreyas Vilaschandra Bhike on 18/10/23.
//
//  MARK: Instagram
//  TheAppWizard
//  MARK: theappwizard2408




import SwiftUI

struct ContentView: View {
    var body: some View {
        AngularShadowClock()
    }
}

#Preview {
    ContentView()
}














struct AngularClk: View {
    @State private var rotation: Double = 0.0 // State variable to control rotation

    var body: some View {
        ZStack {
            // Background circle with angular gradient
            Circle()
                .fill(AngularGradient(
                    gradient: Gradient(colors: [.black, .gray, .white]),
                    center: .center,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360)
                ))
                .frame(width: 1000, height: 1000)
                .rotationEffect(.degrees(rotation)) // Rotate the circle

                // Trigger rotation animation when the view appears
                .onAppear() {
                    withAnimation(
                        Animation.linear(duration: 3).repeatForever(autoreverses: false)
                    ) {
                        rotation = 360 // Animate the rotation to create a spinning effect
                    }
                }
        }.clipShape(Circle()) // Clip the view to a circular shape
    }
}









struct AngularShadowClock: View {
    var body: some View {
        ZStack{
            AngularClk()
            NameArea()
        }
    }
}
struct NameArea: View {
    var body: some View {
        ZStack{
            Text("DAY")
                       .font(.system(size: 50, weight: .regular, design: .default))
                       .offset(y: -300)
            Text("NIGHT")
                .font(.system(size: 50, weight: .regular, design: .default))
                .foregroundColor(.white)
                .offset(y: 300)
        }
    }
}








