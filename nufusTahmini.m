function varargout = nufusTahmini(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @nufusTahmini_OpeningFcn, ...
                   'gui_OutputFcn',  @nufusTahmini_OutputFcn, ...
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

function nufusTahmini_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = nufusTahmini_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
image1Array=imread('8.4.1.png');
image2Array=imread('8.4.2.png');
imshow(image1Array, 'Parent', handles.axes1);
imshow(image2Array, 'Parent', handles.axes2);



function resultA_Callback(hObject, eventdata, handles)

function resultA_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function resultB_Callback(hObject, eventdata, handles)

function resultB_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function year_Callback(hObject, eventdata, handles)

function year_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate_Callback(hObject, eventdata, handles)
x=[0 5 10 15 20];
y=[100 200 450 900 2000];
s=LogLinearLS(x,y);
set(handles.resultA,'string',s(1));
set(handles.resultB,'string',s(2));

function calculateEstimation_Callback(hObject, eventdata, handles)
xk=str2double(get(handles.year,'string'));
x=[0 5 10 15 20];
y=[100 200 450 900 2000];
s=LogLinearLS(x,y);

yk=exp(s(1)*xk+s(2));

set(handles.population,'string',yk);
