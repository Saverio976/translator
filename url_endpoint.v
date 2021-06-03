module translator

pub const (
	google_api_url   = [
		'https://translate.googleapis.com/translate_a/single?client=gtx&sl=',
		'&tl=',
		'&dt=t&q=',
	]
	mymemory_api_url = [
		'https://api.mymemory.translated.net/get?q=',
		'&langpair=',
		'|',
	]
	linguee_api_url  = [
		'https://www.linguee.com/',
		'-',
		'/translation/',
		'.html',
	]
		/*
		deepl_api_url = [
		'https://www.deepl.com/translator#',
		'/',
		'/'
	]
		*/
)
