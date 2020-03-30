from pathlib import Path
import string


def md_head_link(h: str) -> str:
    # Clean from non-ascii
    link = ''.join(filter(lambda s: s in string.printable, h))
    # And make link
    link = '#' + link.lower().replace(' ', '-')
    return link


def toc(text: str, level='##', skip_first=True) -> str:
    r = f'{level} Table of Contents\n\n'

    for line in text.split('\n'):
        head_level = 0
        for s in line:
            if s != '#':
                break
            head_level += 1

        if head_level > int(skip_first):
            head = line.lstrip('#').lstrip()
            r += '  ' * (head_level - 1 - int(skip_first)) + f'- [{head}]({md_head_link(head)})\n'

    return r


if __name__ == '__main__':
    # Get template and sources of scripts
    template = Path('readme.template.md').read_text()
    scripts = {p.stem: p.read_text() for p in Path('scripts').iterdir()}

    # Substitute
    result = template.format(toc=toc(template), **scripts)

    # Write result
    Path('readme.md').write_text(result)
