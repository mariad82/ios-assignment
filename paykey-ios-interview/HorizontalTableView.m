//
//  HorizontalScrollView.m
//  paykey-ios-interview
//
//  Created by Ishay Weinstock on 12/16/14.
//  Copyright (c) 2014 Ishay Weinstock. All rights reserved.
//

#import "HorizontalTableView.h"

#define SEPARATOR_WIDTH 1
#define DEFAULT_CELL_WIDTH 100

@interface HorizontalTableView ()

@property (assign, nonatomic)NSUInteger                 index;
@property (strong, nonatomic) UIScrollView*             scrollView;
@property (strong, nonatomic) UIView*                   contentView;

@end

@implementation HorizontalTableView

static NSUInteger currentIndex = 0;

- (UIView*)dequeueCell{
    
    NSUInteger numberOfCellsToPresent = [self.dataSource horizontalTableViewNumberOfCells:self];

    if (!self.scrollView) {
        CGRect scrollViewFrame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 100);
        self.scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
        self.scrollView.contentSize = CGSizeMake(self.cellWidth * numberOfCellsToPresent, 100);
        
        [self addSubview:self.scrollView];
    }
    
    UILabel *cell = [[UILabel alloc] initWithFrame:CGRectMake(self.cellWidth * currentIndex, 0, self.cellWidth, 100)];
    cell.backgroundColor = UIColor.grayColor;

    [self.scrollView addSubview:cell];
    
    return cell;
}



- (void)reloadData {

    NSUInteger numberOfCellsToPresent = [self.dataSource horizontalTableViewNumberOfCells:self];
    
    for (NSUInteger i = 0; i < numberOfCellsToPresent ; i++) {
        
        currentIndex = i;
        
        [self.dataSource horizontalTableView:self cellForIndex:i];
    }
}

@end
