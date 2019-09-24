.PHONY: add-statistics
add-statistics:
	echo "use FILE=... to specify which file"
	cp ${FILE} ${FILE}.mod

	echo "## Statistics" >> ${FILE}.mod
	echo -n "lines" >> ${FILE}.mod
	wc -l ${FILE} >> ${FILE}.mod

	echo -n "words" >> ${FILE}.mod
	wc -w ${FILE} >> ${FILE}.mod

	echo -n "TODOs left:" >> ${FILE}.mod
	cat ${FILE} | tr -c '[:alnum:]' '[\n*]' | grep -c '^TODO' >> ${FILE}.mod

.PHONY: convert
convert:
	./node_modules/.bin/markdown-pdf ${FILE}.mod
	rm ${FILE}.mod


