figure('rend','painters','pos',[135 10 1000 650])
M = Model();
%% title
title = uicontrol('Style','text',...
                  'Position', [250, 580, 500, 60],...
                  'String', 'Handover Simulator',...
                  'FontSize', 50);
              
%% team
names = uicontrol('Style','text',...
                  'Position', [250, 515, 500, 60],...
                  'String', 'Team 06 :  Jason Kuo  Ben Tsia  Kevin Hsu',...
                  'FontSize', 18);

%% Render
render_btn = uicontrol('Style', 'pushbutton',...
                       'String', 'Render',...
                       'Position', [400 460 120 70],...
                       'FontSize', 20,...
                       'Callback', 'M.initialize()');  
                   
%% RUN
run_btn = uicontrol('Style', 'pushbutton',...
                    'String', 'RUN',...
                    'Position', [540 460 120 70],...
                    'FontSize', 20,...
                    'Callback', 'M.start()');  
                   
%% PAUSE
pause_btn = uicontrol('Style', 'pushbutton',...
                      'String', 'PAUSE',...
                      'Position', [680 460 120 70],...
                      'FontSize', 20,...
                      'Callback', 'M.pause()'); 
                   
%% STOP
stop_btn = uicontrol('Style', 'pushbutton',...
                     'String', 'STOP',...
                     'Position', [820 460 120 70],...
                     'FontSize', 20,...
                     'Callback', 'M.stop()');
              
%% Simulation Time Left
time_left_txt = uicontrol('Style','text', ...
                          'Position',[400 420 130 22],...
                          'String', 'Time Remaining: ',...
                          'FontSize', 16);

%time_left_value = uicontrol('Style','text', ...
%                            'Position',[560 420 100 22],...
%                            'String', int2str(M.simulation_time_left),...
%                            'FontSize', 16); 
   
%% Handover Counter
counter_txt = uicontrol('Style','text', ...
                        'Position',[590 420 125 22],...
                        'String', 'Handover Count: ',...
                        'FontSize', 16);

%counter_value = uicontrol('Style','text', ...
%                          'Position',[834 420 100 22],...
%                          'String', int2str(M.count_handover),...
%                          'FontSize', 16); 

%% Disconnetion Count
counter_txt = uicontrol('Style','text', ...
                        'Position',[770 420 125 22],...
                        'String', 'Disconnection: ',...
                        'FontSize', 16);

%% Up/Down Link
link_txt = uicontrol('Style','text', ...
                     'Position',[20 500 120 22],...
                     'String','Up/Down Link',...
                     'FontSize', 16);

link_popup = uicontrol('Style', 'popup',...
                       'String', {'Up Link','Down Link'},...
                       'Position', [150 500 230 25],...
                       'FontSize', 16, ...
                       'Callback', 'M.setLink(link_popup.Value)');               
              
%% handover policy
handover_policy_txt = uicontrol('Style','text', ...
                                'Position',[20 460 120 22],...
                                'String','Handover Policy',...
                                'FontSize', 16);

handover_policy_popup = uicontrol('Style', 'popup',...
                                  'String', {'Eager','Lazy','Eager Threshold','Relative Threshold'},...
                                  'Position', [150 460 230 25],...
                                  'FontSize', 16, ...
                                  'Callback', 'M.setHandoverPolicy(handover_policy_popup.Value)'); 

%% Path-Loss Model
path_loss_txt = uicontrol('Style','text', ...
                          'Position',[20 420 124 22],...
                          'String','Path-Loss Model',...
                          'FontSize', 16);
                   
path_loss_popup = uicontrol('Style', 'popup',...
                            'String', {'Smooth Transition','Two Ray Ground','COST 231'},...
                            'Position', [150 420 230 25],...
                            'FontSize', 16, ...
                            'Callback', 'M.setPathLossModel(path_loss_popup.Value)');

%% Apply Fading or Not
fading_txt = uicontrol('Style','text', ...
                       'Position',[20 380 124 22],...
                       'String','Apply Fading',...
                       'FontSize', 16);
                   
fading_popup = uicontrol('Style', 'popup',...
                         'String', {'No','Yes'},...
                         'Position', [150 380 230 25],...
                         'FontSize', 16, ...
                         'Callback', 'M.applyFading(fading_popup.Value)');                        
                        
%% Fading S
fading_s_txt = uicontrol('Style','text', ...
                        'Position',[20 340 120 22],...
                        'String','Fading S',...
                        'FontSize', 16);
                 
fading_s_sld = uicontrol('Style', 'slider',...
                         'Min',0,'Max',15,'Value',M.s_fading,...
                         'Position', [156 335 108 20],...
                         'SliderStep', [1/15 1/15],...
                         'Callback', 'M.setFadingS(round(fading_s_sld.Value)); set(fading_s_val, ''String'', round(fading_s_sld.Value))'); 

fading_s_val = uicontrol('Style','text', ...
                         'Position',[290 340 50 22],...
                         'String', int2str(M.s_fading),...
                         'FontSize', 16);                 
                 
%% Fading Deviation (sigma)
fading_dev_txt = uicontrol('Style','text', ...
                           'Position',[20 300 120 22],...
                           'String','Fading Sigma',...
                           'FontSize', 16);

fading_dev_sld = uicontrol('Style', 'slider',...
                           'Min',0,'Max',10,'Value',M.sigma_fading,...
                           'Position', [156 295 108 20],...
                           'SliderStep', [1/10 1/10],...
                           'Callback', 'M.setFadingDeviation(round(fading_dev_sld.Value)); set(fading_dev_val,''String'',round(fading_dev_sld.Value))');
                      
