#import "NSStringAddition.h"

@implementation NSString (YLAddition)
- (NSString *) stringByDecodingURLFormat
{
    NSString *result = [self stringByReplacingOccurrencesOfString: @"+" withString: @" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    return result;
}

- (NSString *) stringByEncodingURLFormat
{
    NSString *result = [self stringByReplacingOccurrencesOfString: @" " withString: @"+"];
    result = [result stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    return result;
}

- (NSDictionary *) dictionaryFromURLQuery
{
    NSArray *components = [[self stringByDecodingURLFormat] componentsSeparatedByString: @"&"];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    for (NSString *component in components) {
        id key = [[component componentsSeparatedByString: @"="] objectAtIndex: 0];
        id value = [NSNull null];
        if ([[component componentsSeparatedByString: @"="] count] > 1)
            value = [[component componentsSeparatedByString: @"="] objectAtIndex: 1];
        [parameters setObject: value forKey: key];
    }
}

@end