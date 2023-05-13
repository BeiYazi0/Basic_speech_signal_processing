function varargout = audio_test(varargin)
% AUDIO_TEST MATLAB code for audio_test.fig
%      AUDIO_TEST, by itself, creates a new AUDIO_TEST or raises the existing
%      singleton*.
%
%      H = AUDIO_TEST returns the handle to a new AUDIO_TEST or the handle to
%      the existing singleton*.
%
%      AUDIO_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUDIO_TEST.M with the given input arguments.
%
%      AUDIO_TEST('Property','Value',...) creates a new AUDIO_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before audio_test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to audio_test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help audio_test

% Last Modified by GUIDE v2.5 16-May-2022 21:46:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @audio_test_OpeningFcn, ...
                   'gui_OutputFcn',  @audio_test_OutputFcn, ...
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


% --- Executes just before audio_test is made visible.
function audio_test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to audio_test (see VARARGIN)

% Choose default command line output for audio_test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes audio_test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = audio_test_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in audiobt.
function audiobt_Callback(hObject, eventdata, handles)
% hObject    handle to audiobt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fs=get(handles.Fs,'String');
fs=str2double(fs);
t=get(handles.Time,'String');
t=str2double(t);
filename=get(handles.audio,'String');
filename=[filename,'.wav'];
myVoice = audiorecorder(fs,8,2,0);
myVoice.StartFcn = 'disp(''Start speaking.'')';
myVoice.StopFcn = 'disp(''End of recording.'')';
recordblocking(myVoice, t);
warndlg('录制成功', '提示');
y = getaudiodata(myVoice);
audiowrite(filename,y,fs);

guidata(hObject,handles) 



