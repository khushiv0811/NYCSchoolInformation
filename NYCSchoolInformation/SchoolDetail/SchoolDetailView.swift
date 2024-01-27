//
//  SchoolDetailView.swift
//  NYCSchoolInformation
//
//  Created by Kushboo Patel on 1/27/24.
//

import SwiftUI

struct SchoolDetailView: View {
    @State var school: School
    var body: some View {
        NavigationView {
            VStack {
                Text(school.school_name)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(.bottom, 10)
                Text(school.overview_paragraph ?? "")
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 5)
                    .font(.callout)
                HStack {
                    Text("Phone:")
                        .font(.caption)
                        .fontWeight(.thin)
                    Text(school.phone_number ?? "NA")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Spacer()
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.bottom,5)
                HStack {
                    Text("Email:")
                        .font(.caption)
                        .fontWeight(.thin)
                    Text(school.school_email ?? "NA")
                        .font(.caption)
                    Spacer()
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.bottom, 5)
                HStack {
                    Text("Website:")
                        .font(.caption2)
                        .fontWeight(.thin)
                    Text(school.website ?? "NA")
                        .font(.caption)
                    Spacer()
                    
                }
                .multilineTextAlignment(.leading)
                .padding(.bottom, 5)
                Spacer()
            }
            .padding(15)
            
        }
    }
}

struct SchoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetailView(school: School(school_name: "School",
                                        overview_paragraph: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                        location: "Location",
                                        phone_number: "123-456-7890",
                                        fax_number: "123-456-7891",
                                        school_email: "abc@email.com",
                                        website: "http://www.abc.com"))
    }
}
