//
//  MovieQuizTests.swift
//  MovieQuizTests
//
//  Created by Gregory Vanyurin on 19.02.2025.
//

/*
 import XCTest

 struct ArithmeticOperations {
     func addition(num1: Int, num2: Int) -> Int {
         return num1 + num2
     }
     
     func subtraction(num1: Int, num2: Int) -> Int {
         return num1 - num2
     }
     
     func multiplication(num1: Int, num2: Int) -> Int {
         return num1 * num2
     }
 }

 struct ArithmeticOperationsAsync {
     func addition(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
             handler(num1 + num2)
         }
     }
     
     func subtraction(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
             handler(num1 - num2)
         }
     }
     
     func multiplication(num1: Int, num2: Int, handler: @escaping (Int) -> Void) {
         DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
             handler(num1 * num2)
         }
     }
 }

 class MovieQuizTests: XCTestCase {
     
     func testAddition() throws {
 //         let arithmeticOperations = ArithmeticOperations()
 //         let result = arithmeticOperations.addition(num1: 1, num2: 2)
 //         XCTAssertEqual(result, 3) // сравниваем результат выполнения функции и наши ожидания
         
         // Given
         // Given/Дано — это состояние, когда мы получаем начальные данные, с которыми будем работать.
         let arithmeticOperations = ArithmeticOperations()
         let num1 = 1
         let num2 = 2
         
         // When
         // When/Когда — действие, которое мы собираемся тестировать, когда оно уже произошло.
         let result = arithmeticOperations.addition(num1: num1, num2: num2)
         
         // Then
         // When/Тогда — проверка действия, которое произошло.
         XCTAssertEqual(result, 3)
     }
     
     func testAdditionAsync() throws {
         // Given
         let arithmeticOperationsAsync = ArithmeticOperationsAsync()
         let num1 = 1
         let num2 = 2
         
         // When
         let expectation = expectation(description: "Addition function expectation")
        
        arithmeticOperationsAsync.addition(num1: num1, num2: num2) { result in
             // Then
             XCTAssertEqual(result, 3)
             expectation.fulfill()
         }
         
         waitForExpectations(timeout: 2)
     }
 */


//    override func setUpWithError() throws { // перед каждым тестом
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws { // после каждого теста
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() throws { // Это сам тест
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws { //А это нагрузочный тест. В нём можно измерить, сколько времени на выполнение потребует та или иная функция.
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
//}

/*
 XCTAssertNotEqual — сравниваем два результата и ожидаем, что они не равны
 XCTAssertEqual — сравниваем два результата и ожидаем, что они равны
 XCTAssertFalse — проверяем, что результат — это false
 XCTAssertTrue — проверяем, что результат — это true
 XCTAssertGreaterThan — сравниваем два результата и ожидаем, что первый больше второго
 XCTAssertGreaterThanOrEqual — сравниваем два результата и ожидаем, что первый больше или равен второму
 XCTAssertLessThan — сравниваем два результата и ожидаем, что первый меньше второго
 XCTAssertLessThanOrEqual — сравниваем два результата и ожидаем, что первый меньше или равен второму
 XCTAssertNil — проверяем что результат — это nil
 XCTAssertNotNil — проверяем что результат — это не nil
 XCTAssertNoThrow — проверяем, что в процессе получения результата не произошло ошибки
 XCTAssertThrowsError — проверяем, что в процессе получения результата произошла ошибка
*/

