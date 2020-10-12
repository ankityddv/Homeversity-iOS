//
//  WidgetModule.swift
//  WidgetModule
//
//  Created by Ankit on 21/09/20.
//  Give me suggestion on twitter @ankityddv (www.twitter.com/ankityddv)


import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    
    // Placeholder String
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), myString: "BANG ON")
    }

    // Placeholder String
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), myString: "BANG ON")
        completion(entry)
    }

    //main logic
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset * 10, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, myString: MyDataProvider.getRandomString())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let myString: String
    //let configuration: ConfigurationIntent
}

//widget look
struct TestWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            //Color.dynamicColor.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blueOne, .blueTwo]), startPoint: .topLeading, endPoint: .bottomTrailing)
            //Text(entry.myString)
              //  .font(.title)
                //.foregroundColor(Color.white)
               // .fontWeight(.semibold)
                //.offset(x: 30, y: 10)
                //.multilineTextAlignment(.center)
            Image("abusing")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60, alignment: .center)
                .border(Color.white, width: 2.0)
                .cornerRadius(10)
                .clipped()
        }
    }
}

@main
struct TestWidget: Widget {
    let kind: String = "TestWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            TestWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Message")
        .description("Get some Daily Motivation.")
    }
}

// Preview
struct TestWidget_Previews: PreviewProvider {
    static var previews: some View {
        TestWidgetEntryView(entry: SimpleEntry(date: Date(), myString: "LMAO NIGGA"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}




extension Color {
    static let blueOne = Color(UIColor(red: 0.00, green: 0.78, blue: 1.00, alpha: 1.00))
    static let blueTwo = Color(UIColor(red: 0.00, green: 0.45, blue: 1.00, alpha: 1.00))
}
