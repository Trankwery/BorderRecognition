#BorderRecognition

###Projekt maj�cy na celu znajdowa� "ramk�" obrazu rozproszeniowego Mie'go.

"Ramka" jest rysowana funkcj� BorderCreation
f(PkX,PkY,PkZ,CCDX,CCDY,CCDZ): R^6 -> R^2
funkcja ta nie jest znan� funkcj� analityczn� i ko�ysta z ray tracingu

Wst�pna wersja projektu zak�ada r�czne zaznaczenie punkt�w na brzegu obrazu rozproszeniowego. Po wprowadzeniu tych punkt�w zostanie zminimalizowana odleg�o�� punkt�w od ramki powstaj�cej za pomoc� funkcji f (minimalizacja sumy kwadrat�w odleg�o�ci*1) i zostan� uzyskane argumenty funkcji daj�ce ramk� danego obrazu rozproszeniowego. Argumenty te opisuj� po�o�enie kropli zawieszonejw pu�apce oraz po�o�enie matrycy CCD wzgl�dem �rodka pu�apki.






*1) Do zbadania, czy tak b�dzie wystarczaj�co dobrze.