//
//  NSString+ChineseConversion.m
//  BlackDeerHole
//
//  Created by Yung-Luen Lan on 8/19/11.
//  Copyright 2011 hypo. All rights reserved.
//

#import "NSString+ChineseConversion.h"

const size_t vxSC2TCTableSize=8189;
extern unichar vxSC2TCTable[];

const size_t vxTC2SCTableSize=3209;
extern unichar vxTC2SCTable[];

struct VXHCData {
	unichar key, value;
};

int VXHCCompare(const void *a, const void *b);
unichar VXHCFind(unichar key, unichar *table, size_t size);
unichar VXUCS2TradToSimpChinese(unichar c);
unichar VXUCS2SimpToTradChinese(unichar c);

int VXHCCompare(const void *a, const void *b)
{
	unichar x=((const struct VXHCData*)a)->key, y=((const struct VXHCData*)b)->key;
	if (x==y) return 0;
	if (x<y) return -1;
	return 1;
}

unichar VXHCFind(unichar key, unichar *table, size_t size)
{
	struct VXHCData k;
	k.key=key;
	struct VXHCData *d=(struct VXHCData*)bsearch(&k, table, size, sizeof(struct VXHCData), VXHCCompare);
	if (!d) return 0;
	return d->value;
}

unichar VXUCS2TradToSimpChinese(unichar c)
{
	return VXHCFind(c, vxTC2SCTable, vxTC2SCTableSize);
}

unichar VXUCS2SimpToTradChinese(unichar c)
{
	return VXHCFind(c, vxSC2TCTable, vxSC2TCTableSize);
}

@implementation NSString (ChineseConversion)

- (NSString *) stringByConvertWithFunction: (unichar (*)(unichar))convertFunction
{
    const NSUInteger bufferSize = 1024;
    unichar buffer[bufferSize];
    NSUInteger length = [self length];
    NSMutableString *resultString = [NSMutableString stringWithCapacity: length];
    
    for (NSUInteger idx = 0; idx < length; idx += bufferSize) {
        NSRange r = NSMakeRange(idx, MIN(length - idx, bufferSize));
        [self getCharacters: buffer range: r];
        
        for (NSUInteger i = 0; i < r.length; i++) {
            unichar s = convertFunction(buffer[i]);
            if (s) buffer[i] = s;
        }
        [resultString appendString: [NSString stringWithCharacters: buffer length: r.length]];
    }
    return resultString;
}

- (NSString *) stringByConvertToSimplifiedChinese
{
    return [self stringByConvertWithFunction: VXUCS2TradToSimpChinese];
}

- (NSString *) stringByConvertToTraditionalChinese
{
    return [self stringByConvertWithFunction: VXUCS2SimpToTradChinese];
}
@end
