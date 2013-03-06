//
//  CPTTestAppBarChartController.m
//  CPTTestApp-iPhone
//

#import "CPTTestAppBarChartController.h"

@implementation CPTTestAppBarChartController

@synthesize timer;

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return YES;
}

#pragma mark -
#pragma mark Initialization and teardown
-(void)viewWillAppear:(BOOL)animated    {

    self.navigationController.navigationBarHidden=FALSE;

    self.navigationController.navigationBar.barStyle=UIBarStyleBlackOpaque;
    
    
    objdatabase=[[DataBase alloc]init];
    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
    
    customTickLocations=[[NSMutableArray alloc] init];
    
    
    
    
    
    xAxisLabels=[[NSMutableArray alloc] init];
    arrTotalDay=[[NSMutableArray alloc]init];
    [arrTotalDay addObject:@"0"];
   
   if([objappdel.strSelectedreport isEqualToString:@"1 Month"])
       
   {
       totalbar=32;
       header = @"1 Month Report";
       
       
       for(int k=1;k<=31;k++)
       {
           [customTickLocations addObject:[NSString stringWithFormat:@"%d",k]];
           
           
       }
       
       
       
       
       for(int k=1;k<=31;k++)
       {
           [xAxisLabels addObject:[NSString stringWithFormat:@"%d",k]];
           
           
       }

       [self dayReport];
              
   }
   else if([objappdel.strSelectedreport isEqualToString:@"3 Months"])
        
    {
         
             totalbar=4;
        [self ThreeMonthReport];
        
        
    }
   else if([objappdel.strSelectedreport isEqualToString:@"6 Months"])
        
   {  
      
       
       
       header = @"6 Months Report";
       
       
       
        totalbar=7;
       [self SixMonthReport];
       
        
    }
   else if([objappdel.strSelectedreport isEqualToString:@"1 Year"])
        
   {  
       header = @"1 Year Report";
       
        totalbar=13;
       [self OneYearReport];
       
        
    }
   else if([objappdel.strSelectedreport isEqualToString:@"2 Years"])
        
   {  
       header = @"2 Year Report";
       
        totalbar=3;
        
       [self TwoYearReport];
       
    }

 
}

-(void)queries:(NSString *)startDate:(NSString *)endDate:(int)interval{

    totaldaysale=0;
    
    NSString *condition3;
    
    
    condition3=[NSString stringWithFormat:@"where Date<='%@' And Date >'%@'",endDate,startDate];
    
    
    [objdatabase ShowDataForServiceDetails:condition3];
    
    for(int i=0;i<[objdatabase.catchArray   count];i++)
    {
        
        totaldaysale=totaldaysale+[[[objdatabase.catchArray objectAtIndex:i] valueForKey:@"price"] intValue];
        
        
    }  
    
    [arrTotalDay addObject:[NSString stringWithFormat:@"%d",totaldaysale]];
    
    [customTickLocations addObject:[NSDecimalNumber numberWithInt:interval]];
    
    NSArray *arr=[startDate componentsSeparatedByString:@"-"];
    
    if([objappdel.strSelectedreport isEqualToString:@"2 Years"])
        
    {
        [xAxisLabels addObject:[NSString stringWithFormat:@"%@",[arr objectAtIndex:0]]];

    }
    else{
    
    [xAxisLabels addObject:[NSString stringWithFormat:@"%@",[arr objectAtIndex:1]]];
    }

}



-(NSString *)Calendar:(int)month:(int)day
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    
    NSDateComponents *components;
    
    components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[[[NSDate alloc] init]autorelease]];
   
    [components setDay:day];
    
    
    if([objappdel.strSelectedreport isEqualToString:@"2 Years"])
        
    { 
    
        [components setYear:([components year] - month)]; 
        
    }
    else{
    [components setMonth:([components month] - month)]; 
    }
    
    NSDate *CurrentMonthstart = [cal dateFromComponents:components];
    
    NSString *strCurrentMonthstart = [NSString stringWithFormat:@"%@",CurrentMonthstart];
    
    NSArray *arrCurrentMonthstart= [strCurrentMonthstart componentsSeparatedByString:@" "];

    NSString *dateCurrentMonthstart;
    dateCurrentMonthstart=[arrCurrentMonthstart objectAtIndex:0];
    
    
    
    
    return dateCurrentMonthstart;
    

}
-(void)TwoYearReport{

 area=5.0;
    NSString *first;
    NSString *firstlast;
    
        first=[self Calendar:0 :2];
        
    
    NSArray *arr=[first componentsSeparatedByString:@"-"];
    NSString *strstartdate=[NSString stringWithFormat:@"%@-12-31",[arr objectAtIndex:0]];
    NSString *strlastdate=[NSString stringWithFormat:@"%@-01-01",[arr objectAtIndex:0]];
    
    
    
    [self queries:strlastdate :strstartdate :1];
    
        
    
     
     firstlast=[self Calendar:1 :2];
    NSArray *arrlast=[firstlast componentsSeparatedByString:@"-"];
    NSString *strstartdate1=[NSString stringWithFormat:@"%@-12-31",[arrlast objectAtIndex:0]];
    NSString *strlastdate1=[NSString stringWithFormat:@"%@-01-01",[arrlast objectAtIndex:0]];
    
    
       
   
    
    
    [self queries:strlastdate1 :strstartdate1 :2];
    
    
    [self timerFired];
    


}
-(void)OneYearReport{
    area=8.0;
    
    
    NSString *first;
    NSString *firstlast;
    for (int i=0; i<12; i++) {
        
        first=[self Calendar:i :2];
        
        firstlast=[self Calendar:i :32];
        
        [self queries:first :firstlast :i+1];
        
    }
    
    
    
    
    
    
    [self timerFired];


}

