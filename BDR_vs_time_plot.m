%% Overall BDR plotting
%%%%%%%%%%%%%%%%%%%%%%%
close all; clearvars ; clc;
%include folder to path
[dirpath,~,~]=fileparts(mfilename('fullpath'));
addpath(genpath(dirpath))
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%loaded43MW
pulsenum43 = [1057750   4077400 6009400 1655650 4222050 1383750 6298650 258800  3688000 4598950];
BDs43 =      [11        52      166     12      32      12      128     1       18      17];
tstamps43 = {'4MAR - 7MAR','24MAR - 30MAR','31MAR - 4APR','15APR - 16APR','22APR - 25APR',...
    '29APR - 30APR','04MAY - 09MAY','13MAY','20MAY - 23 MAY','27MAY - 30MAY'};


[ BDR43, sigBDR43, startDateStr43, startDateNum43 ] = BDRcalculation(pulsenum43, BDs43, tstamps43);
%%%%%%%%%%%%%%%%%%%%%%%
%loaded41MW
pulsenum41 = [2228500   3194300];
BDs41 =      [8         4];
tstamps41 = {'28OCT - 02NOV','04NOV - 06NOV'};

[ BDR41, sigBDR41, startDateStr41, startDateNum41 ] = BDRcalculation(pulsenum41, BDs41, tstamps41);
%%%%%%%%%%%%%%%%%%%%%%%
%loaded38MW
pulsenum38 = [2242600   2344050 6735700 4406450 2293000 636900  2960500 2743100 546700];%run1 from IPAC, no BDs in run3 and 5
BDs38 =      [4         19      13      27      1       7       17      40      26];
tstamps38 = {'08APR - 09APR','01JUL - 04JUL','14JUL - 18JUL',...
    '22JUL - 25JUL','29JUL - 31JUL','05AUG - 06AUG','12AUG - 14AUG','25AUG - 27AUG','08SEP - 12 SEP'};

[ BDR38, sigBDR38, startDateStr38, startDateNum38 ] = BDRcalculation(pulsenum38, BDs38, tstamps38);
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%antiloaded
pulsenumA6 = [8115100   10622950    10235100    3311350 ];
BDsA6 =      [68        17          10          7       ];
tstampsA6 = {'04APR - 08APR','03JUN - 06JUN','10JUN - 13JUN','24JUN - 27JUN'};

[ BDRA6, sigBDRA6, startDateStrA6, startDateNumA6 ] = BDRcalculation(pulsenumA6, BDsA6, tstampsA6);
%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%Unloaded43MW
pulsenumU43 = [5138650  3706700 5559900 3437200 1681050 6176900 1279100 3316750];
BDsU43 =      [105      5       439     248     140     246     20      43];
tstampsU43 = {'22MAR - 24MAR','30MAR - 31MAR','12APR - 15APR','27APR - 29APR','03MAY - 04APR',...
                '09MAY - 12MAY','31MAY - 01JUN','01JUN - 03JUN'}; %missing run8

[ BDRU43, sigBDRU43, startDateStrU43, startDateNumU43 ] = BDRcalculation(pulsenumU43, BDsU43, tstampsU43);
%add the IPAC data
BDRU43 = [1.63e-5  BDRU43];
sigBDRU43 = [0.09e-5 sigBDRU43];
startDateStrU43 = ['24FEB2016' startDateStrU43];
startDateNumU43 = [736384 startDateNumU43];
%%%%%%%%%%%%%%%%%%%%%%%
%Unloaded41MW
pulsenumU41 = [5469800   2514800 5902050 18411700];
BDsU41 =      [203       22      111     204];
tstampsU41 = {'30AUG - 02SEP','06SEP - 07SEP','12SEP - 15SEP','17OCT - 28OCT'};


[ BDRU41, sigBDRU41, startDateStrU41, startDateNumU41] = BDRcalculation(pulsenumU41, BDsU41, tstampsU41);

%%%%%%%%%%%%%%%%%%%%%%%
%Unloaded38MW
pulsenumU38 = [1587050  5446800 1413200     3160450 1633300 58800   ];%missing run5
BDsU38 =      [15       96      44          50      36      4       ];
tstampsU38 = {'14JUL ','19JUL - 20JUL','25JUL - 26JUL','26JUL - 28JUL','28AUG - 29AUG','07SEP - 08SEP'};

[ BDRU38, sigBDRU38, startDateStrU38, startDateNumU38 ] = BDRcalculation(pulsenumU38, BDsU38, tstampsU38);

%%%%%%%%%%%%%%%%%%%%%%%
%Unloaded35MW
pulsenumU35 = [6130800   ];
BDsU35 =      [46        ];
tstampsU35 = {'06AUG - 09AUG'};

