#import <Foundation/Foundation.h>

@interface NSURL (YLAddition)
- (NSDictionary *) queryComponents;
@end

@interface NSDictionary (YLAddition)
- (NSString *) stringFromQueryComponents;
@end
