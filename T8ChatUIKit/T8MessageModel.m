//
//  T8MessageModel.m
//  T8ChatUIKitDemo
//
//  Created by 琦张 on 15/11/6.
//  Copyright © 2015年 琦张. All rights reserved.
//

#import "T8MessageModel.h"

@implementation T8MessageModel

- (id)init
{
    self = [super init];
    if (self) {
        
        self.name = @"张琦";
        self.avatar = @"http://7xnjim.com1.z0.glb.clouddn.com/avatar/c0dd782f-4d64-4254-acf0-0bb920af189c";
        self.type = 1 + rand()%4;
        self.content = @"why are you so diao?";
        self.incoming = rand()%2;
        
    }
    return self;
}

@end
