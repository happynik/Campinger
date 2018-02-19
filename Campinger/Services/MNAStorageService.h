//
//  MNAStorageService.h
//  Campinger
//
//  Created by Nikita Moiseev on 17.02.2018.
//  Copyright © 2018 Nikita Moiseev. All rights reserved.
//


#import <Foundation/Foundation.h>


@protocol MNAStorageServiceProtocol

- (NSDictionary *)jsonFromFileName:(NSString *)fileName;

@end


@interface MNAStorageService : NSObject <MNAStorageServiceProtocol>

@end