-(void)SixMonthReport{
    area=8.0;
    
    
    NSString *first;
    NSString *firstlast;
    for (int i=0; i<6; i++) {
       
        first=[self Calendar:i :2];
        
        firstlast=[self Calendar:i :32];
        
        [self queries:first :firstlast :i+1];
        
    }
    
    
    
    

    
    [self timerFired];


}
-(void)ThreeMonthReport{
    header = @"3 Months Report";
    area=5.0;
    
    
    NSString *first;
  NSString *firstlast;

    first=[self Calendar:0 :2];
 
    firstlast=[self Calendar:0 :32];
    
    [self queries:first :firstlast :1];
    
     
    
       
    first = [self Calendar:1 :2];
    
    
  
    firstlast=[self Calendar:1 :32];
    
    
    [self queries:first :firstlast :2];
    
       
    
   first= [self Calendar:2 :2];
    
    firstlast=[self Calendar:2 :32];
    
    
    [self queries:first :firstlast :3];
    
    
    
        
     [self timerFired];

    
}
-(void)dayReport{
    area=10.0;
    
    NSDate *strdate;
    strdate=[NSDate date];
    
    //2011-02-28
    NSString *strDateyear = [NSString stringWithFormat:@"%@",strdate];
	NSArray *arryear = [strDateyear componentsSeparatedByString:@" "];
    NSString *date1;
    date1=[arryear objectAtIndex:0];
    NSArray *arryear1 = [date1 componentsSeparatedByString:@"-"];
    
    
    
    
    NSString *strdatestart;
    
    
    for(int i=1;i<10;i++)
    {
        strdatestart=[NSString stringWithFormat:@"%@-%@-0%d",[arryear1 objectAtIndex:0],[arryear1 objectAtIndex:1],i];
       // NSLog(@"%@",strdatestart);
        
        [self TotalSalesday:strdatestart];
        
    }
    for(int i=10;i<=31;i++)
    {
        strdatestart=[NSString stringWithFormat:@"%@-%@-%d",[arryear1 objectAtIndex:0],[arryear1 objectAtIndex:1],i];
      //  NSLog(@"%@",strdatestart);
        
        [self TotalSalesday:strdatestart];
        
    } 
    
    
    
    [self timerFired];
    

}

-(void)TotalSalesday:(NSString *)strdate{

    NSString *condition;
    condition=[NSString stringWithFormat:@"where Date='%@'",strdate];
    
    totaldaysale=0;
    
    [objdatabase ShowDataForServiceDetails:condition];

    for(int i=0;i<[objdatabase.catchArray   count];i++)
    {
        
        totaldaysale=totaldaysale+[[[objdatabase.catchArray objectAtIndex:i] valueForKey:@"price"] intValue];
        
        
    }  
    [arrTotalDay addObject:[NSString stringWithFormat:@"%d",totaldaysale]];
    
    

}
-(void)viewDidAppear:(BOOL)animated
{
    
	//[self timerFired];
#ifdef MEMORY_TEST
	//self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self 
	//											selector:@selector(timerFired) userInfo:nil repeats:YES];
#endif
}

-(void)timerFired
{
#ifdef MEMORY_TEST
	static NSUInteger counter = 0;
	
	//NSLog(@"\n----------------------------\ntimerFired: %lu", counter++);
#endif
	
	[barChart release];
	
    // Create barChart from theme
    barChart = [[CPTXYGraph alloc] initWithFrame:CGRectZero];
    
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor]; // change t
    label.text=header;
    
    [self.navigationController.navigationItem.titleView addSubview:label];
    


	CPTTheme *theme = [CPTTheme themeNamed:kCPTDarkGradientTheme];
    [barChart applyTheme:theme];
	CPTGraphHostingView *hostingView = (CPTGraphHostingView *)self.view;
    hostingView.hostedGraph = barChart;
