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

typedef double (*CalcFunc)(double, double, int); // defining function signature, so I can call the functions below by name

double calculatePercent(double price, double modifier, int index) {
    return ((index + 1) * price) - ((index + 1) * price) * (modifier / 100);
}

double calculatePrice(double price, double modifier, int index) {
    return price + modifier * index;
}

@implementation WSLogic

// MARK: Private Members
-(double) applyCalculationWithFunction: (CalcFunc) fun price: (double) price modifier: (double) extraItemPrice andIndex: (int) i {
    return fun (price, extraItemPrice, i);
}

//TODO: finish the actual file-writing part of the method
-(void) writeToFileWithSelector: (CalcFunc) fun price: (double) price andModifier: (double) extraItems {
    double currentValue;
    for (int i = 1; i < 10; i++) {
        currentValue = [self applyCalculationWithFunction: fun price: price modifier: extraItems andIndex: i];
        NSLog(@"%ith current value: %.2f", i, currentValue);
    }
}

// MARK: Public Members
-(void)calculateType: (ItemIndex)enumerator price: (double)price extraItemPrice: (double)extraItemPrice andCurrency: (NSString*)currency {
    switch (enumerator) {
        case ItemPricePerCharacter:
            [self writeToFileWithSelector: calculatePrice
                                    price: price
                              andModifier: extraItemPrice];
            break;
            
        case ItemPercentSaved:
            [self writeToFileWithSelector: calculatePercent
                                    price: price
                              andModifier: extraItemPrice];
            break;
            
        
        case ItemChooseOne:
            [WSUtility alertWithMessage: @"Error"
                         andInformative: @"Please choose a calculation type!"];
            break;
            
        default: // unreachable
            [WSUtility alertWithMessage: @"Error"
                         andInformative: @"The program did something illegal\nPlease send \"0xDEAD\" followed by your version of MacOS to slench102@gmail.com"];
            break;
    }
}

@end
