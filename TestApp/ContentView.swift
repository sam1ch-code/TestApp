//
//  ContentView.swift
//  TestApp
//
//  Created by Sam on 27/09/2026.
//

import SwiftUI

struct ContentView: View {
    let items: [String] = (0..<1000).map { index in
        index.isMultiple(of: 2)
            ? String(index)
            : "invalid-\(index)"
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
//                ForEach(0..<10_000, id: \.self) { id in
//                    RowView(id: id)
//                }
            }
        }
//        List(0..<10_000, id: \.self) { id in
//            RowView(id: id)
//        }
    }
    
    private var notSoGoodImplementation: some View {
        // MARK: Keeps longer in memory
        ForEach(items, id: \.self) { item in
            if !item.isEmpty, let id = Int(item) {
                RowView(id: Int(id))
            }
        }
    }
    
    private var filteredImplementation: some View {
        ForEach(items.compactMap{ Int($0) }, id: \.self) { item in
            RowView(id: Int(item))
        }
    }
}

struct RowView: View {
    let id: Int
    @State private var tracker: RowLifetimeTracker
    
    init(id: Int) {
        self.id = id
        _tracker = State(initialValue: RowLifetimeTracker(id: id))
    }
    
    var body: some View {
        Text("Row: \(id)")
            .frame(height: 100)
            .onAppear {
                print("On Appear: \(id)")
            }
            .onDisappear {
                print("OnDisappear: \(id)")
            }
    }
}

#Preview {
    ContentView()
}
