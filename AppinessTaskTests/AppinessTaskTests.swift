//
//  AppinessTaskTests.swift
//  AppinessTaskTests
//
//  Created by HarshaVardhan on 05/10/20.
//  Copyright © 2020 HarshaVardhan. All rights reserved.
//

import XCTest
@testable import AppinessTask

class AppinessTaskTests: XCTestCase {
    
    var viewModel: DetailsViewModel?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Values", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        
        let decoder = JSONDecoder()
        guard let launch = try? decoder.decode(DetailsModel.self, from: data) else {
            return
        }
        self.viewModel = DetailsViewModel.init(detailsData: launch)
        XCTAssertEqual(self.viewModel?.detailsModel.details?.count, 19)
        let detailsValues = self.viewModel?.detailsModel.details?[0]
        XCTAssertEqual(detailsValues?.name, "Sladdar")
        XCTAssertEqual(detailsValues?.dob, "1992/01/20")




    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
