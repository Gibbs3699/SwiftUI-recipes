//
//  ContentView.swift
//  ListRecipes
//
//  Created by TheGIZzz on 16/6/2565 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State private var taskName: String = ""
    @State private var tasks: [String] = []
    
    private func deleteTask(indexSet: IndexSet) {
        indexSet.forEach { index in
            tasks.remove(at: index)
        }
    }
    
    private func moveTask(from source: IndexSet, to destination: Int){
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter task name", text: $taskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add Task") {
                        tasks.append(taskName)
                        taskName = ""
                    }
                }
                List {
                    // using ForEach allow to add another function
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }.onDelete(perform: deleteTask)
                    // implement onMove should implement unable to move too
                        .onMove(perform: moveTask)
                }.listStyle(PlainListStyle())
                // unable move
                .toolbar {
                    EditButton()
                }
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
