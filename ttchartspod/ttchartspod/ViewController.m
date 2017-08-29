/**
 *使用CocosPod集成Charts
 *ttchartspod
 *赵彤彤 mrzhao12  ttdiOS
 *1107214478@qq.com
 *http://www.jianshu.com/p/cc3b600dded3
 *本程序是使用CocosPod集成Charts,避免了拖拽Charts工程到自己的工程里照成内存太大
 */
//  ViewController.m
//  ttchartspod
//
//  Created by sjhz on 2017/8/29.
//  Copyright © 2017年 sjhz. All rights reserved.
//

#import "ViewController.h"
@import Charts;
@interface ViewController ()<ChartViewDelegate>
@property (nonatomic, strong) BarChartView *barChartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
_barChartView = [[BarChartView alloc] initWithFrame:self.view.frame];
_barChartView.delegate = self;

_barChartView.drawBarShadowEnabled = NO;
_barChartView.drawValueAboveBarEnabled = YES;

_barChartView.maxVisibleCount = 60;

[_barChartView zoomWithScaleX:1.53 scaleY:1 x:0 y:0];

[self.view addSubview:self.barChartView];
ChartXAxis *xAxis = _barChartView.xAxis;
xAxis.labelPosition = XAxisLabelPositionBottom;
xAxis.labelFont = [UIFont systemFontOfSize:10.f];
xAxis.drawGridLinesEnabled = NO;
xAxis.granularity = 1.0; // only intervals of 1 day
xAxis.labelCount = 7;
//    xAxis.valueFormatter = [[DayAxisValueFormatter alloc] initForChart:_chartView];

NSNumberFormatter *leftAxisFormatter = [[NSNumberFormatter alloc] init];
leftAxisFormatter.minimumFractionDigits = 0;
leftAxisFormatter.maximumFractionDigits = 1;
//    leftAxisFormatter.negativeSuffix = @" $";
//    leftAxisFormatter.positiveSuffix = @" $";
// Y轴（左y轴）
ChartYAxis *leftAxis = _barChartView.leftAxis;
leftAxis.labelFont = [UIFont systemFontOfSize:10.f];
leftAxis.labelCount = 8;
leftAxis.valueFormatter = [[ChartDefaultAxisValueFormatter alloc] initWithFormatter:leftAxisFormatter];
leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
leftAxis.spaceTop = 0.15;
leftAxis.axisMinimum = 0.0; // this replaces startAtZero = YES

ChartYAxis *rightAxis = _barChartView.rightAxis;
rightAxis.enabled = YES;
rightAxis.drawGridLinesEnabled = NO;
rightAxis.labelFont = [UIFont systemFontOfSize:10.f];
rightAxis.labelCount = 8;
rightAxis.valueFormatter = leftAxis.valueFormatter;
rightAxis.spaceTop = 0.15;
rightAxis.axisMinimum = 0.0; // this replaces startAtZero = YES

ChartLegend *l = _barChartView.legend;
l.horizontalAlignment = ChartLegendHorizontalAlignmentLeft;
l.verticalAlignment = ChartLegendVerticalAlignmentBottom;
l.orientation = ChartLegendOrientationHorizontal;
l.drawInside = NO;
l.form = ChartLegendFormSquare;
l.formSize = 9.0;
l.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:11.f];
l.xEntrySpace = 4.0;

//
//BalloonMarker *marker = [[BalloonMarker alloc]
//                         initWithColor: [UIColor colorWithWhite:180/255. alpha:1.0]
//                         font: [UIFont systemFontOfSize:12.0]
//                         textColor: UIColor.whiteColor
//                         insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
//marker.chartView = _barChartView;
//marker.minimumSize = CGSizeMake(80.f, 40.f);
//_barChartView.marker = marker;


[self setDataCount:25 range:50];

}
- (void)setDataCount:(int)count range:(double)range
{
    double start = 1.0;
    
    NSMutableArray *yVals = [[NSMutableArray alloc] init];
    
    for (int i = start; i < start + count + 1; i++)
    {
        double mult = (range + 1);
        double val = (double) (arc4random_uniform(mult));
        [yVals addObject:[[BarChartDataEntry alloc] initWithX:(double)i y:val]];
    }
    
    BarChartDataSet *set1 = nil;
    if (_barChartView.data.dataSetCount > 0)
    {
        set1 = (BarChartDataSet *)_barChartView.data.dataSets[0];
        set1.values = yVals;
        [_barChartView.data notifyDataChanged];
        [_barChartView notifyDataSetChanged];
    }
    else
    {
        set1 = [[BarChartDataSet alloc] initWithValues:yVals label:@"The year 2017"];
        [set1 setColors:ChartColorTemplates.material];
        
        NSMutableArray *dataSets = [[NSMutableArray alloc] init];
        [dataSets addObject:set1];
        
        BarChartData *data = [[BarChartData alloc] initWithDataSets:dataSets];
        [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.f]];
        
        data.barWidth = 0.9f;
        
        _barChartView.data = data;
    }
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
