import os

path = "/mnt/python_script/2/my-dir"

# Check whether the specified path exists or not
if not os.path.exists(path):
    print("Directory not present")
    try:
        # Create a new directory
        os.makedirs(path)
        print("The new directory is created!")
    except OSError as e:
        print(f"Error creating directory: {e}")
else:
    print("Directory already exists")

