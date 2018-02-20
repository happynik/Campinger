//
//  MNAFlickrService.h
//  Campinger
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MNAPhotoModel;


@interface MNAFlickrService : NSObject

- (void)photosForText:(NSString *)text WithCompletion:(void (^)(NSArray *photos))completion;
- (void)imageFromPhoto:(MNAPhotoModel *)photo WithCompletion:(void (^)(NSData *imageData))completion;

@end
