#!/usr/bin/python3

from tempfile import mkstemp
from shutil import move, copymode
from os import fdopen, remove
import sys
import pdb

filename = sys.argv[-1]


def merge_equal_timing(lines:list, timers, end_lines, new_file) -> list:
    new_lines = lines.copy()

    if len(timers) >= 2:
        if lines[timers[0]] == lines[timers[1]]:
            first_l = lines[timers[0]+1:end_lines[0]]
            second_l = lines[timers[1]+1:end_lines[1]]
            new_lines[timers[0]+1] = ''.join(first_l + second_l)
            
            del new_lines[end_lines[0]:end_lines[1]]
            timers.pop()
            end_lines.pop()
        else:
            to = lines[:end_lines[0]+1]
            
            for l in to:
                new_file.write(l)
            del new_lines[:end_lines[0]+1]
            timers.pop()
            end_lines.pop()

    return new_lines

def write_new_file(file_path):
    """ Merge lines with same time codes 
    """
    
    #Create temp file
    fh, abs_path = mkstemp()
    queue = []
    timers = []
    end_lines = []

    with fdopen(fh,'w') as new_file:
        with open(file_path) as old_file:
            for line in old_file:
                queue.append(line)
                current_i = len(queue) - 1
                if '-->' in line:
                    timers.append(current_i)
                elif line == '\n':
                    end_lines.append(current_i)
                    queue = merge_equal_timing(queue, timers, end_lines, new_file)
        if queue:
            for l in queue:
                new_file.write(l)
                    
    #Copy the file permissions from the old file to the new file
    copymode(file_path, abs_path)
    #Remove original file
    remove(file_path)
    #Move new file
    move(abs_path, file_path)


if __name__ == '__main__':
    write_new_file(filename)