//
//  DLTextView.h
//  UITextViewDemo
//
//  Created by 邹道利 on 21/6/16.
//  Copyright © 2016年 www.visualogies.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLTextView : UITextView

/**
 *  文字
 */
@property (nonatomic,copy) NSString *placeholder;

/**
 *  颜色,默认是lightGrayColor
 */
@property (nonatomic,strong) UIColor *placeholderColor;


@end
