//
//  ReportHomeScreen.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNameValueTag1 1
#import "SettingHome.h"
#import "TableCell.h"
#import "DataBase.h"
#import "CorePlot-CocoaTouch.h"
#import "Hiar_Style_NewAppDelegate.h"

#import "CPTTestAppBarChartController.h"

@interface ReportHomeScreen : UIViewController <UITableViewDelegate,UITableViewDataSource,CPTPlotDataSource>{

    IBOutlet UITableView *tblReport;

    
    Hiar_Style_NewAppDelegate   *objappdel;
    
    
    SettingHome *objSettingHome;
    
    CPTTestAppBarChartController    *objbarchart;
    
    IBOutlet TableCell *tblViewCell;
    DataBase *objdatabase;
    
	NSMutableArray *arrList;
    int totalYearAmt;
    int totalMonthAmt;
    int totalDayAmt;
    int totalWeakAmt;
    
    int totalDayAmtPos;
    int totalYearAmtPos;
    int totalMonthAmtPos;
      int totalWeakAmtPos;
    
    UIColor *colorday;
    UIColor *colormonth;
    UIColor *colorweak;
    UIColor *coloryear;
    
    
    
    int FinalDayAmtPos;
    int FinalYearAmtPos;
    int FinalMonthAmtPos;
    int FinalWeakAmtPos;
    
    
    NSString *strFinalDayAmtPos;
    NSString *strFinalYearAmtPos;
    NSString *strFinalMonthAmtPos;
    NSString *strFinalWeakAmtPos;
    
    NSString *Today;
    NSString *PrevDate;

    
    
    NSString *Month;
    
    NSString *Year;

       
    NSString *PrevMonth;
    
    NSString *PrevYear;
    
    NSString *ThisWeak;
    
    NSString *PrevWeak;
    IBOutlet UIButton *btndemo;
    
    
    
    
    
}
-(IBAction)Settings;

-(void)TackCalendarValue;




-(IBAction)back;
-(void)Showdata;

@end
