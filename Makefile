.PHONY: add-statistics
add-statistics:
	echo "use FILE=... to specify which file"
	cp ${FILE} ${FILE}.mod

	echo "\n\n ## Statistics" >> ${FILE}.mod
	echo "lines" >> ${FILE}.mod
	wc -l ${FILE} >> ${FILE}.mod

	echo "words" >> ${FILE}.mod
	wc -w ${FILE} >> ${FILE}.mod

	echo "TODOs left:" >> ${FILE}.mod
	cat ${FILE} | tr -c '[:alnum:]' '[\n*]' | grep -c '^TODO' >> ${FILE}.mod

.PHONY: convert
convert: install
	docker run -it -v ${PWD}:/data markdown-to-pdf ./node_modules/.bin/markdown-pdf /data/"${FILE}" -o /data/"${FILE}.pdf"

.PHONY: install
install:
	docker build -t markdown-to-pdf .
