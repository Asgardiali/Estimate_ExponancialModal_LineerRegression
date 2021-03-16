function varargout = paslanmazCelikTipi(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @paslanmazCelikTipi_OpeningFcn, ...
                   'gui_OutputFcn',  @paslanmazCelikTipi_OutputFcn, ...
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

function paslanmazCelikTipi_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = paslanmazCelikTipi_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
imageArray=imread('8.2.png');
imshow(imageArray, 'Parent', handles.axes1);

function press_Callback(hObject, eventdata, handles)

function press_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function time_Callback(hObject, eventdata, handles)

function time_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate_Callback(hObject, eventdata, handles)
cla(handles.axes2);

press=str2double(get(handles.press,'string'));
x=[5 10 15 20 25 30 35 40];
y=[40 30 25 40 18 20 22 15];

for i=1:8
    plot(handles.axes2,x(i),y(i),'*')
    xlim([0 50]);
    ylim([0 50]);
    hold on;
end

c=LagrangeCoef(x,y);
p=LagrangeEval(press,x,c);
plot(handles.axes2,press,p,'o')
hold on;
datacursormode on;
set(handles.time,'string',p);