//
//  CarModel.m
//  Lesson_4_HW
//
//  Created by Nikita Vintonovich on 8/22/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "CarModel.h"
#import "Parameters.h"

@implementation CarModel

- (void)printDescription
{
    NSLog(@"city: %@, shop: %@, model: %@, color: %@, price: %@", self.city, self.brand, self.model, self.parameters.color, self.parameters.price);
}

@end
