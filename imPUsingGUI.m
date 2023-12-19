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

% Store the handle of the editable text box in the handles structure
    handles.editBox = findobj('Tag', 'setBrightness');
    set(handles.editBox, 'Callback', 'editBox_Callback');
    guidata(hObject, handles);

    handles.output = hObject;

    
% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = imPUsingGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function editBox_Callback(hObject, ~, handles)
    global myValue;
    myValue = str2double(get(hObject, 'String'));
    disp(['Value updated to: ', num2str(myValue)]);
    
    
    
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

% Create a new figure and set its size
figure('Position', [20 100 1500 500]);

% Display the original image in subplot 1
subplot(1,3,1);
imshow(a);
title('Original Image');

% Display the GrayScale image in subplot 1
subplot(1,3,2);
imshow(ahist);
title('Grayscale Image');

% Display the histogram in subplot 2
subplot(1,3,3);
imhist(ahist);
title('Histogram');



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
    % Get the image data
    a = getappdata(0,'a');
    
    %{
    % Convert the image to grayscale if it is not already
    if size(a, 3) == 3
        a = rgb2gray(a);
    end
    
    % Apply the Sobel filter
    aedge = edge(a, 'Sobel');
    %}
    sobel_x = [-1 0 1; -2 0 2; -1 0 1];
    sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
    
    a = rgb2gray(a);
    aedge = imfilter(a, sobel_x);
    aedge = imfilter(aedge, sobel_y);
    % Display the result
    axes(handles.axes1);
    %imshow(aedge);
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the edge detected image in subplot 2
    subplot(1,2,2);
    imshow(aedge);
    title('Edge Detected Image (Sobel_X adn Sobel_Y)');

    
function sobelX_edge_Callback(hObject, eventdata, handles)
    
    a = getappdata(0,'a');
    sobel_x = [-1 0 1; -2 0 2; -1 0 1];    
    a = rgb2gray(a);
    aedge = imfilter(a, sobel_x);
    % Display the result
    axes(handles.axes1);
    %imshow(aedge);
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the edge detected image in subplot 2
    subplot(1,2,2);
    imshow(aedge);
    title('Edge Detected Image (Sobel_X)');
    
    
function sobelY_edge_Callback(hObject, eventdata, handles)
    
    a = getappdata(0,'a');
    sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
    a = rgb2gray(a);
    aedge = imfilter(a, sobel_y);
    % Display the result
    axes(handles.axes1);
    %imshow(aedge);
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the edge detected image in subplot 2
    subplot(1,2,2);
    imshow(aedge);
    title('Edge Detected Image (Sobel_Y)');
    
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

global myValue;
brightness_value = myValue;
% disp(brightness_value);
a = rgb2gray(a);
brighter_a = a+brightness_value;

% Create a new figure and set its size
figure('Position', [100 100 1000 500]);

% Display the original image in subplot 1
subplot(1,2,1);
imshow(a);
title('Grayscale Image');

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
global myValue;
brightness_value = myValue;
a = rgb2gray(a);
darker_a = a-brightness_value;

% Create a new figure and set its size
figure('Position', [100 100 1000 500]);

% Display the original image in subplot 1
subplot(1,2,1);
imshow(a);
title('Grayscale Image');

% Display the darker image in subplot 2
subplot(1,2,2);
imshow(darker_a);
title('Darker Image');





% --- Executes on button press in pushbutton13.
function firstLablacian_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    a = getappdata(0,'a');
    laplacianMatrix = [0 -1 0; -1 4 -1; 0 -1 0];
    a = rgb2gray(a);
    aedge = imfilter(a, laplacianMatrix);
    % Display the result
    axes(handles.axes1);
    %imshow(aedge);
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the edge detected image in subplot 2
    subplot(1,2,2);
    imshow(aedge);
    title('Edge Detected Image (Sobel_Y)');

    
    
    % --- Executes on button press in pushbutton13.
function secondLablacian_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    a = getappdata(0,'a');
    laplacianMatrix = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    a = rgb2gray(a);
    aedge = imfilter(a, laplacianMatrix);
    % Display the result
    axes(handles.axes1);
    %imshow(aedge);
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the edge detected image in subplot 2
    subplot(1,2,2);
    imshow(aedge);
    title('Edge Detected Image (Sobel_Y)');


function minFilter_Callback(hObject, eventdata, handles)

    % Get the image data
    a = getappdata(0,'a');
    
    a = rgb2gray(a);
    min_filter = @(x) min(x(:));
    a_min = nlfilter(a, [3 3], min_filter);
    % Display the result
    axes(handles.axes1);
    
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the filtered image in subplot 2
    subplot(1,2,2);
    imshow(a_min, []);
    title('Minimum Filtered Image');
    
    
    
function maxFilter_Callback(hObject, eventdata, handles)
    % Get the image data
    a = getappdata(0,'a');
    
    % Convert the image to grayscale if it is not already
    a = rgb2gray(a);
    
    
    % Define the function for the maximum filter
    max_filter = @(x) max(x(:));
    
    % Apply the maximum filter
    a_max = nlfilter(a, [3 3], max_filter);
    
    % Display the result
    axes(handles.axes1);
    
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the filtered image in subplot 2
    subplot(1,2,2);
    imshow(a_max, []);
    title('Maximum Filtered Image');

    
function medianFilter_Callback(hObject, eventdata, handles)
    % Get the image data
    a = getappdata(0,'a');
    
    % Convert the image to grayscale if it is not already
    a = rgb2gray(a);
    
    % Define the neighborhood size for the median filter
    neighborhood = [3 3];
    
    % Apply the median filter
    a_median = medfilt2(a, neighborhood);
    
    % Display the result
    axes(handles.axes1);
    
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the filtered image in subplot 2
    subplot(1,2,2);
    imshow(a_median, []);
    title('Median Filtered Image');

    
 function averageFilter_Callback(hObject, eventdata, handles)
    % Get the image data
    a = getappdata(0,'a');
    
    % Convert the image to grayscale if it is not already
    
    a = rgb2gray(a);
    
    
    % Define the average filter kernel
    averageMatrix = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
    
    % Apply the average filter
    a_average = imfilter(a, averageMatrix);
    % Display the result
    axes(handles.axes1);
    
    % Create a new figure and set its size
    figure('Position', [100 100 1000 500]);
    
    % Display the original image in subplot 1
    subplot(1,2,1);
    imshow(a);
    title('Grayscale Image');
    
    % Display the filtered image in subplot 2
    subplot(1,2,2);
    imshow(a_average, []);
    title('Average Filtered Image');
 
