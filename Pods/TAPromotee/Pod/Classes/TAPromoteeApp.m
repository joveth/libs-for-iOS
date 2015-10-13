//
// Created by Jan on 24/04/15.
//

#import "TAPromoteeApp.h"
#import "TAITunesClient.h"


@interface TAPromoteeApp ()
// fetched from iTunes API
@property(nonatomic, strong, readwrite) NSString *name;
@property(nonatomic, strong, readwrite) NSString *price;
@property(nonatomic, strong, readwrite) UIImage *iconImage;
@end

@implementation TAPromoteeApp {

}

- (instancetype)initWithAppStoreId:(NSInteger)appStoreId caption:(NSString *)caption backgroundImage:(UIImage *)backgroundImage
{
    self = [super init];
    if (self) {
        self.appStoreId = appStoreId;
        self.caption = caption;
        self.backgroundImage = backgroundImage;

    }

    return self;
}

+ (instancetype)appWithAppStoreId:(NSInteger)appStoreId caption:(NSString *)caption backgroundImage:(UIImage *)backgroundImage
{
    return [[self alloc] initWithAppStoreId:appStoreId caption:caption backgroundImage:backgroundImage];
}


- (void)fetchAppStoreResourcesWithCompletion:(TAPromoteeAppCompletionBlock)completion
{
    TAITunesClient *itunesClient = [[TAITunesClient alloc] init];
    [itunesClient fetchInfoForAppId:self.appStoreId country:[self getUserCountry] completion:^(NSDictionary *response, NSError *error) {
        // get the image
        if (error) {
            completion(error);
            return;
        }

        self.name = response[@"trackName"];
        self.price = response[@"formattedPrice"];

        NSString *iconURLString = response[@"artworkUrl512"];
        NSString *screenShotURLString = [response[@"screenshotUrls"] firstObject];

        [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:iconURLString] completionHandler:^(NSData *data, NSURLResponse *imageResponse, NSError *imageError) {
            if (!imageError) {
                self.iconImage = [UIImage imageWithData:data];
            }

            if (self.backgroundImage) {
                completion(nil);
                return;
            }


            [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:screenShotURLString] completionHandler:^(NSData *data, NSURLResponse *imageResponse, NSError *imageError) {
                if (!imageError) {
                    self.backgroundImage = [UIImage imageWithData:data];
                }
                completion(nil);
            }] resume];


        }] resume];
    }];

}

#pragma mark - Accessors

- (NSString *)campaignToken
{
    return _campaignToken ? _campaignToken : @"";
}

- (NSString *)affiliateToken
{
    return _affiliateToken ? _affiliateToken : @"";
}

#pragma mark - Helper

- (NSString *)getUserCountry
{
    NSLocale *locale = [NSLocale currentLocale];
    return [locale objectForKey: NSLocaleCountryCode];
}


@end