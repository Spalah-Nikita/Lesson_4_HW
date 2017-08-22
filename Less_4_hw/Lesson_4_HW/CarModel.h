//
//  CarModel.h
//  Lesson_4_HW
//
//  Created by Nikita Vintonovich on 8/22/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Parameters;

@interface CarModel : NSObject

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) Parameters *parameters;

- (void)printDescription;

@end
