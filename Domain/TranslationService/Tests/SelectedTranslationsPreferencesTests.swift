//
//  SelectedTranslationsPreferencesTests.swift
//
//
//  Created by Mohamed Afifi on 2023-05-21.
//

import XCTest
@testable import TranslationService

class SelectedTranslationsPreferencesTests: XCTestCase {
    // MARK: Internal

    override func tearDown() {
        super.tearDown()
        preferences.reset()
    }

    func testPreferences() {
        XCTAssertEqual(preferences.selectedTranslationIds, [])

        preferences.toggleSelection(45)
        preferences.toggleSelection(10)
        preferences.toggleSelection(20)
        XCTAssertEqual(preferences.selectedTranslationIds, [45, 10, 20])
        XCTAssertTrue(preferences.isSelected(10))

        preferences.toggleSelection(10)
        XCTAssertEqual(preferences.selectedTranslationIds, [45, 20])
        XCTAssertFalse(preferences.isSelected(10))
    }

    // MARK: Private

    private let preferences = SelectedTranslationsPreferences.shared
}
