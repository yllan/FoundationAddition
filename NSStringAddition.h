#import <Foundation/Foundation.h>

@interface NSString (YLAddition)
- (NSString *) stringByDecodingURLFormat;
- (NSString *) stringByEncodingURLFormat;
- (NSDictionary *) dictionaryFromURLQuery;
@end