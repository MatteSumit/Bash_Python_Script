import os

for dirpath, dirnames, filenames in os.walk("/etc"):
    for filename in filenames:
        if filename.endswith(".conf"):
            comp_path = os.path.join(dirpath, filename)
            print(comp_path)
