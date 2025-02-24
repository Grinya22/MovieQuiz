//
//  MovieQuizUITests.swift
//  MovieQuizUITests
//
//  Created by Gregory Vanyurin on 19.02.2025.
//

/*
 import XCTest

 class MovieQuizUITests: XCTestCase {
     
     var app: XCUIApplication!

     override func setUpWithError() throws {
         try super.setUpWithError()
         
         app = XCUIApplication()
         app.launch()
         
         // это специальная настройка для тестов: если один тест не прошёл,
         // то следующие тесты запускаться не будут; и правда, зачем ждать?
         continueAfterFailure = false

     }

     override func tearDownWithError() throws {
         try super.tearDownWithError()
         
         app.terminate()
         app = nil
     }
     
     func testYesButton() {
         sleep(3)
         let firstPoster = app.images["Poster"] // находим первоначальный постер
         let firstPosterData = firstPoster.screenshot().pngRepresentation
         
         app.buttons["Yes"].tap() // || app.buttons["No"].tap() // находим кнопку `Да` и нажимаем её
         
         sleep(3)
         let secondPoster = app.images["Poster"] // ещё раз находим постер
         let seconfPosterData = secondPoster.screenshot().pngRepresentation
         
         XCTAssertNotEqual(firstPosterData, seconfPosterData) // проверяем, что постеры разные
         
         let indexLabel = app.staticTexts["Index"]
         
         XCTAssertEqual(indexLabel.label, "2/10")
     }
     
     func testNoButton() {
         sleep(3)
         
         let firstPoster = app.images["Poster"]
         let firstPosterData = firstPoster.screenshot().pngRepresentation
         
         app.buttons["No"].tap()
         
         sleep(3)
         
         let secondPoster = app.images["Poster"]
         let secondPosterData = secondPoster.screenshot().pngRepresentation
         
         XCTAssertNotEqual(firstPosterData, secondPosterData)
         
         let indexLabel = app.staticTexts["Index"]
         
         XCTAssertEqual(indexLabel.label, "2/10")
     }
     
     func testGameFinish() {
         sleep(3)
         
         for _ in 1...10 {
             app.buttons["Yes"].tap()
             sleep(3)
         }
     
         let alert = app.alerts["Game results"]
         
         XCTAssertTrue(alert.exists)
         XCTAssertEqual(alert.label, "Этот раунд окончен!")
         XCTAssertEqual(alert.buttons.firstMatch.label, "Сыграть еще раз")
         
     }

     func alertDismiss() {
         sleep(3)
         
         for _ in 1...10 {
             app.buttons["Yes"].tap()
             sleep(3)
         }
         
         let alert = app.alerts["Game results"]
         alert.buttons.firstMatch.tap()
         
         sleep(3)
         
         let indexLabel = app.staticTexts["Index"]
         
         XCTAssertFalse(alert.exists)
         XCTAssertEqual(indexLabel.label, "1/10")
     }
 }
 //    func testLaunchPerformance() throws { // Отслеживает быстродействие вашего приложения
 //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
 //            // This measures how long it takes to launch your application.
 //            measure(metrics: [XCTApplicationLaunchMetric()]) {
 //                XCUIApplication().launch()
 //            }
 //        }
 //    }


 //Класс XCUIApplication позволяет:
 //запускать и останавливать работу приложения,
 //отслеживать и менять статус приложения при прогоне тестов,
 //запускать другое приложение на устройстве (если вы знаете его bundleIdentifier),
 //управлять авторизацией в приложении для сброса установленного доступа к содержимому и функциям устройства (например, контактов или камеры).

*/
