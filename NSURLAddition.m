#import "NSURLAddition.h"
#import "NSStringAddition.h"

@implementation NSURL (YLAddition)
- (NSDictionary *) queryComponents
{
    return [[self query] dictionaryFromURLQuery];
}

- (NSURL *) URLByAddingQueryComponents: (NSDictionary *)queries
{
    if (queries == nil || [[queries allKeys] count] == 0) return self;
    
    NSMutableDictionary *newQueries = [NSMutableDictionary dictionaryWithDictionary: [self queryComponents]];
    
    for (NSString *key in queries) {
        [newQueries setObject: [queries objectForKey: key] forKey: key];
    }
    
    NSMutableString *newURLString = [NSMutableString stringWithString: [[self baseURL] absoluteString]];
    if ([[self parameterString] length] > 0) {
        [newURLString appendFormat: @";%@", [self parameterString]];
    }
    [newURLString appendFormat: @"?%@", [newQueries stringFromQueryComponents]];
    if ([[self fragment] length] > 0) {
        [newURLString appendFormat: @"#%@", [self fragment]];
    }
    return [NSURL URLWithString: newURLString];
}
@end

@implementation NSDictionary (YLAddition)
- (NSString *) stringFromQueryComponents
{
    NSMutableArray *components = [NSMutableArray array];
    for (NSString *key in [self allKeys]) {
        id value = [self objectForKey: key];
        NSString *result = [[key description] stringByEncodingURLFormat];
        
        if (value != [NSNull null]) 
            result = [result stringByAppendingFormat: @"=%@", [[value description] stringByEncodingURLFormat]];
        
        [components addObject: result];
    }
    return [components componentsJoinedByString: @"&"];
}
@end