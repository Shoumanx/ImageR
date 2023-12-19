% Global variables to store the image and its handle
global img;
global imgHandle;

% Create a figure window
f = figure('Position', [100, 100, 500, 400]);

% Upload Image button
uicontrol('Style', 'pushbutton', 'String', 'Upload Image',...
    'Position', [50, 300, 150, 50],...
    'Callback', 'uploadImage');

% RGB to Gray button
uicontrol('Style', 'pushbutton', 'String', 'RGB to Gray',...
    'Position', [50, 240, 150, 50],...
    'Callback', 'rgbToGray');

function uploadImage()
    global img;
    global imgHandle;
    
    [file,path] = uigetfile('*.*');
    
    if isequal(file,0)
        disp('User selected Cancel');
        return;
    end
    
    fullPath = fullfile(path,file);
    
    % Read and display image
    img = imread(fullPath);
    
     if isvalid(imgHandle)
         delete(imgHandle);
     end
     
     imgHandle = imshow(img,'Parent',axes('Position',[0.4,0.3,.5,.5]));
end

function rgbToGray()
   global img;
   global imgHandle;

   if isempty(img)
       msgbox('Please upload an image first.');
       return;
   end
   
   % Convert RGB to grayscale
   grayImg = rgb2gray(img);
   
   % Update displayed image
   set(imgHandle,'CData',grayImg);
end
