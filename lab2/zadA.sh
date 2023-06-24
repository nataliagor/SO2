#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 10.
# W katalogu `dane/deep/` i wszystkich jego podkatalogach odnaleźć wszystkie
# pliki zwykłe, których nie możemy przeczytać ze względu na brak uprawnień
# dostępu. Zwrócić ścieżki do odnalezionych plików względem katalogu `dane/`.
# Opracowany skrypt powinien działać niezależnie od istniejącej liczby
# i poziomów podkatalogów.
#
# Wskazówka: pomocne może być zdefiniowanie funkcji i jej rekurencje wywołanie.
#


katalog=./dane/deep


function sprawdz_podkatalogi {
	
	shopt -s dotglob			#zeby widzial tez zaczynajace sie od kropki

	for podkatalog in "${katalog}"/*; do
		
		if [ -f "${podkatalog}" ] && [ ! -r "${podkatalog}" ]; then
			echo "${podkatalog#./dane/}"

		elif [ -d "${podkatalog}" ]; then
                        katalog="${podkatalog}"
                        sprawdz_podkatalogi
                fi
        done
}


sprawdz_podkatalogi



#function sprawdz_podkatalogi {
#       for podkatalog in $( ls "${katalog}" ); do
#               sciezka=""${katalog}"/"${podkatalog}""
#               
#               if [ -f "${sciezka}" ] && [ ! -r "${sciezka}" ]; then
#                       echo "${sciezka#./dane/}"
#
#               elif [ -d "${sciezka}" ]; then
#                       katalog="${sciezka}"
#                       echo "${katalog}"
#                       sprawdz_podkatalogi
#               fi
#       done
#}

