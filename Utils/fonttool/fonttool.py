import os
import argparse
from fontTools.ttLib import TTFont

def extract_characters_from_ttf(ttf_path):
    font = TTFont(ttf_path)
    characters = set()

    for table in font['cmap'].tables:
        for char_code, glyph_name in table.cmap.items():
            characters.add(chr(char_code))
    
    return characters

def main():
    parser = argparse.ArgumentParser(description="Extract characters from a TTF file")
    parser.add_argument('ttf_path', type=str, help="Path to the TTF file")
    args = parser.parse_args()

    ttf_path = args.ttf_path
    characters = extract_characters_from_ttf(ttf_path)

    # 按字符排序并转换为字符串
    sorted_characters = ''.join(sorted(characters))

    # 输出到屏幕
    print(sorted_characters)

    # 输出到文件
    output_path = os.path.splitext(ttf_path)[0] + "_characters.txt"
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(sorted_characters)

    print(f"\nCharacters have been written to {output_path}")

if __name__ == '__main__':
    main()