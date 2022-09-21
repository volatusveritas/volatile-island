if exists("b:current_syntax")
    finish
endif


syntax case match


syntax match outDefinitionName /^[A-Z0-9_]*/

syntax match outReplacementModifierMarker /[!:\.]/ contained
syntax match outReplacementModifierBody /[!:\.]\@<=.*/ contained
syntax region outReplacementModifierIndex
    \ matchgroup=outReplacementModifierIndexMarker
    \ start=/\[/ end=/\]/
    \ contained

syntax region outDefinitionReplacement
    \ matchgroup=outReplacementMarker
    \ start=/{{\@!/ end=/}/
    \ contained
    \ contains=outReplacementModifierMarker,outReplacementModifierBody,
    \outReplacementModifierIndex,outReplacementModifierIndexMarker
    \ keepend

syntax match outDefinitionText /\(^\s\+\)\@<=.*/
    \ contains=outDefinitionReplacement,outLiteralBOpen,outLiteralBClose

syntax match outLiteralBOpen /{{/ contained
syntax match outLiteralBClose /}}/ contained

syntax match outComment /\#.*/


highlight link outDefinitionName Identifier
highlight link outReplacementModifierMarker SpecialChar
highlight link outReplacementModifierBody Macro
highlight link outReplacementModifierIndex Normal
highlight link outReplacementModifierIndexMarker SpecialChar
highlight link outDefinitionReplacement Normal
highlight link outReplacementMarker SpecialChar
highlight link outDefinitionText String
highlight link outLiteralBOpen SpecialChar
highlight link outLiteralBClose SpecialChar
highlight link outComment Comment
