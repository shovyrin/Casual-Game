//
//  EnemyClass.m
//  Casual FishGames
//
//  Created by Apple Air on 25.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EnemyClass.h"

@implementation EnemyClass

@synthesize gameObject, objectX, objectY;

-(void) changePicture{
    
    int rNumber = rand()%5;
    
    switch (rNumber) {
        case 0:
            [gameObject setImage:[UIImage imageNamed:@"Flu_Movement_1.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [gameObject setImage:[UIImage imageNamed:@"cold_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [gameObject setImage:[UIImage imageNamed:@"dustMite_Move_1.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [gameObject setImage:[UIImage imageNamed:@"pollen_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [gameObject setImage:[UIImage imageNamed:@"sailor_movement_1.png"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    [gameObject setTag:rNumber];
}


-(void)setDefaultPicture{
    
    
    int tag = gameObject.tag;
    
    switch (tag) {
        case 0:
            [gameObject setImage:[UIImage imageNamed:@"Flu_Movement_1.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [gameObject setImage:[UIImage imageNamed:@"cold_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [gameObject setImage:[UIImage imageNamed:@"dustMite_Move_1.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [gameObject setImage:[UIImage imageNamed:@"pollen_movement_1.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [gameObject setImage:[UIImage imageNamed:@"sailor_movement_1.png"] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    
    gameObject.alpha = 1;
    [gameObject setEnabled:YES];
    
}

@end
