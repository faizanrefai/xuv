//
//  CPTTestAppBarChartController.h
//  CPTTestApp-iPhone
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "DataBase.h"
#import "Hiar_Style_NewAppDelegate.h"

@interface CPTTestAppBarChartController : UIViewController <CPTPlotDataSource>
{
@private
    
    DataBase *objdatabase;
    
	CPTXYGraph *barChart;
	NSTimer *timer;

    NSMutableArray *arrTotalDay;
    int totaldaysale;
    Hiar_Style_NewAppDelegate   *objappdel;
    int totalbar;
    NSMutableArray *customTickLocations;
    
    NSMutableArray *xAxisLabels;
    float area;
    NSString *header;
    
    

}

@property(readwrite, retain, nonatomic) NSTimer *timer;

-(void)timerFired;

-(IBAction)back;
-(void)dayReport;
-(void)ThreeMonthReport;

-(void)SixMonthReport;

-(void)OneYearReport;
-(void)TwoYearReport;

-(NSString *)Calendar:(int)month:(int)day;

-(void)TotalSalesday:(NSString *)strdate;
-(void)queries:(NSString *)startDate:(NSString *)endDate:(int)interval;


@end
