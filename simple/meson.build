project('simple', 'c')

flex = find_program('flex', required: false)
bison = find_program('bison', required: false)

if not flex.found()
  error('MESON_SKIP_TEST flex not found.')
endif

if not bison.found()
  error('MESON_SKIP_TEST bison not found.')
endif

flex_gen = generator(flex,
output : ['@BASENAME@.c', '@BASENAME@.h'],
arguments : ['--header-file=@OUTPUT1@', '-o', '@OUTPUT0@', '@INPUT@'])

bison_gen = generator(bison,
output : ['@BASENAME@.c', '@BASENAME@.h'],
arguments : ['-d', '-v', '--defines=@OUTPUT1@', '--output=@OUTPUT0@', '@INPUT@'])

lexer_files = flex_gen.process('lexer.l')
parser_files = bison_gen.process('parser.y')

e = executable('simple',
lexer_files,
parser_files)

test('parsertest', e)
