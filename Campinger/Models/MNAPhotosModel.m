//
//  MNAPhotosModel.m
//  Campinger
//
//  Created by Nikita Moiseev on 20.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//

#import "MNAPhotosModel.h"
#import "MNAPhotoModel.h"

@implementation MNAPhotosModel

- (instancetype)initFromJson:(NSDictionary *)json
{
    if (self = [super init])
    {
        NSArray *jsonPhotos = json[@"photo"];
        NSMutableArray *results = [NSMutableArray new];
        for (NSDictionary *jsonPhoto in jsonPhotos)
        {
            MNAPhotoModel *photo = [[MNAPhotoModel alloc] initFromJson:jsonPhoto];
            [results addObject:photo];
        }
        _photos = [results copy];
    }
    return self;
}

@end
