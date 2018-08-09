//
//  StateMachine.m
//  State-Machine
//
//  Created by Dzmitry Tarelkin on 8/9/18.
//  Copyright © 2018 Dzmitry Tarelkin. All rights reserved.
//

#import "StateMachine.h"

@interface StateMachine ()
@property (strong, nonatomic) NSDictionary * variants;
@property (strong, nonatomic) NSMutableString * currentChain;
@property (strong, nonatomic) NSMutableArray * chains;
@property (assign, readwrite,nonatomic) State currentState;


@end

@implementation StateMachine

- (instancetype)initWithState{
    self = [super init];
    if (self) {
        _currentState = StateQ0;
        _chains = [NSMutableArray arrayWithObjects:@"ab",@"abba",@"baaa",@"baab",@"bac",@"abbc", nil];
        _currentChain = [NSMutableString string];
        _variants = @{ [NSNumber numberWithInteger: StateQ1]  : @[@"a"],
                       [NSNumber numberWithInteger: StateQ2]  : @[@"ab"],
                       [NSNumber numberWithInteger: StateQ3]  : @[@"abb"],
                       [NSNumber numberWithInteger: StateQ4]  : @[@"abba"],
                       [NSNumber numberWithInteger: StateQ5]  : @[@"aa",@"aba",@"abbb",@"abbaa"],
                       [NSNumber numberWithInteger: StateQ6]  : @[@"b"],
                       [NSNumber numberWithInteger: StateQ7]  : @[@"ba"],
                       [NSNumber numberWithInteger: StateQ8]  : @[@"baa"],
                       [NSNumber numberWithInteger: StateQ9]  : @[@"baaa",@"abbc"],
                       [NSNumber numberWithInteger: StateQ10] : @[@"bb",@"bab",@"baca",@"baaba",@"baaaa"],
                       [NSNumber numberWithInteger: StateQ11] : @[@"bac",@"baab"]
                      };
    }
    return self;
}


- (void)performEvent:(Event)event {
    switch (event) {
        case EventA:
            [self.currentChain appendString:@"a"];
            NSLog(@"event a comes");
            break;
        case EventB:
            [self.currentChain appendString:@"b"];
            NSLog(@"event b comes");
            break;
        case EventC:
            [self.currentChain appendString:@"c"];
            NSLog(@"event c comes");
            break;
        default:
            break;
    }
    //checking
    [self changeCurrentState:self.currentState];
   
}



-(void)changeCurrentState:(State)currentState {
    
    [self.variants enumerateKeysAndObjectsUsingBlock:^(NSNumber*  key, NSArray*  values, BOOL *  stop) {
        if ([values containsObject:self.currentChain]) {
            self.currentState = (State)[key integerValue];
            NSLog(@"change current state from State%d to State%ld", currentState,(long)[key integerValue]);
        }
    }];
    [self needsToResetEventForState:currentState];
}



-(void)needsToResetEventForState:(State)state {
    if (self.currentState == state) {
        NSRange range = NSMakeRange([self.currentChain length] - 1, 1);
        [self.currentChain deleteCharactersInRange:range];
        NSLog(@"Event not allowed, curretnState: State%d",self.currentState);
    }
    [self checkTheChain:self.currentChain];
}

-(void)checkTheChain:(NSString*)chain {
    for (NSString* arrChain in self.chains ) {
        if ([chain isEqualToString: arrChain]) {
            NSLog(@"Chain <%@> is valid on State%d SUCCESS!",chain, self.currentState);
            return;
        }
    }
}

@end
