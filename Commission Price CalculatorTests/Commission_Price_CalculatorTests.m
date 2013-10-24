//
//  Commission_Price_CalculatorTests.m
//  Commission Price CalculatorTests
//
//  Created by Electric Coffee on 9/9/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import "Commission_Price_CalculatorTests.h"
#import "WSLogic.h"
#import "ItemIndexes.h"

@implementation Commission_Price_CalculatorTests {
    WSLogic* logic;
}

- (void)setUp {
    [super setUp];
    
    logic = [WSLogic new];
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)testPricePerCharacter {
    [logic calculateType: ItemPricePerCharacter
                   price: 20.0
              extraItemPrice: 12.0
             andCurrency: @"USD"];
}

-(void)testPercentSaved {
    [logic calculateType: ItemPercentSaved
                   price: 20.0
              extraItemPrice: 12.0
             andCurrency: @"USD"];
}

@end
