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

-(void) imageAnimation{
    
    NSInteger num = gameObject.tag;
    
    
    switch (num) {
        case 0:
            gameObject.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"Flu_Movement_1.png"],
                                             [UIImage imageNamed:@"Flu_Movement_2.png"],
                                             [UIImage imageNamed:@"Flu_Movement_3.png"],
                                             [UIImage imageNamed:@"Flu_Movement_4.png"],
                                             nil];
            break;
        case 1:
            gameObject.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"cold_movement_1.png"],
                                             [UIImage imageNamed:@"cold_movement_2.png"],
                                             [UIImage imageNamed:@"cold_movement_3.png"],
                                             [UIImage imageNamed:@"cold_movement_4.png"],
                                             nil];
            break;
        case 2:
            gameObject.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"dustMite_Move_1.png"],
                                             [UIImage imageNamed:@"dustMite_Move_2.png"],
                                             [UIImage imageNamed:@"dustMite_Move_3.png"],
                                             [UIImage imageNamed:@"dustMite_Move_4.png"],
                                             nil];
            break;
        case 3:
            gameObject.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"pollen_movement_1.png"],
                                             [UIImage imageNamed:@"pollen_movement_2.png"],
                                             [UIImage imageNamed:@"pollen_movement_3.png"],
                                             [UIImage imageNamed:@"pollen_movement_4.png"],
                                             nil];
            break;
        case 4:
            gameObject.imageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"sailor_movement_1.png"],
                                             [UIImage imageNamed:@"sailor_movement_2.png"],
                                             [UIImage imageNamed:@"sailor_movement_3.png"],
                                             [UIImage imageNamed:@"sailor_movement_4.png"],
                                             nil];
            break;
            
        default:
            break;
    }
    
    gameObject.imageView.animationDuration = .6;
    //btn.imageView.animationRepeatCount = 50;
    [gameObject.imageView startAnimating];
    
    
    
}


@end
