#BorderRecognition

###Projekt maj�cy na celu znajdowa� "ramk�" obrazu rozproszeniowego Mie'go.

"Ramka" jest rysowana funkcj� BorderCreation
f(PkX,PkY,PkZ,CCDX,CCDY,CCDZ): R^6 -> R^2^n
funkcja ta nie jest znan� funkcj� analityczn� i ko�ysta z ray tracingu

Wst�pna wersja projektu zak�ada r�czne zaznaczenie punkt�w na brzegu obrazu rozproszeniowego. Po wprowadzeniu tych punkt�w zostanie zminimalizowana odleg�o�� punkt�w od ramki powstaj�cej za pomoc� funkcji f (minimalizacja sumy kwadrat�w odleg�o�ci*1) i zostan� uzyskane argumenty funkcji daj�ce ramk� danego obrazu rozproszeniowego. Argumenty te opisuj� po�o�enie kropli zawieszonej w pu�apce oraz po�o�enie matrycy CCD wzgl�dem �rodka pu�apki.





*1) Do zbadania, czy tak b�dzie wystarczaj�co dobrze.

##Zale�no�ci i u�yte toolboxy Matlaba
license('inuse')
image_toolbox
matlab

[f,p]=matlab.codetools.requiredFilesAndProducts('BorderRecognition.m')

f = 

  Columns 1 through 3

    'D:\Moje dokumenty�'     'D:\Moje dokumenty�'     'D:\Moje dokumenty�' 

  Columns 4 through 6

    'D:\Moje dokumenty�'     'D:\Moje dokumenty�'     'D:\Moje dokumenty�' 

  Columns 7 through 8

    'D:\Moje dokumenty�'     'D:\Moje dokumenty�' 


p = 

1x2 struct array with fields:

    Name
    Version
    ProductNumber
    Certain
	
	
'MATLAB'	'8.6'	1	true
'Image Processing Toolbox'	'9.3'	17	true



##Wywo�anie demonstracji w Matlabie
```Matlab
%za�adowa� klatk� z filmu
load('Frame.mat');
%wywo�a� funkcje z argumentami
[ Pk, PCCD ]=BorderRecognition(Frame)

%nast�pnie w wy�wietlonym okienku zaznaczy� punkty na brzegu
%obrazu rozproszeniowego (zako�czenie zaznaczanie przez
%zamkni�cie wielok�tu podw�jnym klikni�ciem).
%w trakcie wykonania mo�na obserwowa� post�py algorytmu, w
%okienku z klatk� wy�wietlane s� wybrane punkty oraz ramka na
%obecnym etapie optymalizacji.
%po zako�czeniu minimalizacji zostanie wy�wietlona ostatecza
% wersja ramki, a jej parametry s� zwracane w Pk i PCCD.
```