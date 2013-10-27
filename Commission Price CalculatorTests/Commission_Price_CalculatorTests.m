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
    WSLogic* _logic;
    double _price, _extraPrice;
    NSString* _currency;
}

- (void)setUp {
    [super setUp];
    
    _price = 20.0;
    _extraPrice = 12.0;
    _currency = @"USD";
    
    _logic = [WSLogic new];
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)testPricePerCharacter {
    [_logic calculateType: ItemPricePerCharacter
                    price: _price
           extraItemPrice: _extraPrice
              andCurrency: _currency];
}

-(void)testPercentSaved {
    [_logic calculateType: ItemPercentSaved
                    price: _price
           extraItemPrice: _extraPrice
              andCurrency: _currency];
}

-(void)testSelectItem {
    [_logic calculateType: ItemChooseOne
                    price: _price
           extraItemPrice: _extraPrice
              andCurrency: _currency];
}

@end