[ BDRU35, sigBDRU35, startDateStrU35, startDateNumU35 ] = BDRcalculation(pulsenumU35, BDsU35, tstampsU35);

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
%plotting vs time
figure(1)
errorbar(startDateNum43,BDR43,sigBDR43,'. r','MarkerSize',20); 
hold on
errorbar(startDateNum41,BDR41,sigBDR41,'.','Color',[1 .5 0],'MarkerSize',20); 
hold on
errorbar(startDateNum38,BDR38,sigBDR38,'. m','MarkerSize',20); 
hold on
errorbar(startDateNumA6,BDRA6,sigBDRA6,'.','Color',[0.2 0.6 0.2],'MarkerSize',20); 
hold on
errorbar(startDateNumU43,BDRU43,sigBDRU43,'. b','MarkerSize',20); 
hold on
errorbar(startDateNumU41,BDRU41,sigBDRU41,'.','Color',[0.6 0.2 0.6],'MarkerSize',20); 
hold on
errorbar(startDateNumU38,BDRU38,sigBDRU38,'.','Color',[0.2 0.2 0.6],'MarkerSize',20); 
hold off
%errorbar(startDateNumU35,BDRU35,sigBDRU35,'. ','Color',[0.6 0.2 0.2],'MarkerSize',20); 

legend({'Loaded 43.3MW','Loaded 41MW','Loaded 38MW',...
        'Antiloaded 6.5MW',...
        'Unloaded 43.3MW','Unloaded 41MW','Unloaded 38MW','UnLoaded 35MW'})
title('Measured BDR')
xlabel('Date')
ylabel('BDR [1/pulse]')

ax = gca;
ax.XLim = [736361 736635];
ax.XTick = [736361 736390 736421 736451 736482 736512 736543 736574 736604 736635];%1st of every month
ax.XTickLabelRotation = 45;
ax.FontSize = 14;
ax.YGrid = 'on';
ax.YScale = 'log';
datetick('x','ddmmm')



%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
% cumulative BDR plotting vs input power
figure(2)
% loaded 43MW
tpuls43 = sum(pulsenum43);
tBDs43 = sum(BDs43);
[t43, ts43] = BDRcalc(tpuls43,tBDs43) ;
errorbar(43.3,t43,ts43,'. r','MarkerSize',20); 
hold on
% loaded 41MW
tpuls41 = sum(pulsenum41);
tBDs41 = sum(BDs41);
[t41, ts41] = BDRcalc(tpuls41,tBDs41) ;
errorbar(41,t41,ts41,'.','Color',[1 .5 0],'MarkerSize',20); 
hold on
% loaded 38MW
tpuls38 = sum(pulsenum38);
tBDs38 = sum(BDs38);
[t38, ts38] = BDRcalc(tpuls38,tBDs38) ;
errorbar(38,t38,ts38,'. m','MarkerSize',20); 
hold on
% antiloaded 6.5MW
tpulsA6 = sum(pulsenumA6);
tBDsA6 = sum(BDsA6);
[tA6, tsA6] = BDRcalc(tpulsA6,tBDsA6) ;
errorbar(6.5,tA6,tsA6,'.','Color',[0.2 0.6 0.2],'MarkerSize',20); 
hold on
% unloaded 43MW
tpulsU43 = sum(pulsenumU43);
tBDsU43 = sum(BDsU43);
[tU43, tsU43] = BDRcalc(tpulsU43,tBDsU43) ;
errorbar(43.3,tU43,tsU43,'. b','MarkerSize',20); 
hold on
% unloaded 41MW
tpulsU41 = sum(pulsenumU41);
tBDsU41 = sum(BDsU41);
[tU41, tsU41] = BDRcalc(tpulsU41,tBDsU41) ;
errorbar(41,tU41,tsU41,'.','Color',[0.6 0.2 0.6],'MarkerSize',20); 
hold on
% unloaded 38MW
tpulsU38 = sum(pulsenumU38);
tBDsU38 = sum(BDsU38);
[tU38, tsU38] = BDRcalc(tpulsU38,tBDsU38) ;
errorbar(38,tU38,tsU38,'.','Color',[0.2 0.2 0.6],'MarkerSize',20); 
hold off


legend({'Loaded 43.3MW','Loaded 41MW','Loaded 38MW',...
        'Antiloaded 6.5MW',...
        'Unloaded 43.3MW','Unloaded 41MW','Unloaded 38MW','UnLoaded 35MW'})
title('Measured BDR')
xlabel('Input power (MW)')
ylabel('BDR [1/pulse]')
ax = gca;
ax.FontSize = 14;
ax.YGrid = 'on';
ax.YScale = 'log';