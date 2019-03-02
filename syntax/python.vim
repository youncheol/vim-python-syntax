" for pythonExtraOperator
syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString contains=pythonExtraOperator
syn match pythonStrFormat "{\([a-zA-Z0-9_]*\|\d\+\)\(\.[a-zA-Z_][a-zA-Z0-9_]*\|\[\(\d\+\|[^!:\}]\+\)\]\)*\(![rs]\)\=\(:\({\([a-zA-Z_][a-zA-Z0-9_]*\|\d\+\)}\|\([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*\(\.\d\+\)\=[bcdeEfFgGnoxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString contains=pythonExtraOperator

" pythonCallRegion, extend
syn region pythonString     start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend extend contains=pythonEscape,pythonEscapeError,@Spell,pythonCallRegion
syn region pythonString     start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend extend contains=pythonEscape,pythonEscapeError,@Spell,pythonCallRegion
syn region pythonString     start=+[bB]\="""+ end=+"""+ keepend extend contains=pythonEscape,pythonEscapeError,pythonDocTest2,pythonSpaceError,@Spell,pythonCallRegion
syn region pythonString     start=+[bB]\='''+ end=+'''+ keepend extend contains=pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,@Spell,pythonCallRegion

syn match   pythonCall              /\<\h\i*\ze\s*(/    contains=pythonBuiltin,pythonBuiltinFunc,pythonBuiltinType nextgroup=pythonCallRegion skipwhite keepend
syn region  pythonCallRegion        contained matchgroup=pythonParamsDelim start=/(/  end=/)/ keepend extend contains=pythonCallComma,pythonCall,@pythonCallArgument,pythonCallArgKeyword,pythonMethodCall containedin=pythonBuiltinFunc
syn match   pythonCallComma         contained /,/ display nextgroup=pythonCommaError skipwhite skipnl skipempty
syn match   pythonCommaError        contained /,/ extend display
syn cluster pythonCallArgument      contains=pythonComment,pythonCall,pythonCallRegion,pythonOperator,pythonExtraOperator,pythonLambdaExpr,pythonRepeat,pythonConditional,
                                              \pythonBuiltinObj,pythonBuiltinType,pythonBultinFunc,pythonConstant,
                                              \pythonString,pythonNumber,pythonBrackets,pythonSelf,pythonDocstring,
                                              \skipwhite

syn match pythonCallArgKeyword    contained /\h\i*\ze\s*==\@!/
syn match pythonExample "^\s*>>>" containedin=pythonDocTest2
syn match pythonDecimalPlace "\.\d\+[fE]" display containedin=pythonStrFormat
syn match pythonStrMark "[ru]\ze[\"\']" display containedin=pythonCallRegion
syn match pythonClassBrackets /[()]/ containedin=pythonClassParameters
syn match pythonConstant "\<\([A-Z_][A-Z_]\+\)\>"
" syn match pythonMethodCall "\.\@<=[a-zA-Z0-9_]*\ze(" containedin=pythonCall

hi def link  pythonCallComma      Normal
hi def link  pythonParamsDelim    Normal
hi def link  pythonCommaError     Error
hi           pythonCallArgKeyword ctermfg=166 guifg=#d75f00
hi def link  pythonExample        Statement
hi def link  pythonDecimalPlace   Statement
hi def link  pythonConstant       Identifier
hi def link  pythonStrMark        Statement
hi def link  pythonClassBrackets  Normal
" hi def link  pythonMethodCall     Statement

" hi def link  pythonStatement            Statement
" hi def link  pythonLambdaExpr           Statement
" hi def link  pythonInclude              Statement
" hi def link  pythonFunction             Define
" hi def link  pythonClass                Define
" hi def link  pythonParameters           Normal
" hi def link  pythonParam                Normal
" hi def link  pythonBrackets             Normal
" hi def link  pythonClassParameters      Define
" hi def link  pythonSelf                 Identifier

" hi def link  pythonConditional          Statement
" hi def link  pythonRepeat               Statement
" hi def link  pythonException            Statement
" hi def link  pythonOperator             Statement
" hi def link  pythonExtraOperator        Statement
" hi def link  pythonExtraPseudoOperator  Statement

" hi def link  pythonDecorator            Special
" hi def link  pythonDottedName           Identifier
" hi def link  pythonDot                  Identifier

" hi def link  pythonComment              Comment
" hi def link  pythonCoding               Comment
" hi def link  pythonRun                  Special
" hi def link  pythonTodo                 Statement

" hi def link  pythonError                Error
" hi def link  pythonIndentError          Error
" hi def link  pythonSpaceError           Error

" hi def link  pythonString               String
" hi def link  pythonDocstring            String
" hi def link  pythonUniString            String
" hi def link  pythonRawString            String
" hi def link  pythonUniRawString         String

" hi def link  pythonEscape               Identifier
" hi def link  pythonEscapeError          Error
" hi def link  pythonUniEscape            Identifier
" hi def link  pythonUniEscapeError       Error
" hi def link  pythonUniRawEscape         Identifier
" hi def link  pythonUniRawEscapeError    Error

" hi def link  pythonStrFormatting        Identifier
" hi def link  pythonStrFormat            Identifier
" hi def link  pythonStrTemplate          Identifier

" hi def link  pythonDocTest              String
" hi def link  pythonDocTest2             String

" hi def link  pythonNumber               Identifier
" hi def link  pythonHexNumber            Identifier
" hi def link  pythonOctNumber            Identifier
" hi def link  pythonBinNumber            Identifier
" hi def link  pythonFloat                Identifier
" hi def link  pythonOctError             Error
" hi def link  pythonHexError             Error
" hi def link  pythonBinError             Error

" hi def link  pythonBuiltinType          Identifier
" hi def link  pythonBuiltinObj           Identifier
" hi def link  pythonBuiltinFunc          Identifier

" hi def link  pythonExClass              Identifier

