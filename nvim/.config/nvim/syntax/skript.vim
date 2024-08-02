syn clear
syn match skComment "#.*$"
syn keyword skKeyword on command loop trigger permission function if exit add return then do while to of else in wait set break cancel stop aliases expression get effect import is not
syn keyword skFunction message broadcast send open clear debug true false
syn match skFunctionCall /\w\+\ze(/
syn match skNumber /\v\d+(\.\d+)?/

syn match skColon /::/
syn match skPercent /%/ contained

syn region skString start="\"" end="\"" contains=skEscape
syn region skVar start="{" end="}" contains=skVar, skColon, skListAll, skEscape
syn region skLocalVar start="{_" end="}" contains=skLocalVar, skColon, skListAll, skEscape
"syn region skEscape start="%" end="%" contains=skVar, skLocalVar, skColon, skListAll, skPercent
syn region skEscape start="%" end="%" contains=skVar, skLocalVar

syn match skValue /loop-value/

syn match skListAll /*/ contained


" Todo
" Make %% autopair
" Make ' not autopair
" Make loop-value, loop-index, loop-player, arg x, event-block etc match to a var
" Different color {} for inner
" % inside strings should match vars
" &c Color Codes



hi link skKeyword Keyword
hi link skFunction Function
hi link skFunctionCall Function
hi link skComment Comment
hi link skString String
hi link skVar Warningmsg
hi link skInner Warningmsg
hi link skColon Comment
hi link skColonVar Comment
hi link skLocalVar Label
hi link skPercent String
hi link skListAll ErrorMsg
hi link skNumber Number
hi link skValue Label
