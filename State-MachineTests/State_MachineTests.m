//
//  State_MachineTests.m
//  State-MachineTests
//
//  Created by Dzmitry Tarelkin on 8/9/18.
//  Copyright © 2018 Dzmitry Tarelkin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "StateMachine.h"

@interface State_MachineTests : XCTestCase
@property (nonatomic) StateMachine * stateMachine;

@end

@implementation State_MachineTests

- (void)setUp {
    [super setUp];
    self.stateMachine = [[StateMachine alloc] initWithState];

}

- (void)tearDown {
    self.stateMachine = nil;
    [super tearDown];
}

//FIRST CHAIN <ab>
- (void)testExampleChain1_Success {
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    XCTAssertEqual(self.stateMachine.currentState, StateQ2);
}

- (void)testExampleChain1_Failure{
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventA];
    XCTAssertNotEqual(self.stateMachine.currentState, StateQ2);
}


//SECOND CHAIN <abba>
- (void)testExampleChain2_Success {
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    XCTAssertEqual(self.stateMachine.currentState, StateQ4);
}

- (void)testExampleChain2_Failure{
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    XCTAssertNotEqual(self.stateMachine.currentState, StateQ4);
}


//THIRD CHAIN <baaa>
- (void)testExampleChain3_Success {
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventA];
    XCTAssertEqual(self.stateMachine.currentState, StateQ9);
}

- (void)testExampleChain3_Failure{
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    XCTAssertNotEqual(self.stateMachine.currentState, StateQ9);
}


//FOURTH CHAIN <baab>
- (void)testExampleChain4_Success {
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    XCTAssertEqual(self.stateMachine.currentState, StateQ11);
}

- (void)testExampleChain4_Failure{
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventA];
    XCTAssertNotEqual(self.stateMachine.currentState, StateQ11);
}


//FIFTH CHAIN <bac>
- (void)testExampleChain5_Success {
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventC];
    XCTAssertEqual(self.stateMachine.currentState, StateQ11);
}

- (void)testExampleChain5_Failure{
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventA];
    XCTAssertNotEqual(self.stateMachine.currentState, StateQ11);
}

//SIXTH CHAIN <ab>
- (void)testExampleChain6_Success {
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventC];
    XCTAssertEqual(self.stateMachine.currentState, StateQ9);
}

- (void)testExampleChain6_Failure{
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    XCTAssertNotEqual(self.stateMachine.currentState, StateQ9);
}

//NO SUCH EVENT TEST
- (void)testExampleForUndefindState_Success {
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
//State5 here, next events should be ignored
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    XCTAssertEqual(self.stateMachine.currentState, StateQ5);
}

- (void)testExampleForUndefindState_Failure {
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventC];
//State9 here, next events should be ignored
    [self.stateMachine performEvent:EventC];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventA];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    [self.stateMachine performEvent:EventB];
    
    XCTAssertNotEqual(self.stateMachine.currentState, StateQ10);
}



@end