fading_dev_val = uicontrol('Style','text', ...
                           'Position',[290 300 50 22],...
                           'String',int2str(M.sigma_fading),...
                           'FontSize', 16);     
                      
%% Shadowing Deviation          
shadowing_dev_txt = uicontrol('Style','text', ...
                              'Position',[18 260 120 22],...
                              'String','Shadow Sigma',...
                              'FontSize', 16);
                        
shadowing_dev_sld = uicontrol('Style', 'slider',...
                              'Min',0,'Max',10,'Value',M.sigma_shadowing,...
                              'Position', [156 255 108 20],...
                              'SliderStep', [1/10 1/10],...
                              'Callback', 'M.setShadowingDeviation(round(shadowing_dev_sld.Value)); set(shadowing_dev_val,''String'',round(shadowing_dev_sld.Value))');
                         
shadowing_dev_val = uicontrol('Style','text', ...
                              'Position',[290 260 50 22],...
                              'String',int2str(M.sigma_shadowing),...
                              'FontSize', 16);                       
                        
%% Measure Interval
Measure_Interval_txt = uicontrol('Style','text', ...
                                 'Position',[10 220 140 22],...
                                 'String','Measuring Interval',...
                                 'FontSize', 16);

Measure_Interval_sld = uicontrol('Style', 'slider',...
                                 'Min',1,'Max',10,'Value',M.measureInterval,...
                                 'Position', [156 215 108 20],...
                                 'SliderStep', [1/9 1/9],...
                                 'Callback', 'M.setMeasureInterval(round(Measure_Interval_sld.Value)); set(Measure_Interval_val,''String'',round(Measure_Interval_sld.Value))');   
                     
Measure_Interval_val = uicontrol('Style','text', ...
                                 'Position',[290 220 50 22],...
                                 'String',int2str(M.measureInterval),...
                                 'FontSize', 16);                     

%% Mobility Speed
MS_speed_txt = uicontrol('Style','text', ...
                         'Position',[20 180 120 22],...
                         'String','MS Speed Mean',...
                         'FontSize', 16);
                   
MS_speed_sld = uicontrol('Style', 'slider',...
                         'Min',1,'Max',10,'Value',M.speed,...
                         'Position', [156 175 108 20],...
                         'SliderStep', [1/9 1/9],...
                         'Callback', 'M.setMobilitySpeedMean(round(MS_speed_sld.Value)); set(MS_speed_val,''String'',round(MS_speed_sld.Value))');                     

MS_speed_val = uicontrol('Style','text', ...
                         'Position',[290 180 50 22],...
                         'String',int2str(M.speed),...
                         'FontSize', 16);                     
                     
%% MS number
MS_num_txt = uicontrol('Style','text', ...
                       'Position',[20 140 120 22],...
                       'String','MS number',...
                       'FontSize', 16);
                   
MS_num_sld = uicontrol('Style', 'slider',...
                       'Min',1,'Max',1000,'Value',M.num_MD,...
                       'Position', [156 135 108 20],...
                       'SliderStep', [1/999 1/999],...
                       'Callback', 'M.setNumMD(round(MS_num_sld.Value)); set(MS_num_val,''String'', round(MS_num_sld.Value))'); 
                   
MS_num_val = uicontrol('Style','text', ...
                       'Position',[290 140 50 22],...
                       'String',int2str(M.num_MD),...
                       'FontSize', 16);
                   
%% Simulation Time
time_txt = uicontrol('Style','text', ...
                     'Position',[20 100 120 22],...
                     'String','Simulation Time',...
                     'FontSize', 16);
                 
time_sld = uicontrol('Style', 'slider',...
                     'Min',100,'Max',2000,'Value',M.simulation_time,...
                     'Position', [156 95 108 20],...
                     'SliderStep', [1/1900 1/1900],...
                     'Callback', 'M.setSimulationTime(round(time_sld.Value)); set(time_val, ''String'', round(time_sld.Value))'); 

time_val = uicontrol('Style','text', ...
                     'Position',[290 100 50 22],...
                     'String', int2str(M.simulation_time),...
                     'FontSize', 16);   
                   
%% Bandwidth
bandwidth_txt = uicontrol('Style','text', ...
                          'Position',[20 60 120 22],...
                          'String','Bandwidth',...
                          'FontSize', 16);

bandwidth_sld = uicontrol('Style', 'slider',...
                          'Min',1,'Max',50,'Value',M.bandwidth/10^6,...
                          'Position', [156 55 108 20],...
                          'SliderStep', [1/49 1/49],...
                          'Callback', 'M.setBandwidth(round(bandwidth_sld.Value)); set(bandwidth_val,''String'',round(bandwidth_sld.Value))');
                      
bandwidth_val = uicontrol('Style','text', ...
                          'Position',[290 60 50 22],...
                          'String',int2str(M.bandwidth/10^6),...
                          'FontSize', 16);                         
                      
%% Temperature                      
temperature_txt = uicontrol('Style','text', ...
                            'Position',[20 20 120 22],...
                            'String','Temperature',...
                            'FontSize', 16);
                        
temperature_sld = uicontrol('Style', 'slider',...
                            'Min',0,'Max',100,'Value',M.temperature-273.15,...
                            'Position', [156 15 108 20],...
                            'SliderStep', [1/100 1/100],...
                            'Callback', 'M.setTemperature(round(temperature_sld.Value)); set(temperature_val,''String'',round(temperature_sld.Value))');
                         
temperature_val = uicontrol('Style','text', ...
                            'Position',[290 20 50 22],...
                            'String',int2str(M.temperature-273.15),...
                            'FontSize', 16); 