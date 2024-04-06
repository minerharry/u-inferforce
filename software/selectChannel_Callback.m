function selectChannel_Callback(hObject, eventdata, handles)

% Retrieve  channels properties
%availableProps = get(handles.listbox_availableChannels, {'String','UserData','Value'});
%selectedProps = get(handles.listbox_selectedChannels, {'String','UserData'});
%
% Copyright (C) 2024, Danuser Lab - UTSouthwestern 
%
% This file is part of TFM_Package.
% 
% TFM_Package is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% TFM_Package is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with TFM_Package.  If not, see <http://www.gnu.org/licenses/>.
% 
% 

% Hillary Wong 3/25/2024: modified how availableProps and selectedProps
% are initialized because the class of the handles listboxchannels were converted to different class after migrating to appdesigner. 
%check handles.listbox_availableChannels type for tremblign correction
%process type
%selectedProps = {handles.listbox_selectedChannels.String [find(ismember(handles.listbox_availableChannels.String, handles.listbox_selectedChannels.String))]};

if (isa(handles.listbox_availableChannels,'matlab.ui.control.ListBox'))
    availableProps = {handles.listbox_availableChannels.Items' [1:numel(handles.listbox_availableChannels.Items)] [handles.listbox_availableChannels.Value]};
else
    availableProps = get(handles.listbox_availableChannels, {'String', 'UserData', 'Value'});
end

if ~isa(handles.listbox_selectedChannels,'matlab.ui.control.ListBox')
    selectedProps = get(handles.listbox_selectedChannels, {'String', 'UserData'});
else
    selectedProps = {handles.listbox_selectedChannels.String [find(ismember(handles.listbox_availableChannels.String, handles.listbox_selectedChannels.String))]};
end

% Find new elements and set them to the selected listbox
newID = availableProps{3}(~ismember(availableProps{1}(availableProps{3}),selectedProps{1}));
selectedChannels = horzcat(selectedProps{1}',availableProps{1}(newID)');
selectedData = horzcat(selectedProps{2}, availableProps{2}(newID));
set(handles.listbox_selectedChannels, 'String', selectedChannels, 'UserData', selectedData);
