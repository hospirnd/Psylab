% a GUI for the recording answers of the test subject in AFC tasks 
%
% Usage: mpsy_afc_gui
%
% Copyright (C) 2006   Martin Hansen  
% Author :  Martin Hansen,  <psylab AT jade-hs.de>
% Date   :  6 Jan 2006
% Updated:  < 1 Dez 2016 15:17, martin>
% Updated:  < 6 Jan 2006 21:11, mh>

%% This file is part of PSYLAB, a collection of scripts for
%% designing and controlling interactive psychoacoustical listening
%% experiments.  
%% This file is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published
%% by the Free Software Foundation; either version 2 of the License, 
%% or (at your option) any later version.  See the GNU General
%% Public License for more details:  http://www.gnu.org/licenses/gpl
%% This file is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


%% ===== the GUI for querying the user answer =====
%% The contents of the 'Tag'-property is a RESERVED WORD, DO NOT CHANGE!
psylab_gui = figure('Color', 0.1*round(10*rand(1,3)), ...
	'Position',[200 150 650 450], ...
	'Tag','psylab_answer_gui', ...
	'Name', ['afc_answer_gui  *  psylab version ' mpsy_version ], ...
	'NumberTitle','off', ...
	'Toolbar','None', ...
	'Menubar','None');


% Allow for user-input via keyboard presses as an alternative for
% button-clicks.  The answer is calculated from the "CurrentCharacter" and
% transformed into its number representation in M.UA ("user answer")
set(psylab_gui, 'KeyPressFcn', 'M.UA=double(get(gcf, ''CurrentCharacter''))-double(''0''); guidata(psylab_gui, M.UA);');

% allow for smooth stop of psylab run when deleting the AFC figure:
set(psylab_gui, 'DeleteFcn', 'M.UA = 9; M.QUIT = 1;');


% a text field, e.g. for giving feeback to the user. 
%% The contents of the 'Tag'-property is a RESERVED WORD, DO NOT CHANGE!
afc_fb = uicontrol('Parent', psylab_gui, ...
         'Unit','normalized', 'Position',[0.1 0.02 0.8 0.12], ...
         'Tag','psylab_feedback', ...
         'Style','text', ...
         'String','', ...
	 'FontSize', 14, 'ForegroundColor', 'red');

% a text field, e.g. for providing information to the user. 
%% The contents of the 'Tag'-property is a RESERVED WORD, DO NOT CHANGE!
afc_info = uicontrol('Parent', psylab_gui, ...
         'Unit','normalized', 'Position',[0.1 0.17 0.8 0.25], ...
         'Tag','psylab_info', ...
         'Style','text', ...
         'String', sprintf('user answer possible via keyboard press \n(while focus is on figure background)'), ...
	 'FontSize', 14, 'ForegroundColor', [0.4 0 0.2]);





%%% ============================================================
%%%  information about licenses, distribution, non-warranty
%%% ============================================================


psylab_about = uimenu('Parent', psylab_gui, ...
       'Label', 'About PSYLAB');
psylab_version = uimenu('Parent', psylab_about, ...
       'Label', 'PSYLAB Version', ...
       'Callback', 'mpsy_version;');
psylab_author = uimenu('Parent', psylab_about, ...
       'Label', 'View PSYLAB ABOUT in command window', ...
       'Callback', 'type PSYLAB-ABOUT');
psylab_distribution = uimenu('Parent', psylab_about, ...
       'Label', 'View PSYLAB DISTRIBUTION information in command window', ...
       'Callback', 'type DISTRIBUTION;');
psylab_nowarranty  = uimenu('Parent', psylab_about, ...
       'Label', 'View PSYLAB NON-WARRANTY in command window', ...
       'Callback', 'type NO-WARRANTY;');
psylab_license0 = uimenu('Parent', psylab_about, ...
       'Label', 'View LICENSES');
psylab_license  = uimenu('Parent', psylab_license0, ...
       'Label', 'View PSYLAB LICENSE', ...
       'Callback', 'type PSYLAB-LICENSE;');
psylab_gpl  = uimenu('Parent', psylab_license0, ...
       'Label', 'View GNU GENERAL PUBLIC LICENSE in command window', ...
       'Callback', 'type GNU-GPL;');
psylab_webpage = uimenu('Parent', psylab_about, 'label', 'Get psylab here:  www.hoertechnik-audiologie.de/psylab');


psylab_quitmenu = uimenu('Parent', psylab_gui, ...
       'Label', 'Quit');
psylab_quitrun = uimenu('Parent', psylab_quitmenu, ...
       'Label', 'quit only this run (8)', ...
       'Callback', 'M.UA=8; guidata(psylab_gui, M.UA);');
psylab_quitexp = uimenu('Parent', psylab_quitmenu, ...
       'Label', 'quit experiment (9)', ...
       'Callback', 'M.UA=9;guidata(psylab_gui, M.UA); ');


% End of file:  mpsy_afc_gui.m

% Local Variables:
% time-stamp-pattern: "40/Updated:  <%2d %3b %:y %02H:%02M, %u>"
% End:
