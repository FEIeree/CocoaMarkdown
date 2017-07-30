//
//  CMTextAttachmentManager.h
//  CocoaMarkdown
//
//  Created by Krzysztof Rodak on 06/01/16.
//  Copyright © 2016 Indragie Karunaratne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMMarkdownImageWrapper : NSObject

@property (nonatomic, readonly) NSURL *imageURL;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSRange range;
@property (nonatomic, readonly) NSTextAttachment *attachment;

+ (instancetype)imageWrapperWithImageURL:(NSURL*)imageURL url:(NSURL*)url title:(NSString*)title range:(NSRange)range ;

@end

@interface CMImageAttachmentManager : NSObject

- (void)addMarkdownImageToDownload:(CMMarkdownImageWrapper*)imageWrapper
                   completionBlock:(void(^)(CMMarkdownImageWrapper* updateImage, BOOL isDocumentParsed))completionBlock;
- (void)markDocumentAsParsed;


@end
