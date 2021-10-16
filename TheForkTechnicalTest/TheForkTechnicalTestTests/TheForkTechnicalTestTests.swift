//
//  TheForkTechnicalTestTests.swift
//  TheForkTechnicalTestTests
//
//  Created by Alban on 12/10/2021.
//

import XCTest
@testable import TheForkTechnicalTest

class TheForkTechnicalTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRetriveDataFromMockedService() {
        RestaurantServiceMock().retriveListRestaurant { result in
            switch result {
            case .success:
                XCTAssert(true)
            case .failure:
                XCTFail()
            }
        }
    }
    
    func testTransformDataServiceToDTO() {
        var restaurantDTOArray: [RestaurantDTO] = []
        RestaurantServiceMock().retriveListRestaurant { result in
            switch result {
            case .success(let response):
                for restaurant in response.data {
                    restaurantDTOArray.append(RestaurantDTO(restaurant: restaurant))
                }
                XCTAssertTrue(restaurantDTOArray.count == response.data.count)
            case .failure:
                XCTFail()
            }
        }
    }
    
    func testDTOMappingData() {
        RestaurantServiceMock().retriveListRestaurant { result in
            switch result {
            case .success(let response):
                for restaurant in response.data {
                    let dtoToTest = RestaurantDTO(restaurant: restaurant)
                    
                    XCTAssertEqual(dtoToTest.address, "\(restaurant.address.street)\n\(restaurant.address.postalCode) \(restaurant.address.locality) \(restaurant.address.country)")
                    XCTAssertEqual(dtoToTest.theForkRating, restaurant.aggregateRatings.thefork.ratingValue)
                    XCTAssertEqual(dtoToTest.theForkReviewNumbers, restaurant.aggregateRatings.thefork.reviewCount)
                    XCTAssertEqual(dtoToTest.tripadvisorRating, restaurant.aggregateRatings.tripadvisor.ratingValue)
                    XCTAssertEqual(dtoToTest.tripadvisorReviewNumbers, restaurant.aggregateRatings.tripadvisor.reviewCount)
                    XCTAssertEqual(dtoToTest.name, restaurant.name)
                    
                }
            case .failure:
                XCTFail()
            }
        }
    }
    
    func testRestaurantVMRetrieveRestaurant() {
        let vm = RestaurantsViewModel(restaurantListService: RestaurantServiceMock())
        vm.delegate = self
        vm.retrieveRestaurant()
    }
    
    func testRestaurantVMSortByName() {
        let vm = RestaurantsViewModel(restaurantListService: RestaurantServiceMock())
        vm.delegate = self
        vm.retrieveRestaurant()
        vm.sortRestaurantByName()
    }
    
    func testRestaurantVMSortByRatings() {
        let vm = RestaurantsViewModel(restaurantListService: RestaurantServiceMock())
        vm.delegate = self
        vm.retrieveRestaurant()
        vm.sortRestaurantByRank()
    }
}

extension TheForkTechnicalTestTests: RestaurantServiceDelegate {
    func retrieveRestaurantDidSuccess(restaurants: [RestaurantDTO]) {
        XCTAssert(true)
    }
    
    func retrieveRestaurantDidFailed(error: Error) {
        XCTFail()
    }
}
