//
//  ContentView.swift
//  NYCSchoolInformation
//
//  Created by Kushboo Patel on 1/27/24.
//

import SwiftUI

struct SchoolListView: View {
    @StateObject var viewModel = SchoolListViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.schoolList, id: \.self) { school in
                    NavigationLink(destination: SchoolDetailView(school: school)) {
                        VStack(alignment: .leading) {
                            Text(school.school_name)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(school.location ?? "")
                                .foregroundColor(.gray)
                            Text(school.phone_number ?? "")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 10)
                    }
                }
            }
            .navigationTitle("Schools in NY")
            .onAppear {
                viewModel.fetchData()
                let _ = print(viewModel.schoolList.description)
            }
        }
        
    }
    
}

struct SchoolListView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView()
    }
}
