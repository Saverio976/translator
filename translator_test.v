module translator

fn test_translate_text() {
	assert translate_text('fr', 'en', 'bonjour').to_lower() == 'hello'
}

fn test_translate_word() {
	assert translate_word('french', 'english', 'bonjour').to_lower() == 'hello'
}

fn test_contexttranslator_google_translate() {
	mut context := ContextTranslator{
		src_language: 'en'
		dest_language: 'fr'
		src_text: 'Hi'
	}
	assert context.google_translate() == 0
	assert context.dest_text.to_lower() == 'salut'

	context = ContextTranslator{
		src_language: 'english'
		dest_language: 'fr'
		src_text: 'Hi'
	}
	assert context.google_translate() == 0
	assert context.dest_text.to_lower() == 'salut'

	context = ContextTranslator{
		src_language: 'en'
		dest_language: 'french'
		src_text: 'Hi'
	}
	assert context.google_translate() == 0
	assert context.dest_text.to_lower() == 'salut'

	context = ContextTranslator{
		src_language: 'english'
		dest_language: 'french'
		src_text: 'Hi'
	}
	assert context.google_translate() == 0
	assert context.dest_text.to_lower() == 'salut'
}

fn test_contexttranslator_mymemory_translate() {
	mut context := ContextTranslator{
		src_language: 'en'
		dest_language: 'fr'
		src_text: 'Hello'
	}
	assert context.mymemory_translate() == 0
	assert context.dest_text.to_lower() == 'bonjour'

	context = ContextTranslator{
		src_language: 'english'
		dest_language: 'fr'
		src_text: 'Hello'
	}
	assert context.mymemory_translate() == 0
	assert context.dest_text.to_lower() == 'bonjour'

	context = ContextTranslator{
		src_language: 'en'
		dest_language: 'french'
		src_text: 'Hello'
	}
	assert context.mymemory_translate() == 0
	assert context.dest_text.to_lower() == 'bonjour'

	context = ContextTranslator{
		src_language: 'english'
		dest_language: 'french'
		src_text: 'Hello'
	}
	assert context.mymemory_translate() == 0
	assert context.dest_text.to_lower() == 'bonjour'
}

fn test_contexttranslator_linguee_translate() {
	mut context := ContextTranslator{
		src_language: 'en'
		dest_language: 'fr'
		src_text: 'Hello'
	}
	assert context.linguee_translate() == 0
	assert context.dest_text.to_lower() == 'bonjour'

	context = ContextTranslator{
		src_language: 'english'
		dest_language: 'fr'
		src_text: 'Hello'
	}
	assert context.linguee_translate() == 0
	assert context.dest_text.to_lower() == 'bonjour'

	context = ContextTranslator{
		src_language: 'en'
		dest_language: 'french'
		src_text: 'Hello'
	}
	assert context.linguee_translate() == 0
	assert context.dest_text.to_lower() == 'bonjour'

	context = ContextTranslator{
		src_language: 'english'
		dest_language: 'french'
		src_text: 'Hello'
	}
	assert context.linguee_translate() == 0
	assert context.dest_text.to_lower() == 'bonjour'
}

/*
fn test_ContextTranslator_deepl_translate() {
	mut context := ContextTranslator{
		src_language: 'en'
		dest_language: 'fr'
		src_text: 'Hi'
	}
	assert context.deepl_translate() == 0
	assert context.dest_text.to_lower() == 'salut'
}
*/
