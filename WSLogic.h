//
//  WSLogic.h
//  Commission Price Calculator
//
//  Created by Electric Coffee on 9/16/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemIndexes.h"

@interface WSLogic : NSObject

-(void)calculateType: (ItemIndex)enumerator price: (double)price extraItemPrice:(double)extraItemPrice andCurrency: (NSString*)currency;

@end
