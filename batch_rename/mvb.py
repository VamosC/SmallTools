import argparse
import os
import os.path as osp


def find_suffix_pos(s):
    return s.rindex('.')


def find_suffix(s):
    pos = find_suffix_pos(s)
    if pos == -1:
        return ''
    else:
        return s[pos+1:]


def rename_batch(path, origin_suffix, replace_suffix):
    files = list(filter(lambda x: find_suffix(
        x) == origin_suffix, os.listdir(path)))
    for file in files:
        replaced_file = file[:find_suffix_pos(file)] + '.' + replace_suffix
        os.rename(osp.join(path, file), osp.join(path, replaced_file))
        print('%s -> %s' % (osp.join(path, file), osp.join(path, replaced_file)))


if __name__ == '__main__':
    argparser = argparse.ArgumentParser()
    argparser.add_argument('--path', help='directory', default='.')
    argparser.add_argument('--origin', help='origin format')
    argparser.add_argument('--replace', help='replaced format')
    args = argparser.parse_args()
    rename_batch(args.path, args.origin, args.replace)
