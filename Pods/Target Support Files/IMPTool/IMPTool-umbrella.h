#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IMPTimer.h"
#import "IMPTool+Json.h"
#import "IMPTool+Money.h"
#import "IMPTool+String.h"
#import "IMPTool.h"
#import "IMPToolConfig.h"

FOUNDATION_EXPORT double IMPToolVersionNumber;
FOUNDATION_EXPORT const unsigned char IMPToolVersionString[];

