//
//  SchoolListViewModel.swift
//  NYCSchoolInformation
//
//  Created by Kushboo Patel on 1/27/24.
//

import Foundation
import Combine

final class SchoolListViewModel: ObservableObject {
    @Published var schoolList: [School] = []
    private var cancellable: AnyCancellable?
    
    func fetchInitialData()
    {   Networkcall().getSchools()
            .map(\.result)
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .assign(to: &$schoolList)
    }
    func fetchData()  {
        Networkcall().getSchoolList { result,success  in
            if success == true {
                self.schoolList = result
            }
            else {
                self.schoolList = []
            }
        }
    }
    
}
