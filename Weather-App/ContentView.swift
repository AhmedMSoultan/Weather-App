//
//  ContentView.swift
//  Weather-App
//
//  Created by Ahmed Soultan on 18/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var dayMode = true
    
    var body: some View {
        ZStack {
            BackgroundView(dayMode: $dayMode)
            
            VStack{
                CityNameView(cityName: "Cairo, EG")
                
                TodayWeatherView(imageName: dayMode ? "cloud.sun.fill" : "cloud.moon.fill",
                                 temperature: dayMode ? 76 : 60)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: dayMode ? "cloud.sun.fill" : "cloud.moon.fill",
                                   temperature: dayMode ? 73 : 60)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: dayMode ? "sun.max.fill" : "moon.stars.fill",
                                   temperature: dayMode ? 80 : 67)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: dayMode ? "wind" : "wind.snow",
                                   temperature: dayMode ? 66 : 54)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: dayMode ? "cloud.sun.rain.fill" : "cloud.moon.rain.fill",
                                   temperature: dayMode ? 57 : 40)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: dayMode ? "cloud.snow.fill" : "snowflake",
                                   temperature: dayMode ? 25 : 15)
                    
                }
                
                Spacer()
                
                Button {
                    dayMode.toggle()
                } label: {
                    WeatherButton(title: "Change day time",
                                  textColor: .blue, backgroundColor: .white)
                    .padding(.bottom , 30)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 20 , weight: .medium , design: .rounded))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 , height: 40)
            Text("\(temperature)°")
                .font(.system(size: 20 ,weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var dayMode: Bool
    
    var body: some View {
        LinearGradient(colors: [dayMode ? .blue : .black,
                                dayMode ? Color("lightBlue") : .gray],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32 , weight: .medium , design: .rounded))
            .foregroundColor(.white)
            .padding()
    }
}

struct TodayWeatherView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 180 , height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70 ,weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.bottom , 50)
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20 , weight: .bold , design: .rounded))
            .frame(width: 280 , height: 50 , alignment: .center)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
