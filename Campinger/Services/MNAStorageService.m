//
//  MNAStorageService.m
//  Campinger
//
//  Created by Nikita Moiseev on 17.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import "MNAStorageService.h"


@implementation MNAStorageService

- (NSDictionary *)jsonFromFileName:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error)
    {
        NSLog(@"%@", error);
    }
    return json;
}

@end
