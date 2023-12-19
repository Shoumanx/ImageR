function varargout = imPUsingGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imPUsingGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @imPUsingGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


function imPUsingGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = imPUsingGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



%function anticlockwise_Callback(hObject, eventdata, handles)

%a=getappdata(0,'a');
%aclock=a;
%aclock=imrotate(aclock,90);

%figure;

%subplot(1,2,1);
%imshow(a);
%title('Original Image');

%subplot(1,2,2);
%imshow(aclock);
%title('Rotated Image');




% --- Executes on button press in hist.
function hist_Callback(hObject, eventdata, handles)
% hObject    handle to hist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
ahist=a;
ahist=rgb2gray(ahist);
axes(handles.axes1);
imhist(ahist);

% --- Executes on button press in complement.
function complement_Callback(hObject, eventdata, handles)
% hObject    handle to complement (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
acomp=a;
acomp=imcomplement(acomp);
axes(handles.axes1);
imshow(acomp);

% --- Executes on button press in edge.
function edge_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
aedge=a;
aedge=rgb2gray(aedge);
aedge=edge(aedge,'Canny')'
axes(handles.axes1);
imshow(aedge);

function uploadimage_Callback(hObject, eventdata, handles)

a=uigetfile('.jpg')
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)

% --- Executes on button press in rgb2gray.
function rgb2gray_Callback(hObject, eventdata, handles)
% hObject    handle to rgb2gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
agray=rgb2gray(a);

% Create a new figure and set its size
figure('Position', [100 100 1000 500]);

% Display the original image in subplot 1
subplot(1,2,1);
imshow(a);
title('Original Image');

% Display the grayscale image in subplot 2
subplot(1,2,2);
imshow(agray);
title('Grayscale Image');

function reset_Callback(hObject, eventdata, handles)

a=getappdata(0,'a');
axes(handles.axes1);
imshow(a);

% --- Executes on button press in binary.
function binary_Callback(hObject, eventdata, handles)
% hObject    handle to binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
abw=im2bw(a);

% Create a new figure and set its size
figure('Position', [100 100 1000 500]);

% Display the original image in subplot 1
subplot(1,2,1);
imshow(a);
title('Original Image');

% Display the binary image in subplot 2
subplot(1,2,2);
imshow(abw);
title('Binary Image');

% --- Executes on button press in increase_brightness.
function increase_brightness_Callback(hObject, eventdata, handles)
% hObject    handle to increase_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
brightness_value=50%str2double(get(handles.brightness_value,'String'));
brighter_a=a+brightness_value;

% Create a new figure and set its size
figure('Position', [100 100 1000 500]);

% Display the original image in subplot 1
subplot(1,2,1);
imshow(a);
title('Original Image');

% Display the brighter image in subplot 2
subplot(1,2,2);
imshow(brighter_a);
title('Brighter Image');


% --- Executes on button press in decrease_brightness.
function decrease_brightness_Callback(hObject, eventdata, handles)
% hObject    handle to decrease_brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
brightness_value=50%str2double(get(handles.brightness_value,'String'));
darker_a=a-brightness_value;

% Create a new figure and set its size
figure('Position', [100 100 1000 500]);

% Display the original image in subplot 1
subplot(1,2,1);
imshow(a);
title('Original Image');

% Display the darker image in subplot 2
subplot(1,2,2);
imshow(darker_a);
title('Darker Image');
