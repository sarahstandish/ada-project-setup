#!/bin/sh

# sets up an Ada Python project

repo=${1}

# check if $repo variable is empty
if [ -z "$repo" ]

then
    # give directions on how to run the script if no repo provided
    echo "When you run the file, you must also specify the repo you want to clone."
    echo "Type the following into the command line, for example:"
    echo "ada-project-setup/python-project.sh https://github.com/user-name/repository-name.git"

    exit

else
    git clone $repo

    echo "You have cloned a project from":
    git remote -v

    # regex to get the directory_name name, thank you Internet commenters (source: https://serverfault.com/questions/417241/extract-repository-name-from-github-url-in-bash)
    directory_name=$(basename $repo .git)

    # navigate to the directory
    cd $directory_name

    # setup the virtual environment
    python3 -m venv venv
    source venv/bin/activate

    # install project requirements
    pip install -r requirements.txt

    #for some reason I always get a reminder to upgrade pip no matter how many times I upgrade it so I'll just put that here
    pip install --upgrade pip 
fi
