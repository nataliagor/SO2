#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 6
#
# Celem zajęć jest zapoznanie się z możliwościami narzędzia awk.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
# Większość rozwiązań powinno sprowadzić się do jednego, zmyślnego wywołania
# programu `awk` z odpowiednimi argumentami.
#

#
# Zadanie 8.
# Plik `dodatkowe/lipsum.txt` zawiera przykładowy tekst z generatora
# http://lipsum.pl/. Używając programu awk, proszę przygotować narzędzie,
# które rozbije tekst w podanym pliku wejściowym w taki sposób, aby każda
# linia miała mniej niż 80 znaków (przy czym staramy się zmaksymalizować
# liczbę znaków w każdej linii jak to możliwe). Jako wynik programu wyświetlić
# tekst po przekształceniu.
#



awk '
{ 
	while (length > 80) 	{
		
		spacja  = index(substr($0, prev_spacja, 80), " ") + prev_spacja;
		if( spacja == 0 ) spacja = 80;

		if(spacja > 81 ){
			print substr($0, 1, prev_spacja -1); 
			$0 = substr($0, prev_spacja);
			spacja = 0;
		}
		prev_spacja = spacja;
	 
	} 
	print 
} ' dodatkowe/lipsum.txt




