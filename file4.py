import os

extension_to_find = input("Enter the file extension (e.g., txt): ")
search_path = input("Enter location: ")

found_files = []

for root, dirs, files in os.walk(search_path):
    for file in files:
        if file.endswith(f".{extension_to_find}"):
            found_files.append(os.path.join(root, file))

if found_files:
    print(f"Found {len(found_files)} files with the .{extension_to_find} extension:")
    for file in found_files:
        print(file)
else:
    print(f"No files with the .{extension_to_find} extension found in {search_path}")

