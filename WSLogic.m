//
//  WSLogic.m
//  Commission Price Calculator
//
//  Created by Electric Coffee on 9/16/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import "WSLogic.h"
#import "WSUtility.h"
#import "ItemIndexes.h" // using the global enum to ensure compatibility with the code in WSAppDelegate.m

// hidden helper function designed to reduce the size of the "writeToFileWithSelector: price: andModifier:" method
// being a function it doesn't have much overhead compared to a method
double invokeCalculator(id object, SEL method, double price, double extraItemPrice, int index) {
    double returnValue = 0xDEAD;
    
    if([object respondsToSelector:method]) {
        NSLog(@"object responded sucessfully");
        NSInvocation* invocation =
            [NSInvocation invocationWithMethodSignature: [object methodSignatureForSelector: method]];
        [invocation setTarget:   object];                     // index 0 (hidden)
        [invocation setSelector: method];                     // index 1 (hidden)
        [invocation setArgument: &price          atIndex: 2]; // index 2
        [invocation setArgument: &extraItemPrice atIndex: 3]; // and so on
        [invocation setArgument: &index          atIndex: 4];
        [invocation invoke];
        [invocation getReturnValue: &returnValue];
    }
    
    return returnValue; // if it's 0xDEAD I know it's an error
}

@implementation WSLogic

// MARK: Private Members
//TODO: finish the actual file-writing part of the method
-(void) writeToFileWithSelector: (SEL) selector price: (double) price andModifier: (double) extraItems {
    double currentValue;
    for (int i = 1; i < 10; i++) {
        currentValue = invokeCalculator(self, selector, price, extraItems, i);
        NSLog(@"%i current value: %f", i, currentValue);
    }
}

-(double)calculatePercentWithPrice: (double)price andModifier: (double) modifier andIndex: (int) count {
    return ((count + 1) * price) - ((count + 1) * price) * (modifier / 100);
}

-(double)calculatePriceWithPrice: (double)price andModifier: (double) modifier andIndex: (int) count {
    return price + modifier * count;
}

// MARK: Public Members
-(void)calculateType: (ItemIndex)enumerator price: (double)price extraItemPrice: (double)extraItemPrice andCurrency: (NSString*)currency {
    switch (enumerator) {
        case ItemPricePerCharacter:
            [self writeToFileWithSelector: @selector(calculatePriceWithPrice:andModifier:andIndex:)
                                    price: price
                              andModifier: extraItemPrice];
            break;
            
        case ItemPercentSaved:
            [self writeToFileWithSelector: @selector(calculatePriceWithPrice:andModifier:andIndex:)
                                    price: price
                              andModifier: extraItemPrice];
            break;
            
        default: // unreachable
            [WSUtility alertWithMessage: @"Error"
                         andInformative: @"The program did something illegal\nPlease send \"0xDEAD\" followed by your version of MacOS to slench102@gmail.com"];
            break;
    }
}

@end
