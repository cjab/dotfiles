" Vim syntax file
" Language:	TXL
" Author/Maintainer:	Jim Cordy <cordy@cs.queensu.ca>
" Version:      	7.2(synched), 2009 Aug 31 (Rev 2010 Jul 28)

" Remove any old syntax stuff hanging around
syn clear

" Comments
syn match txlComment		"%.*$"
syn region txlComment		start="%(" end=")%"
syn region txlComment		start="%{" end="}%"

" Preprocessor
syn region txlPrepRegion	transparent start="^[ 	]*#[a-z][a-z]*" end="$" contains=ALL
syn match txlPreprocessor	contained "^[ 	]*#[a-z][a-z]*"
syn match txlPreprocessor	contained "^[ 	]*#end if"
syn match txlPreprocessor	contained "\<then\>"
syn match txlPreprocessor	contained "^[ 	]*#pragma[ 	].*"

" Keywords
syn keyword txlKeyword 		assert end keys define redefine repeat list opt rule function
syn keyword txlKeyword		external replace by match skipping construct deconstruct
syn keyword txlKeyword		where not include comments compounds tokens all
syn keyword txlKeyword		import export each
syn keyword txlKeyword		attr see

" Formatting tokens
syn match txlFormat		"\[NL\]"
syn match txlFormat		"\[IN\]"
syn match txlFormat		"\[IN_[1-9][0-9]*\]"
syn match txlFormat		"\[EX\]"
syn match txlFormat		"\[EX_[1-9][0-9]*\]"
syn match txlFormat		"\[SP\]"
syn match txlFormat		"\[SP_[1-9][0-9]*\]"
syn match txlFormat		"\[TAB\]"
syn match txlFormat		"\[TAB_[1-9][0-9]*\]"
syn match txlFormat		"\[SPOFF\]"
syn match txlFormat		"\[SPON\]"
syn match txlFormat		"\[KEEP\]"

" Literal values
syn match txlLiteral		"'[^ 	\]]*"			" quoted literal symbol
syn match txlLiteral		"''\(\\'\|[^']\)*'"		" quoted charlit
syn match txlLiteral		"'\"\(\\\"\|[^"]\)*\""		" quoted stringlit
syn match txlLiteral		"\"\(\\\"\|[^"]\)*\""		" unquoted stringlit
syn match txlLiteral		"\<\d\+\(.\d\+\)\=\([Ee][+-]\=\d\+\)\=\>"	" unquoted number
syn match txlLiteral		"[-!@{}+=><()/\\?;:.,]"		" unquoted special symbol
syn match txlLiteral		"#\>"				" ditto, but don't confuse preprocessor directives
syn match txlLiteral		"\<[A-Z][-A-Z][-A-Z]*\>"	" unquoted target language (PL/I and COBOL) keywords
syn match txlLiteral		"</\=[A-Z][-A-Z0-9]*>"		" unquoted target language (HTML) tags
syn match txlLiteral		"</\=[A-Z][-A-Z0-9]* "		" unquoted target language (HTML) half tags

" But not TXL builtin rules
syn match txlNotLiteral		"\[[-!+-=><?.,][^ 	\]]*"

" Link to color categories
hi def link txlKeyword Keyword
hi def link txlPreprocessor PreProc
hi def link txlComment Comment
hi def link txlFormat Structure
hi def link txlLiteral Constant

