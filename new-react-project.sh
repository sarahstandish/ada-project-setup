#!/bin/sh

# sets up a new React project, removing and reinstalling dependences

projectName=${1}

# check if $repo variable is empty
if [ -z "$projectName" ]

then
    # give directions on how to run the script if no repo provided
    echo "When you run the file, you must also specify the name of your new React project"
    echo "Type the location of the new-react-project.sh file, followed by the name of your new project."
    echo "For example:"
    echo "ada-project-setup/new-react-project.sh hello-world"
    echo "Your new project would be named hello-world and stored in a new hello-world folder"

    exit

else
    npx create-react-app $projectName

    # navigate to the directory
    cd $projectName

    # remove node dependences
    rm -rf node_modules

    # remove yarn.lock
    rm yarn.lock

    # reinstall dependences
    yarn install

    code .

    yarn start

fi
