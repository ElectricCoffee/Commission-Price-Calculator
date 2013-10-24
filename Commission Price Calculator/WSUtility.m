//
//  WSUtility.m
//  Commission Price Calculator
//
//  Created by Electric Coffee on 10/24/13.
//  Copyright (c) 2013 Electric Coffee. All rights reserved.
//

#import "WSUtility.h"

@implementation WSUtility

+(void)alertWithMessage: (NSString*)message andInformative: (NSString*)informative {
    NSAlert* alert = [[NSAlert alloc] init];
    [alert setMessageText: message];
    [alert setInformativeText: informative];
    [alert runModal];
}

@end
