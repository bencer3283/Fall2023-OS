import os
import sys
import random
import shutil
import string

def generate_random_directory_name():
    return ''.join(random.choice(string.ascii_lowercase) for _ in range(6))

def create_nested_directories(directory, depth):
    if depth > 0:
        sub_dir = os.path.join(directory, generate_random_directory_name())
        os.makedirs(sub_dir)
        return create_nested_directories(sub_dir, depth - 1)
    return directory
    

def main():
    if len(sys.argv) != 2:
        print("Usage: python distribute.py <source_directory>")
        sys.exit(1)

    source_dir = sys.argv[1]

    if not os.path.exists(source_dir):
        print(f"Source directory '{source_dir}' does not exist.")
        sys.exit(1)

    files = os.listdir(source_dir)

    # Distribute files into random nested directories
    for file in files:
        random_dir = create_nested_directories(source_dir, random.randint(0, 4))
        os.makedirs(random_dir, exist_ok=True)
        shutil.move(os.path.join(source_dir, file), os.path.join(random_dir, file))

    print(f"Files distributed into random nested directories within '{source_dir}'.")

if __name__ == "__main__":
    main()
