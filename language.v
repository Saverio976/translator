module translator

pub const google_lang = {
	'af':    'afrikaans'
	'sq':    'albanian'
	'am':    'amharic'
	'ar':    'arabic'
	'hy':    'armenian'
	'az':    'azerbaijani'
	'eu':    'basque'
	'be':    'belarusian'
	'bn':    'bengali'
	'bs':    'bosnian'
	'bg':    'bulgarian'
	'ca':    'catalan'
	'ceb':   'cebuano'
	'ny':    'chichewa'
	'zh':    'chinese'
	'zh-cn': 'chinese (simplified)'
	'zh-tw': 'chinese (traditional)'
	'co':    'corsican'
	'hr':    'croatian'
	'cs':    'czech'
	'da':    'danish'
	'nl':    'dutch'
	'en':    'english'
	'eo':    'esperanto'
	'et':    'estonian'
	'tl':    'filipino'
	'fi':    'finnish'
	'fr':    'french'
	'fy':    'frisian'
	'gl':    'galician'
	'ka':    'georgian'
	'de':    'german'
	'el':    'greek'
	'gu':    'gujarati'
	'ht':    'haitian creole'
	'ha':    'hausa'
	'haw':   'hawaiian'
	'iw':    'hebrew'
	'hi':    'hindi'
	'hmn':   'hmong'
	'hu':    'hungarian'
	'is':    'icelandic'
	'ig':    'igbo'
	'id':    'indonesian'
	'ga':    'irish'
	'it':    'italian'
	'ja':    'japanese'
	'jw':    'javanese'
	'kn':    'kannada'
	'kk':    'kazakh'
	'km':    'khmer'
	'ko':    'korean'
	'ku':    'kurdish (kurmanji)'
	'ky':    'kyrgyz'
	'lo':    'lao'
	'la':    'latin'
	'lv':    'latvian'
	'lt':    'lithuanian'
	'lb':    'luxembourgish'
	'mk':    'macedonian'
	'mg':    'malagasy'
	'ms':    'malay'
	'ml':    'malayalam'
	'mt':    'maltese'
	'mi':    'maori'
	'mr':    'marathi'
	'mn':    'mongolian'
	'my':    'myanmar (burmese)'
	'ne':    'nepali'
	'no':    'norwegian'
	'ps':    'pashto'
	'fa':    'persian'
	'pl':    'polish'
	'pt':    'portuguese'
	'pa':    'punjabi'
	'ro':    'romanian'
	'ru':    'russian'
	'sm':    'samoan'
	'gd':    'scots gaelic'
	'sr':    'serbian'
	'st':    'sesotho'
	'sn':    'shona'
	'sd':    'sindhi'
	'si':    'sinhala'
	'sk':    'slovak'
	'sl':    'slovenian'
	'so':    'somali'
	'es':    'spanish'
	'su':    'sundanese'
	'sw':    'swahili'
	'sv':    'swedish'
	'tg':    'tajik'
	'ta':    'tamil'
	'te':    'telugu'
	'th':    'thai'
	'tr':    'turkish'
	'uk':    'ukrainian'
	'ur':    'urdu'
	'uz':    'uzbek'
	'vi':    'vietnamese'
	'cy':    'welsh'
	'xh':    'xhosa'
	'yi':    'yiddish'
	'yo':    'yoruba'
	'zu':    'zulu'
	'fil':   'Filipino'
	'he':    'Hebrew'
}
pub const mymemory_lang = &google_lang
pub const linguee_lang = {
	'maltese':    'mt'
	'english':    'en'
	'german':     'de'
	'bulgarian':  'bg'
	'polish':     'pl'
	'portuguese': 'pt'
	'hungarian':  'hu'
	'romanian':   'ro'
	'russian':    'ru'
	'dutch':      'nl'
	'slovakian':  'sk'
	'greek':      'el'
	'slovenian':  'sl'
	'danish':     'da'
	'italian':    'it'
	'spanish':    'es'
	'finnish':    'fi'
	'chinese':    'zh'
	'french':     'fr'
	'czech':      'cs'
	'laotian':    'lo'
	'swedish':    'sv'
	'latvian':    'lv'
	'estonian':   'et'
	'japanese':   'ja'
}

fn supported_language(api string, language string) string {
	mut true_language := language
	map_api := match api {
		'google' {
			translator.google_lang
		}
		'mymemory' {
			*translator.mymemory_lang
		}
		'linguee' {
			translator.linguee_lang
		}
		else {
			map[string]string{}
		}
	}
	if map_api.len == 0 {
		return ''
	}
	mut is_supported := false
	for key, value in map_api {
		if !is_supported {
			if key == language {
				is_supported = true
			} else if value == language {
				true_language = key
				is_supported = true
			}
		}
	}
	if !is_supported {
		true_language = ''
	}
	return true_language
}
