//
//  NSDate+HumanComparison.m
//  BlackDeerHole
//
//  Created by Yung-Luen Lan on 11/29/11.
//  Copyright (c) 2011 hypo. All rights reserved.
//

#import "NSDate+HumanComparison.h"

@implementation NSDate (HumanComparison)
- (BOOL) before: (NSDate *)date
{
    return [self compare: date] == NSOrderedAscending;
}

- (BOOL) after: (NSDate *)date
{
    return [self compare: date] == NSOrderedDescending;
}

@end
