function varargout = AndradeEqu(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AndradeEqu_OpeningFcn, ...
                   'gui_OutputFcn',  @AndradeEqu_OutputFcn, ...
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

function AndradeEqu_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = AndradeEqu_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
image1Array=imread('8.1.1.png');
image2Array=imread('8.1.2.png');
imshow(image1Array, 'Parent', handles.axes1);
imshow(image2Array, 'Parent', handles.axes2);

function b_Callback(hObject, eventdata, handles)

function b_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function d_Callback(hObject, eventdata, handles)

function d_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate_Callback(hObject, eventdata, handles)

% Denklem çözümü için aþaðýdaki ayrýþtýrma yaptým.
% ln(u)=ln(D)+B*(1/Ta)
% Ta=T(Celcius)+273.15
% y=ln(u)
% a0=ln(D) D=e^a0
% a1=B
% x=1/Ta?y=a0+a1(x)
% 
% n-> Deðer sayýsý
% a1=(n*(xi*yi))-(xi)*(yi)/(n*xi^2-(xi)^2)
% a0=y-a1*x
% Aþaðýdaki kodu direkt bu fonksiyonu çalýþtýrmak için yaptým. For
% döngüsünün 1'den 6'ya kadar olmasýnýn nedeni ise 6 adet veri
% verilmesidir. Daha fazla verilmiþ olsaydý ona göre 6 sayýsý deðiþecekti.
% Bu sayýnýn kullanýcý tarafýndan girilmesi istenmediði için sadece
% probleme yönelik bir çözüm sunulmuþtur.

T=[0 5 10 20 30 40];
Ta=[273.15 278.15 283.15 293.15 303.15 313.15];
u=[1.787 1.519 1.307 1.002 0.7975 0.6529];

xtop=0;
ytop=0;
ztop=0;
ttop=0;

for i=1:6
    x(i)=1/Ta(i);
    y(i)=log(u(i));
    z(i)=x(i)*y(i);
    t(i)=x(i)*x(i);
    xtop=xtop+x(i);
    ytop=ytop+y(i);
    ztop=ztop+z(i);
    ttop=ttop+t(i);
end
%B=a1
a1=((6*(ztop))-(xtop*ytop))/((6*(ttop))-((xtop)^2));
B=a1;
%D=e^a0
a0=(ytop/6)-(a1*(xtop/6));
D=exp(a0);

set(handles.b,'string',B);
set(handles.d,'string',D);
