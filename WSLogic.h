//
//  WSLogic.h
//  Commission Price Calculator
//
//  Created by Electric Coffee on 9/16/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSLogic : NSObject

-(id)calculateType: (NSInteger)enumerator price: (double)price extraItems:(double)extraItems andCurrency: (NSString*)currency;

@end