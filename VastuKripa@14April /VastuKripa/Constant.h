//
//  Constant.h
//  WatchMovement
//
//  Created by promatics on 5/15/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#ifndef WatchMovement_Constant_h
#define WatchMovement_Constant_h

#define KeyboardSize 210

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/* color codes */


#define theme_color_hexcode 0x4699E7
#define placeholder_text_color_hexcode 0xC9C9C9
#define text_color_hexcode 0x000000
#define background_color_hexcode 0x2A3B41
#define title_color_hexcode 0x4699E7
#define button_background_color_hexcode 0x4699E7
#define blue_colore 0x1D2130
#define default_tint_color_hexcode 0x123237
#define default_button_color_hexcode 0xA6AB27
#define default_newbutton_color_hexcode 0xB6B823//16323F
#define default_background_color_hexcode 0x16323F
#define yellow_colore 0xFBFF0A
#define navigation_background_color_hexcode 0x19292B

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
/* APP NAME */

#define APPTITLE @"creanara"

#define baseUR

#endif
