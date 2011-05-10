#import "NSURLAddition.h"
#import "NSStringAddition.h"

@implementation NSURL (YLAddition)
- (NSDictionary *) queryComponents
{
    return [[self query] dictionaryFromURLQuery];
}
@end

@implementation NSDictionary (YLAddition)
- (NSString *) stringFromQueryComponents
{
    NSMutableArray *components = [NSMutableArray array];
    for (NSString *id in [self allKeys]) {
        id value = [self objectForKey: key];
        NSString *result = [[key description] stringByEncodingURLFormat];
        
        if (value != [NSNull null]) 
            result = [result stringByAppendingFormat: @"=%@", [[value description] stringByEncodingURLFormat]];
        
        [components addObject: result];
    }
    return [components componentsJoinedByString: @"&"];
}
@end