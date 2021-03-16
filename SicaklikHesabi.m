function varargout = SicaklikHesabi(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SicaklikHesabi_OpeningFcn, ...
                   'gui_OutputFcn',  @SicaklikHesabi_OutputFcn, ...
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

function SicaklikHesabi_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = SicaklikHesabi_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
imageArray=imread('8.3.png');
imshow(imageArray, 'Parent', handles.axes1);



function cordinateX_Callback(hObject, eventdata, handles)

function cordinateX_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function cordinateY_Callback(hObject, eventdata, handles)

function cordinateY_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function result_Callback(hObject, eventdata, handles)

function result_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate_Callback(hObject, eventdata, handles)

% Bilinear interpolation uyguladým. Text book'dan yardým aldým.
% f1=f(x1,y1)
% f2=f(x2,y1)
% f3=f(x1,y2)
% f4=f(x2,y2)
% Kullanýcý hangi noktanýn sýcaklýðýný görmek istiyorsa onu kullanýcýdan
% aldým.
x=str2double(get(handles.cordinateX,'string'));
y=str2double(get(handles.cordinateY,'string'));
% Plaka üzerinde ölçülen belli noktalarý T matrisi ile oluþturdum.
T=[ 100 90 80 70 60;
    85 64.49 53.5 48.15 50;
    70 48.9 38.43 35.03 40;
    55 38.78 30.39 27.07 30;
    40 35 30 25 20];
% Bilinear interpolasyona göre kullanýcý tarafýndan seçilen noktanýn hangi
% konumda olduðunu bulabilmek amacýyla aþaðýdaki gibi if elseif yapýsýný
% oluþturdum. For döngüsü içerisinde de yapýlabilirdi. Fakat koþullarý
% oluþtururken problem yaþadým. Bu nedenle biraz uzun oldu. 
if((0<=x)&&(x<2)&&(0<=y)&&(y<2))
    x1=0; y1=0;
    x2=2; y2=2;
    f1=T(1,1);
    f2=T(1,2);
    f3=T(2,1);
    f4=T(2,2);
elseif((0<=x)&&(x<2)&&(2<=y)&&(y<4))
    x1=0; y1=2;
    x2=2; y2=4;
    f1=T(2,1);
    f2=T(2,2);
    f3=T(3,1);
    f4=T(3,2);
elseif((0<=x)&&(x<2)&&(4<=y)&&(y<6))
    x1=0; y1=4;
    x2=2; y2=6;
    f1=T(3,1);
    f2=T(3,2);
    f3=T(4,1);
    f4=T(4,2);
elseif((0<=x)&&(x<2)&&(6<=y)&&(y<8))
    x1=0; y1=6;
    x2=2; y2=8;
    f1=T(4,1);
    f2=T(4,2);
    f3=T(5,1);
    f4=T(5,2);
    
elseif((2<=x)&&(x<4)&&(0<=y)&&(y<2))
    x1=2; y1=0;
    x2=4; y2=2;
    f1=T(1,2);
    f2=T(1,3);
    f3=T(2,2);
    f4=T(2,3);
elseif((2<=x)&&(x<4)&&(2<=y)&&(y<4))
    x1=2; y1=2;
    x2=4; y2=4;
    f1=T(2,2);
    f2=T(2,3);
    f3=T(3,2);
    f4=T(3,3);
elseif((2<=x)&&(x<4)&&(4<=y)&&(y<6))
    x1=2; y1=4;
    x2=4; y2=6;
    f1=T(3,2);
    f2=T(3,3);
    f3=T(4,2);
    f4=T(4,3);
elseif((2<=x)&&(x<4)&&(6<=y)&&(y<8))
    x1=2; y1=6;
    x2=4; y2=8;
    f1=T(4,2);
    f2=T(4,3);
    f3=T(5,2);
    f4=T(5,3);
    
elseif((4<=x)&&(x<6)&&(0<=y)&&(y<2))
    x1=4; y1=0;
    x2=6; y2=2;
    f1=T(1,3);
    f2=T(1,4);
    f3=T(2,3);
    f4=T(2,4);
elseif((4<=x)&&(x<6)&&(2<=y)&&(y<4))
    x1=4; y1=2;
    x2=6; y2=4;
    f1=T(2,3);
    f2=T(2,4);
    f3=T(3,3);
    f4=T(3,4);
elseif((4<=x)&&(x<6)&&(4<=y)&&(y<6))
    x1=4; y1=4;
    x2=6; y2=6;
    f1=T(3,3);
    f2=T(3,4);
    f3=T(4,3);
    f4=T(4,4);
elseif((4<=x)&&(x<6)&&(6<=y)&&(y<8))
    x1=4; y1=6;
    x2=6; y2=8;
    f1=T(4,3);
    f2=T(4,4);
    f3=T(5,3);
    f4=T(5,4);
    
elseif((6<=x)&&(x<8)&&(0<=y)&&(y<2))
    x1=6; y1=0;
    x2=8; y2=2;
    f1=T(1,4);
    f2=T(1,5);
    f3=T(2,4);
    f4=T(2,5);
elseif((6<=x)&&(x<8)&&(2<=y)&&(y<4))
    x1=6; y1=2;
    x2=8; y2=4;
    f1=T(2,4);
    f2=T(2,5);
    f3=T(3,4);
    f4=T(3,5);
elseif((6<=x)&&(x<8)&&(4<=y)&&(y<6))
    x1=6; y1=4;
    x2=8; y2=6;
    f1=T(3,4);
    f2=T(3,5);
    f3=T(4,4);
    f4=T(4,5);
elseif((6<=x)&&(x<=8)&&(6<=y)&&(y<=8))
    x1=6; y1=6;
    x2=8; y2=8;
    f1=T(4,4);
    f2=T(4,5);
    f3=T(5,4);
    f4=T(5,5);
else
    f=msgbox('Aralýk dýþýnda deðer girilmiþtir!!! Lütfen 0-8 aralýðýnda deðer giriniz.');
end

result=bilinear(x,y,x1,x2,y1,y2,f1,f2,f3,f4);

set(handles.result,'string',result);
