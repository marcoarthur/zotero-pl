
.PHONY = setup
ZOTERO_DB = /home/itaipu/.zotero/zotero/f3aztaao.default/zotero/zotero.sqlite

setup:
	cp $(ZOTERO_DB) .

schema:
	dbicdump -Ilib -o dump_directory=./lib \
		-o components='["InflateColumn::DateTime"]' \
		MyApp::Schema dbi:SQLite:./zotero.sqlite
