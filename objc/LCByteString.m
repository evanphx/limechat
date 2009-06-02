#import "LCByteString.h"

@implementation LCByteString

- (NSData*)readLine
{
	NSLog(@"readLine!");
	
	int len = [self length];
	if (len == 0) return nil;
	
	const char* start = [self bytes];
	char* p = memchr(start, '\n', len);
	if (!p) return nil;
	
	int delimLen = 1;
	char* next = 0;
	if (p > start && *(p-1) == '\r') {
		++delimLen;
	}
	
	NSData* result = [self subdataWithRange:NSMakeRange(0, p - start - delimLen + 1)];

	++p;
	[self setData:[self subdataWithRange:NSMakeRange(p - start, len - (p - start) - delimLen)]];
	
	return result;
}

@end
