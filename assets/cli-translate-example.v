import saverio.translator

import os

fn help() {
	println('	HELP translate')
	println('translate <source-language> <dest-language> <some text or sentence>')
	println('	source language		: the source of <text>')
	println('	dest language		: the target language')
	println('	text			: the text to translate in <dest language>')
}

fn main() {
	if os.args[0] == '--help' {
		help()
		return
	}
	if os.args.len < 4 {
		help()
		return
	}
	mut text := ''
	for value in os.args[3..] {
		text = text + ' ' + value
	}
	translated_text := translator.translate_text(os.args[1], os.args[2], text)
	println('${os.args[1]} : ${os.args[2]}')
	println('$translated_text')
}
