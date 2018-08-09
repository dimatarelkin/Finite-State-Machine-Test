//
//  StateMachine.h
//  State-Machine
//
//  Created by Dzmitry Tarelkin on 8/9/18.
//  Copyright © 2018 Dzmitry Tarelkin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    StateQ0,
    StateQ1,
    StateQ2, //конечное состояние
    StateQ3,
    StateQ4, //конечное состояние
    StateQ5,
    StateQ6,
    StateQ7,
    StateQ8,
    StateQ9, //конечное состояние
    StateQ10,
    StateQ11 //конечное состояние
} State;

typedef enum {
    EventA,
    EventB,
    EventC
} Event;


@interface StateMachine : NSObject

@property (assign, readonly,nonatomic) State currentState;
-(instancetype)initWithState;
-(void)performEvent:(Event)event;


@end
