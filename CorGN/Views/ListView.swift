//
//  ListView.swift
//  CorGN
//
//  Created by Luciano Nicolini on 22/01/2024.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(ModelList) { newsItem in
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text(newsItem.name)
                            .font(.headline)
                        
                        Text(newsItem.caption)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Noticias")
            .listStyle(.plain)
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
