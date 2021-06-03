import saverio.translator

import os
import term

const (
	title = 'TRANSLATE'
	help_data = [
		'a cli interface to translate text, wrapper of saverio.translator',
		'a module to translate via online api / web scrapping for linguee'
		'',
		'translate <source-language> <dest-language> <some text or sentence>',
		'	PARAMS :'
		'		source language		: the source of <text>',
		'		dest language		: the target language',
		'		text			: the text to translate',
		'	GOAL :',
		'		translate <text> in <dest-language> from <source-language>',
		'	RETURN :',
		'		the translated text or an empty string'
		'',
		'translate --supported-language',
		'	PARAMS :',
		'		no',
		'	GOAL :',
		'		show all supported languages',
		'		the <language> and <abreviation> can be used both',
		'	RETURN :',
		'		<language> : <abreviation>'
	]
)

fn help() {
	println( term.header(title, '-'))
	for value in help_data {
		if term.can_show_color_on_stdout() {
			println( term.cyan(value) )
		}
		else {
			println(value)
		}
	}
}

fn supported_language() {
	for key, value in translator.google_lang {
		if term.can_show_color_on_stdout() {
			println( term.cyan('$key : $value'))
		}
		else {
			println('$key : $value')
		}
	}
}

fn main() {
	term.set_terminal_title( title.to_lower() )
	if os.args.len == 1 {
		help()
		return
	}
	match os.args[1] {
		'--help' {
			help()
			return
		}
		'--supported-language' {
			supported_language()
			return
		}
		else {}
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
	println('$translated_text')
}
