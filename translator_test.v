module translator

fn test_translate_x_to_y() {
	mut context := translate_x_to_y('fr', 'en', 'Salut') or { Context{} }
	println('$context.dest_text')
	assert context.dest_text.to_lower() == 'hi'
}

fn test_context_translate() {
	mut context := Context{
		src_language: 'en'
		dest_language: 'fr'
		src_text: 'Hi'
	}
	assert context.translate() == 0
	assert context.dest_text.to_lower() == 'salut'
}
