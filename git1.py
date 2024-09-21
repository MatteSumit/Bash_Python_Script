import subprocess

def clone_repository(repository_url, destination_path):
    subprocess.run(['git', 'clone', repository_url, destination_path])

# Mention repo u want to clone
repository_url = 'https://github.com/SumitMatte/my-db.git'
destination_path = 'mnt/python_script'

clone_repository(repository_url, destination_path)

