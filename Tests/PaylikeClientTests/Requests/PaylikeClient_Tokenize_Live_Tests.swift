import XCTest

@testable import PaylikeClient

final class PaylikeClient_Tokenize_Live_Tests: XCTestCase {
    
    static var paylikeClient = PaylikeClient()
    
    public class override func setUp() {
        /**
         * Initializing client and HTTPclient without logging. We do not log in tests
         */
        paylikeClient.loggingFn = { _ in
            // do nothing
        }
        paylikeClient.httpClient.loggingFn = { _ in
            // do nothing
        }
    }

    func test_tokenize_withCardNumber_async() throws {
        let expectation = expectation(description: "Value should be received")
        Task {
            do {
                let response = try await PaylikeClient_Tokenize_Live_Tests.paylikeClient.tokenize(cardData: TokenizeCardDataRequest(type: .PCN, value: "4100000000000000"))
                XCTAssertNotNil(response)
                expectation.fulfill()
            } catch {
                print(error)
                XCTFail("Unexpected error")
            }
        }
        wait(for: [expectation], timeout: 20)
    }
    
    @available(swift, deprecated: 5.5)
    func test_tokenize_withCardNumber_completionHandler() throws {
        let expectation = expectation(description: "Value should be received")
        PaylikeClient_Tokenize_Live_Tests.paylikeClient.tokenize(
            cardData: TokenizeCardDataRequest(type: .PCN, value: "4100000000000000")
        ) { result in
            do {
                let response = try result.get()
                XCTAssertNotNil(response)
                expectation.fulfill()
            } catch {
                XCTFail("Unexpected error")
            }
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func test_tokenize_withCardSecurityCode_async() throws {
        let expectation = expectation(description: "Value should be received")
        Task {
            do {
                let response = try await PaylikeClient_Tokenize_Live_Tests.paylikeClient.tokenize(cardData: TokenizeCardDataRequest(type: .PCSC, value: "123"))
                XCTAssertNotNil(response)
                expectation.fulfill()
            } catch {
                print(error)
                XCTFail("Unexpected error")
            }
        }
        wait(for: [expectation], timeout: 20)
    }
    
    @available(swift, deprecated: 5.5)
    func test_tokenize_withCardSecurityCode_completionHandler() throws {
        let expectation = expectation(description: "Value should be received")
        PaylikeClient_Tokenize_Live_Tests.paylikeClient.tokenize(
            cardData: TokenizeCardDataRequest(type: .PCSC, value: "123")
        ) { result in
            do {
                let response = try result.get()
                XCTAssertNotNil(response)
                expectation.fulfill()
            } catch {
                XCTFail("Unexpected error")
            }
        }
        wait(for: [expectation], timeout: 20)
    }
    
    func test_tokenizeSync_withCardNumber_async() throws {
        do {
            let response = try PaylikeClient_Tokenize_Live_Tests.paylikeClient.tokenizeSync(cardData: TokenizeCardDataRequest(type: .PCN, value: "4100000000000000"))
            XCTAssertNotNil(response)
        } catch {
            print(error)
            XCTFail("Unexpected error")
        }
    }
    
    @available(swift, deprecated: 5.5)
    func test_tokenizeSync_withCardNumber_completionHandler() throws {
        PaylikeClient_Tokenize_Live_Tests.paylikeClient.tokenizeSync(
            cardData: TokenizeCardDataRequest(type: .PCN, value: "4100000000000000")
        ) { result in
            do {
                let response = try result.get()
                XCTAssertNotNil(response)
            } catch {
                XCTFail("Unexpected error")
            }
        }
    }
    
    func test_tokenizeSync_withCardSecurityCode_async() throws {
        do {
            let response = try PaylikeClient_Tokenize_Live_Tests.paylikeClient.tokenizeSync(cardData: TokenizeCardDataRequest(type: .PCSC, value: "123"))
            XCTAssertNotNil(response)
        } catch {
            print(error)
            XCTFail("Unexpected error")
        }
    }
    
    @available(swift, deprecated: 5.5)
    func test_tokenizeSync_withCardSecurityCode_completionHandler() throws {
        PaylikeClient_Tokenize_Live_Tests.paylikeClient.tokenizeSync(
            cardData: TokenizeCardDataRequest(type: .PCSC, value: "123")
        ) { result in
            do {
                let response = try result.get()
                XCTAssertNotNil(response)
            } catch {
                XCTFail("Unexpected error")
            }
        }
    }
}
