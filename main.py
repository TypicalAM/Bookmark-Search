#!/usr/bin/python3
'''Decompress a given file in the lz4 format and print out the result'''
import sys
import lz4.block

def decompression(filepath: str) -> str:
    '''Decompress the lz4 file'''
    with open(filepath, "rb") as stream:
        stream.read(8)  # skip header
        valid = stream.read()
        text = lz4.block.decompress(valid)
    return text

if __name__=='__main__':
    '''Driver code'''
    filepath = " ".join(sys.argv[1:])
    bookmark_data = decompression(filepath)
    print(bookmark_data)
