function varargout = AnaSayfa(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AnaSayfa_OpeningFcn, ...
                   'gui_OutputFcn',  @AnaSayfa_OutputFcn, ...
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

function AnaSayfa_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = AnaSayfa_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function Hw8_1_Callback(hObject, eventdata, handles)
AndradeEqu;

function Hw8_2_Callback(hObject, eventdata, handles)
paslanmazCelikTipi;

function Hw8_3_Callback(hObject, eventdata, handles)
SicaklikHesabi;

function Hw8_4_Callback(hObject, eventdata, handles)
nufusTahmini;
