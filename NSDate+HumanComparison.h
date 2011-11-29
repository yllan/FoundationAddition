//
//  NSDate+HumanComparison.h
//  BlackDeerHole
//
//  Created by Yung-Luen Lan on 11/29/11.
//  Copyright (c) 2011 hypo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HumanComparison)
- (BOOL) before: (NSDate *)date;
- (BOOL) after: (NSDate *)date;
@end
