//
//  MNAFlickrService.m
//  Campinger
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import "MNAFlickrService.h"
#import "MNAPhotosModel.h"
#import "MNAPhotoModel.h"
#import "NSString+MNAStringExtensions.h"


@implementation MNAFlickrService

- (void)photosForText:(NSString *)text WithCompletion:(void (^)(NSArray *photos))completion
{
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    
    // убрать в plist
    NSString *key = @"4614e1a65e2fdb7896f8cdc243bab31b";
    NSString *secret = @"49d156db4240efba";
    NSString *url = [NSString mna_persentStringWithFormat:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&text=%@&privacy_filter=1&content_type=7&media=photos&format=json&nojsoncallback=1", key, [text stringByReplacingOccurrencesOfString:@" " withString:@""]];
    
    NSURL* downloadTaskURL = [NSURL URLWithString:url];
    [[session downloadTaskWithURL: downloadTaskURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (completion)
        {
            NSData *data = [NSData dataWithContentsOfURL:location];
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            MNAPhotosModel *photosModel = [[MNAPhotosModel alloc] initFromJson:json[@"photos"]];
            completion(photosModel.photos);
        }
    }] resume];
}

- (void)imageFromPhoto:(MNAPhotoModel *)photo WithCompletion:(void (^)(NSData *imageData))completion
{
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    // https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
    NSString *url = [NSString stringWithFormat:@"https://farm%lu.staticflickr.com/%@/%@_%@.jpg", (unsigned long)photo.farm, photo.server, photo.id, photo.server];
    NSLog(@"%@", url);
    NSURL* downloadTaskURL = [NSURL URLWithString:url];
    [[session downloadTaskWithURL: downloadTaskURL completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        if (completion)
        {
            NSData *data = [NSData dataWithContentsOfURL:location];
            completion(data);
        }
    }] resume];
}

@end
