//
//  KonfioAppTests.swift
//  KonfioAppTests
//
//  Created by Cristian Hernandez Garcia on 30/10/23.
//

import XCTest
import CoreData
@testable import KonfioApp

class DogManagerTests: XCTestCase {

    var dogManager: DogManager!

    override func setUp() {
        super.setUp()
        dogManager = DogManager()
        clearCoreData()
    }

    override func tearDown() {
        clearCoreData()
        super.tearDown()
    }

    func testSaveAndGetDogs() {
        let dogs: [Dog] = [
            Dog(dogName: "Buddy", description: "Friendly dog", age: 3, image: "buddy.png"),
            Dog(dogName: "Max", description: "Energetic dog", age: 2, image: "max.png")
        ]

        dogManager.saveDogsFromService(dogs: dogs)
        let dogsFromCoreData = dogManager.getDogsFromCoreData()

        XCTAssertEqual(dogs.count, dogsFromCoreData.count)
    }

    func testHasDataInCoreData() {
        XCTAssertFalse(dogManager.hasDataInCoreData())

        let dogs: [Dog] = [
            Dog(dogName: "Buddy", description: "Friendly dog", age: 3, image: "buddy.png")
        ]

        dogManager.saveDogsFromService(dogs: dogs)
        XCTAssertTrue(dogManager.hasDataInCoreData())
    }

    func clearCoreData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = DogEntity.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try dogManager.context.execute(batchDeleteRequest)
        } catch {
            print("Error al borrar datos de Core Data: \(error.localizedDescription)")
        }
    }
}
