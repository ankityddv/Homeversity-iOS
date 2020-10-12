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
}

//widget look
struct TestWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        
        ZStack {
                Image("widgetView")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            }
        
        /*
        VStack(alignment: .leading) {
                    HStack{
                        Image("amaya")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.red)
                        Text("Lol")
                            .font(.headline)
                    }
                    Text("Bruh").font(.title)
                        .layoutPriority(1)
                    Text("Damn").font(.body)
                    Spacer()
                }
                .padding(5)
        */
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
    static var bgcolor = Color(UIColor(named: "WidgetBackground")!)
}
