//
//  View2.m
//  test1
//
//  Created by Morten Kleveland on 22.01.14.
//  Copyright (c) 2014 NTNU. All rights reserved.
//

#import "View2.h"

@implementation View2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *a = [[UINib nibWithNibName:@"View2" bundle:nil]instantiateWithOwner:nil options:nil];
        self = a[0];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


@end