function Fs_Callback(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fs as text
%        str2double(get(hObject,'String')) returns contents of Fs as a double


% --- Executes during object creation, after setting all properties.
function Fs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Time_Callback(hObject, eventdata, handles)
% hObject    handle to Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Time as text
%        str2double(get(hObject,'String')) returns contents of Time as a double


% --- Executes during object creation, after setting all properties.
function Time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in object.
function object_Callback(hObject, eventdata, handles)
% hObject    handle to object (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns object contents as cell array
%        contents{get(hObject,'Value')} returns selected item from object


% --- Executes during object creation, after setting all properties.
function object_CreateFcn(hObject, eventdata, handles)
% hObject    handle to object (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in soundbt.
function soundbt_Callback(hObject, eventdata, handles)
% hObject    handle to soundbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename=get(handles.soundfile,'String');
filename=[filename,'.wav'];
[y,Fs] = audioread(filename);
sound(y,Fs);

guidata(hObject,handles) 


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in synbt.
function synbt_Callback(hObject, eventdata, handles)
% hObject    handle to synbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename1=get(handles.syn1,'String');
filename1=[filename1,'.wav'];
filename2=get(handles.syn2,'String');
filename2=[filename2,'.wav'];
filename=get(handles.syn,'String');
filename=[filename,'.wav'];
[y1,Fs1] = audioread(filename1);
[y2,Fs2] = audioread(filename2);
if Fs1<Fs2
    y1=resample(y1,Fs2,Fs1);
elseif Fs1>Fs2
    y2=resample(y2,Fs1,Fs2);
end
len1=length(y1);
len2=length(y2);
Fs=max(Fs1,Fs2);
if len1<len2
    y=y2;
    y(1:len1,:)=y(1:len1,:)+y1;
else
    y=y1;
    y(1:len2,:)=y(1:len2,:)+y2;
end
audiowrite(filename,y,Fs);

guidata(hObject,handles) 



% --- Executes on button press in sepbt.
function sepbt_Callback(hObject, eventdata, handles)
% hObject    handle to sepbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename1=get(handles.sep1,'String');
filename1=[filename1,'.wav'];
filename2=get(handles.sep2,'String');
filename2=[filename2,'.wav'];
filename=get(handles.sep,'String');
filename=[filename,'.wav'];
lowf=get(handles.lowf,'String');
lowf=str2double(lowf);
highf=get(handles.highf,'String');
highf=str2double(highf);
[y,Fs] = audioread(filename);
if lowf>150
    lowf=150;
end
if highf<200
    highf=200;
end
y=lowpass(y,2000,Fs);
y1=lowpass(y,lowf,Fs);
y2=highpass(y,highf,Fs);
audiowrite(filename1,y1,Fs);
audiowrite(filename2,y2,Fs);

guidata(hObject,handles) 



function audio_Callback(hObject, eventdata, handles)
% hObject    handle to audio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of audio as text
%        str2double(get(hObject,'String')) returns contents of audio as a double


% --- Executes during object creation, after setting all properties.
function audio_CreateFcn(hObject, eventdata, handles)
% hObject    handle to audio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lowf_Callback(hObject, eventdata, handles)
% hObject    handle to lowf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowf as text
%        str2double(get(hObject,'String')) returns contents of lowf as a double


% --- Executes during object creation, after setting all properties.
function lowf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function highf_Callback(hObject, eventdata, handles)
% hObject    handle to highf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of highf as text
%        str2double(get(hObject,'String')) returns contents of highf as a double


% --- Executes during object creation, after setting all properties.
function highf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to highf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function syn1_Callback(hObject, eventdata, handles)
% hObject    handle to syn1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of syn1 as text
%        str2double(get(hObject,'String')) returns contents of syn1 as a double


% --- Executes during object creation, after setting all properties.
function syn1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to syn1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sep_Callback(hObject, eventdata, handles)
% hObject    handle to sep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sep as text
%        str2double(get(hObject,'String')) returns contents of sep as a double


% --- Executes during object creation, after setting all properties.
function sep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sep1_Callback(hObject, eventdata, handles)
% hObject    handle to sep1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sep1 as text
%        str2double(get(hObject,'String')) returns contents of sep1 as a double


% --- Executes during object creation, after setting all properties.
function sep1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sep1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sep2_Callback(hObject, eventdata, handles)
% hObject    handle to sep2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sep2 as text
%        str2double(get(hObject,'String')) returns contents of sep2 as a double


% --- Executes during object creation, after setting all properties.
function sep2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sep2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function soundfile_Callback(hObject, eventdata, handles)
% hObject    handle to soundfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of soundfile as text
%        str2double(get(hObject,'String')) returns contents of soundfile as a double


% --- Executes during object creation, after setting all properties.
function soundfile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soundfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function syn2_Callback(hObject, eventdata, handles)
% hObject    handle to syn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of syn2 as text
%        str2double(get(hObject,'String')) returns contents of syn2 as a double


% --- Executes during object creation, after setting all properties.
function syn2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to syn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function syn_Callback(hObject, eventdata, handles)
% hObject    handle to syn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of syn2 as text
%        str2double(get(hObject,'String')) returns contents of syn2 as a double



function syn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to soundfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timefre_Callback(hObject, eventdata, handles)
% hObject    handle to timefre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timefre as text
%        str2double(get(hObject,'String')) returns contents of timefre as a double


% --- Executes during object creation, after setting all properties.
function timefre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timefre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in timefrebt.
function timefrebt_Callback(hObject, eventdata, handles)
% hObject    handle to timefrebt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename=get(handles.timefre,'String');
filename=[filename,'.wav'];
[x,Fs]=audioread(filename);
x = x(:,1);
x = x';
N = length(x);
t = (0:N-1)/Fs;
X = fft(x)/N*2;
df = Fs/N;
f = (0:N-1)*df;
axes(handles.graph1);
plot(t,x,'g');
xlabel('Time/s');ylabel('Amplitude');
title('信号的波形');
axes(handles.graph2);
plot(f(1:round(N/2)),abs(X(1:round(N/2))));
xlabel('Frequency/Hz');ylabel('Amplitude');
title('信号的频谱');

guidata(hObject,handles) 


% --- Executes on button press in stopbt.
function stopbt_Callback(hObject, eventdata, handles)
% hObject    handle to stopbt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear sound

guidata(hObject,handles) 
