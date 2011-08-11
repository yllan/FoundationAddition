#import <Foundation/Foundation.h>

@interface NSString (YLAddition)
+ (NSString *) stringWithUUID;
- (NSString *) stringByDecodingURLFormat;
- (NSString *) stringByEncodingURLFormat;
- (NSDictionary *) dictionaryFromURLQuery;
@end