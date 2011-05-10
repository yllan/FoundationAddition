#import <Foundation/Foundation.h>

@interface NSURL (YLAddition)
- (NSDictionary *) queryComponents;
- (NSURL *) URLByAddingQueryComponents: (NSDictionary *)queries;
@end

@interface NSDictionary (YLAddition)
- (NSString *) stringFromQueryComponents;
@end
