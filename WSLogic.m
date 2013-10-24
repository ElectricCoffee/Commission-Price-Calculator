//
//  WSLogic.m
//  Commission Price Calculator
//
//  Created by Electric Coffee on 9/16/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import "WSLogic.h"
#import "ItemIndexes.h" // using the global enum to ensure compatibility with the code in WSAppDelegate.m

const int ARRAY_SIZE = 3;

@implementation WSLogic

-(double)calculatePercent: (NSArray*) array {
    if([array count] == ARRAY_SIZE) { // it MUST be 3
        double
            price = [[array objectAtIndex: 0] doubleValue],
            modifier = [[array objectAtIndex: 1] doubleValue],
            count = [[array objectAtIndex: 2] doubleValue];
        
        return ((count + 1) * price) - ((count + 1) * price) * (modifier / 100);
    }
    
    else return 0;
}

-(double)calculatePrice: (NSArray*) array {
    if([array count] == ARRAY_SIZE) { // it MUST be 3
        double
            price = [[array objectAtIndex: 0] doubleValue],
            modifier = [[array objectAtIndex: 1] doubleValue],
            count = [[array objectAtIndex: 2] doubleValue];
        
        return price + modifier * count;
    }
    
    else return 0;
}

-(id)calculateType: (NSInteger)enumerator price: (double)price extraItems:(double)extraItems andCurrency: (NSString*)currency {
    switch (enumerator) {
        case ItemPricePerCharacter:
            
            break;
            
        case ItemPercentSaved:
            break;
            
        default:
            break;
    }
}

@end
