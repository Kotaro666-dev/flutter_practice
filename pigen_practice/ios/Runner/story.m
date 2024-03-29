// Autogenerated from Pigeon (v4.2.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "story.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface Story ()
+ (Story *)fromMap:(NSDictionary *)dict;
+ (nullable Story *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface Comment ()
+ (Comment *)fromMap:(NSDictionary *)dict;
+ (nullable Comment *)nullableFromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation Story
+ (instancetype)makeWithTitle:(nullable NSString *)title
    author:(nullable NSString *)author
    comments:(nullable NSArray<Comment *> *)comments
    rates:(nullable NSNumber *)rates
    year:(nullable NSNumber *)year
    isFavorite:(nullable NSNumber *)isFavorite {
  Story* pigeonResult = [[Story alloc] init];
  pigeonResult.title = title;
  pigeonResult.author = author;
  pigeonResult.comments = comments;
  pigeonResult.rates = rates;
  pigeonResult.year = year;
  pigeonResult.isFavorite = isFavorite;
  return pigeonResult;
}
+ (Story *)fromMap:(NSDictionary *)dict {
  Story *pigeonResult = [[Story alloc] init];
  pigeonResult.title = GetNullableObject(dict, @"title");
  pigeonResult.author = GetNullableObject(dict, @"author");
  pigeonResult.comments = GetNullableObject(dict, @"comments");
  pigeonResult.rates = GetNullableObject(dict, @"rates");
  pigeonResult.year = GetNullableObject(dict, @"year");
  pigeonResult.isFavorite = GetNullableObject(dict, @"isFavorite");
  return pigeonResult;
}
+ (nullable Story *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [Story fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"title" : (self.title ?: [NSNull null]),
    @"author" : (self.author ?: [NSNull null]),
    @"comments" : (self.comments ?: [NSNull null]),
    @"rates" : (self.rates ?: [NSNull null]),
    @"year" : (self.year ?: [NSNull null]),
    @"isFavorite" : (self.isFavorite ?: [NSNull null]),
  };
}
@end

@implementation Comment
+ (instancetype)makeWithUser:(nullable NSString *)user
    body:(nullable NSString *)body {
  Comment* pigeonResult = [[Comment alloc] init];
  pigeonResult.user = user;
  pigeonResult.body = body;
  return pigeonResult;
}
+ (Comment *)fromMap:(NSDictionary *)dict {
  Comment *pigeonResult = [[Comment alloc] init];
  pigeonResult.user = GetNullableObject(dict, @"user");
  pigeonResult.body = GetNullableObject(dict, @"body");
  return pigeonResult;
}
+ (nullable Comment *)nullableFromMap:(NSDictionary *)dict { return (dict) ? [Comment fromMap:dict] : nil; }
- (NSDictionary *)toMap {
  return @{
    @"user" : (self.user ?: [NSNull null]),
    @"body" : (self.body ?: [NSNull null]),
  };
}
@end

@interface HostStoryApiCodecReader : FlutterStandardReader
@end
@implementation HostStoryApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [Comment fromMap:[self readValue]];
    
    case 129:     
      return [Story fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface HostStoryApiCodecWriter : FlutterStandardWriter
@end
@implementation HostStoryApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[Comment class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[Story class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface HostStoryApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation HostStoryApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[HostStoryApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[HostStoryApiCodecReader alloc] initWithData:data];
}
@end


NSObject<FlutterMessageCodec> *HostStoryApiGetCodec() {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    HostStoryApiCodecReaderWriter *readerWriter = [[HostStoryApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void HostStoryApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<HostStoryApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.HostStoryApi.respond"
        binaryMessenger:binaryMessenger
        codec:HostStoryApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(respondWithError:)], @"HostStoryApi api (%@) doesn't respond to @selector(respondWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        Story *output = [api respondWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
