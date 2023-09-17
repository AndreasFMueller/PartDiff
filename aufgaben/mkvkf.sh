#
# mkvkf.sh -- create solutions for lecture problems
#
# (c) 2023 Prof Dr Andreas Müller
#

buildchapter () {
	echo argument: $1
	awk -F, 'BEGIN {
		woche = '"${1}"'
	}
	/^%/ {
		next
	}
	{
		if ((woche == 0) || (woche == $1)) {
			printf("%d %d %d %d\n", $1, $2, $3, $4)
		}
	}
	END {
	}' vkf.csv | while read woche kapitel nummer aufgabe
	do
		echo Week: ${woche}
		echo Chapter: ${kapitel}
		echo Number: ${nummer}
		echo Problem: ${aufgabe}
		pdf=vkf/${woche}.${kapitel}.`expr ${nummer} + 1`.pdf
		sed 	-e 's/KAPITEL/'"${kapitel}"'/g' \
			-e 's/NUMMER/'"${nummer}"'/g' \
			-e 's/AUFGABE/'"${aufgabe}"'/g' vkf.template > vkf.tex
		pdflatex --output-directory=work vkf.tex >/dev/null 2>&1
		if [ -r work/vkf.pdf ]
		then
			mv work/vkf.pdf ${pdf}
		else
			echo failed to produce ${pdf}
			echo see vkf/vkf.log for details
			exit 1
		fi
	done
}

if [ ! -d vkf ]
then
	mkdir vkf
fi

if [ $# -gt 0 ]
then
	while [ $# -gt 0 ]
	do
		chapter=$1
		echo "working on chapter ${chapter}"
		buildchapter ${chapter}
		shift
	done
else
	buildchapter 0
fi

exit 0
