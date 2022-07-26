//
//  ViewControllerTests.swift
//  AlertTests
//
//  Created by 山本響 on 2022/07/24.
//

@testable import Alert
import XCTest
import ViewControllerPresentationSpy

class ViewControllerTests: XCTestCase {

    private var sut: ViewController!
    private var alertVerifier: AlertVerifier!
    
    override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        alertVerifier = nil
        sut = nil
        super.tearDown()
    }
    
    func test_tappingButtton_shouldShowAlert() {
        tap(sut.button)
        alertVerifier.verify(
            title: "Do the Thing?",
            message: "Let us know if you want to do the thing.",
            animated: true,
            actions: [
                .cancel("Cancel"),
                .default("OK")
            ],
            presentingViewController: sut
        )
        
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK", "preferred action")
    }
    
    func test_executeAlertAction_withOKButton() throws {
        tap(sut.button)
        
        try alertVerifier.executeAction(forButton: "OK")
    }

}