//    CGPoint pointOfTouch
//    [hostedGraph pointingDeviceDraggedEvent:event atPoint:pointOfTouch];

    
    
    // Border
    barChart.plotAreaFrame.borderLineStyle = nil;
    barChart.plotAreaFrame.cornerRadius = 0.0f;
	
    // Paddings
    barChart.paddingLeft = 0.0f;
    barChart.paddingRight = 00.0f;
    barChart.paddingTop = 00.0f;
    barChart.paddingBottom = 0.0f;
	
    barChart.plotAreaFrame.paddingLeft = 40.0;
	barChart.plotAreaFrame.paddingTop = 0.0;
	barChart.plotAreaFrame.paddingRight = 0.0;
	barChart.plotAreaFrame.paddingBottom =40.0;

    // Graph title
    CPTMutableTextStyle *textStyle = [CPTTextStyle textStyle];
    textStyle.color = [CPTColor grayColor];
    textStyle.fontSize = 16.0f;
	textStyle.textAlignment = CPTTextAlignmentCenter;
    barChart.titleTextStyle = textStyle;
    barChart.titleDisplacement = CGPointMake(0.0f, -20.0f);
    barChart.titlePlotAreaFrameAnchor = CPTRectAnchorTop;
	
	// Add plot space for horizontal bar charts
    CPTXYPlotSpace *plotSpace = (CPTXYPlotSpace *)barChart.defaultPlotSpace;
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.0f) length:CPTDecimalFromFloat(500.0f)];
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromFloat(0.0f) length:CPTDecimalFromFloat(area)];
    plotSpace.allowsUserInteraction = YES;

	
	CPTXYAxisSet *axisSet = (CPTXYAxisSet *)barChart.axisSet;
    CPTXYAxis *x = axisSet.xAxis;
    x.axisLineStyle = nil;
    x.majorTickLineStyle = nil;
    x.minorTickLineStyle = nil;
    x.majorIntervalLength = CPTDecimalFromString(@"0");
    x.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0");
	x.title = @"Month";
    x.titleLocation = CPTDecimalFromFloat(5.5f);
	x.titleOffset = 55.0f;
	
	// Define some custom labels for the data elements
	x.labelRotation = M_PI/4;
	x.labelingPolicy = CPTAxisLabelingPolicyNone;
//	NSArray *customTickLocations = [NSArray arrayWithObjects:[NSDecimalNumber numberWithInt:1], [NSDecimalNumber numberWithInt:5], [NSDecimalNumber numberWithInt:10], [NSDecimalNumber numberWithInt:15], nil];
//	
    
    //= [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    
       
	NSUInteger labelLocation = 0;
	NSMutableArray *customLabels = [NSMutableArray arrayWithCapacity:[xAxisLabels count]];
	for (NSNumber *tickLocation in customTickLocations) {
		CPTAxisLabel *newLabel = [[CPTAxisLabel alloc] initWithText: [xAxisLabels objectAtIndex:labelLocation++] textStyle:x.labelTextStyle];
		newLabel.tickLocation = [tickLocation decimalValue];
		newLabel.offset = x.labelOffset + x.majorTickLength;
		//newLabel.rotation = M_PI/4;
		[customLabels addObject:newLabel];
		[newLabel release];
	}
  	
	x.axisLabels =  [NSSet setWithArray:customLabels];
    //[customLabels release];
    //[xAxisLabels release];
    //[customTickLocations release];
    

	CPTXYAxis *y = axisSet.yAxis;
    y.axisLineStyle = nil;
    y.majorTickLineStyle = nil;
    y.minorTickLineStyle = nil;
    y.majorIntervalLength = CPTDecimalFromString(@"50");
    y.orthogonalCoordinateDecimal = CPTDecimalFromString(@"0");
	y.title = @"Sale";
	y.titleOffset = 45.0f;
    y.titleLocation = CPTDecimalFromFloat(150.0f);
	
    // First bar plot
    CPTBarPlot *barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor darkGrayColor] horizontalBars:NO];
    barPlot.baseValue = CPTDecimalFromString(@"0");
    barPlot.dataSource = self;
    barPlot.barOffset = CPTDecimalFromFloat(0.00f);
    barPlot.identifier = @"Bar Plot 1";
    [barChart addPlot:barPlot toPlotSpace:plotSpace];
    //[barPlot release];
    //[plotSpace  release];
    
    // Second bar plot
//    barPlot = [CPTBarPlot tubularBarPlotWithColor:[CPTColor blueColor] horizontalBars:NO];
//    barPlot.dataSource = self;
//    barPlot.baseValue = CPTDecimalFromString(@"0");
//    barPlot.barOffset = CPTDecimalFromFloat(0.25f);
//    barPlot.barCornerRadius = 2.0f;
//    barPlot.identifier = @"Bar Plot 2";
//    [barChart addPlot:barPlot toPlotSpace:plotSpace];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}
-(IBAction)back{

    [self.navigationController popViewControllerAnimated:YES];
    

}

#pragma mark -
#pragma mark Plot Data Source Methods

-(NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot {
    return totalbar;
}

-(NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)index 
{
    NSDecimalNumber *num = nil;
   
		switch ( fieldEnum ) {
			case CPTBarPlotFieldBarLocation:
				num = (NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:index];
				break;
			
            case CPTBarPlotFieldBarTip:
                if(index==0)
                {
                
                }
                else{
                num =(NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:[[arrTotalDay objectAtIndex:index]intValue]];
                    
				}
                //(NSDecimalNumber *)[NSDecimalNumber numberWithUnsignedInteger:(index+1)*(index+1)];
				break;
		
        }
    
	
    return num;
}

-(CPTFill *) barFillForBarPlot:(CPTBarPlot *)barPlot recordIndex:(NSNumber *)index; 
{
	return nil;
}

@end
