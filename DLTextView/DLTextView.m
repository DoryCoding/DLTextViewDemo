//
//  DLTextView.m
//  UITextViewDemo
//
//  Created by 邹道利 on 21/6/16.
//  Copyright © 2016年 www.visualogies.com. All rights reserved.
//

#import "DLTextView.h"

@interface DLTextView ()

/**
 *  显示placeholder的label
 */
@property (nonatomic,strong) UILabel *placeholderLabel;

@end

@implementation DLTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
 *  重写
 */
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        self.placeholderLabel = [[UILabel alloc]init];
        self.placeholderLabel.backgroundColor = [UIColor clearColor];
        self.placeholderLabel.numberOfLines = 0;
        [self addSubview:self.placeholderLabel];
        //设置占位文字的默认颜色
        self.placeholderColor = [UIColor lightGrayColor];
        //设置默认的字体
        self.placeholderLabel.font = [UIFont systemFontOfSize:15];
        //通知：监听文字的改变
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
        
    }
    
    return self;
}

#pragma mark - 监听文字改变
- (void)textDidChange {
    
    /**
     *  hasText是系统的属性，如果textView输入了文字返回YES,否则就是NO
     */
    self.placeholderLabel.hidden = self.hasText;
    
}
///**
// *  在这个方法里面设置placeholderLabel的frame
// */
//- (void)layoutSubviews {
//    [super layoutSubviews];
//
//    CGRect frame = self.placeholderLabel.frame;
//    
//    frame.origin.x = 8;
//    frame.origin.y = 8;
//    frame.size.width = self.placeholderLabel.frame.size.width-frame.origin.x*2.0;
//    
//    CGSize maxSize =CGSizeMake(self.placeholderLabel.frame.size.width,MAXFLOAT);
//    
//    frame.size.height= [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.placeholderLabel.font} context:nil].size.height;
//
//    
//    self.placeholderLabel.frame = frame;
//    
//}

/**
 *  重写暴露出的文字及文字颜色
 */
- (void)setPlaceholder:(NSString *)placeholder {
    
    _placeholder = placeholder;
    
    self.placeholderLabel.text = placeholder;
    
    /**
     *  拿到placeholder之后计算placeholderLabel的大小
     */
    [self changeFrame];
    
    
    //重新计算子控件的大小
    //[self setNeedsLayout];
    
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

/**
 *  重写font方法使字体保持一致
 */
- (void)setFont:(UIFont *)font {
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    //把字体大小赋值后计算label的frame
    [self changeFrame];
}

/**
 *  重写-(void)setText:(NSString*)text方法来控制UILabel的显示和隐藏
 */

- (void)setText:(NSString *)text {
    
    [super setText:text];
    
    [self textDidChange];
}

/**
 *  设置富文本时会调用下面的方法
 */
- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    
    [self textDidChange];
}

/**
 *  销毁通知
 */
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter]removeObserver:UITextViewTextDidChangeNotification];
    
}
#pragma mark - 调整placeholderLabel的大小
- (void)changeFrame {
    
    CGRect frame = self.placeholderLabel.frame;

    frame.origin.x = 8;
    frame.origin.y = 8;
    //宽度就设置成textView的宽度-frame.origin.x*2.0
    frame.size.width = self.frame.size.width-frame.origin.x*2.0;
    
    CGSize maxSize =CGSizeMake(frame.size.width,MAXFLOAT);
    //高度自适应
    frame.size.height= [self.placeholder boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.placeholderLabel.font} context:nil].size.height;
    //如果自适应的高度大于textView本身的高度，直接返回textView本身的高度
    if (frame.size.height > self.frame.size.height) {
        frame.size.height = self.frame.size.height;
    }
    
    self.placeholderLabel.frame = frame;
    
}

@end
