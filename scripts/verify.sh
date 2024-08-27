#!/bin/bash

# Dependency Variables, set to match your project directories

# ENVIRONMENT VARIABLES
cat <<EOF > /tmp/variables.sh
export project_dir=$HOME  # change nighthawk to different name to test your git clone
export project=\$project_dir/csa_blog  # change portfolio_2025 to name of project from git clone
export project_repo="https://github.com/trevorhuang1/csa_blog.git"  # change to project you created from portfolio_2025 template 
EOF

# Extract saved variables
source /tmp/variables.sh

# DISPLAY ENVIRONMENT VARIABLES
# Output shown title and value variables
echo "Project dir: $project_dir"
echo "Project: $project"
echo "Repo: $project_repo"

# CREATE YOUR PROJECT DIRECTORY
# Extract saved variables
source /tmp/variables.sh

echo "Using conditional statement to create a project directory and project"

cd ~    # start in home directory

# Conditional block to make a project directory
if [ ! -d $project_dir ]
then 
    echo "Directory $project_dir does not exist... making directory $project_dir"
    mkdir -p $project_dir
fi
echo "Directory $project_dir exists." 

# Conditional block to git clone a project from project_repo
if [ ! -d $project ]
then
    echo "Directory $project does not exist... cloning $project_repo"
    cd $project_dir
    git clone $project_repo
    cd ~
fi
echo "Directory $project exists."

# Extract saved variables
source /tmp/variables.sh

echo "Navigate to project, then navigate to area wwhere files were cloned"
cd $project
pwd

echo ""
echo "list top level or root of files with project pulled from github"
ls

# Extract saved variables
source /tmp/variables.sh

echo "Navigate to project, then navigate to area wwhere files were cloned"
cd $project
pwd

echo ""
echo "list all files in long format"
ls -al   # all files -a (hidden) in -l long listing

# Extract saved variables
source /tmp/variables.sh

# SHOW POSTS AND NOTEBOOKS AND IMAGES AND README
echo "Look for posts"
export posts=$project/_posts  # _posts inside project
cd $posts  # this should exist per fastpages
pwd  # present working directory
ls -lR  # list posts recursively

# Extract saved variables
source /tmp/variables.sh

echo "Look for notebooks"
export notebooks=$project/_notebooks  # _notebooks is inside project
cd $notebooks   # this should exist per fastpages
pwd  # present working directory
ls -lR  # list notebooks recursively

# Extract saved variables
source /tmp/variables.sh

echo "Look for images, print working directory, list files"
cd $project/images  # this should exist per fastpages
pwd
ls -lR

# Extract saved variables
source /tmp/variables.sh

echo "Navigate to project, then navigate to area wwhere files were cloned"

cd $project
echo "show the contents of README.md"
echo ""

cat README.md  # show contents of file, in this case markdown
echo ""
echo "end of README.md"

# SECRETS, CONFIG FILES, AND ENV
# This command has no dependencies

echo "Show the shell environment variables, key on left of equal value on right"
echo ""

env

# Extract saved variables
source /tmp/variables.sh

cd $project

echo ""
echo "show the secrets of .git config file"
cd .git
ls -l config

echo ""
echo "look at config file"
cat config


# MAKE A MARKDOWN FILE

# This example has an error in VSCode; it runs best on Jupyter
cd /tmp

file="sample.md"
if [ -f "$file" ]; then
    rm $file
fi

# Create a markdown file using tee and here document (<<EOF)
tee -a $file >/dev/null <<EOF
# Show Generated Markdown
This introductory paragraph and this line and the title above are generated using tee with the standard input (<<) redirection operator.
- This bulleted element is still part of the tee body.
EOF

# Append additional lines to the markdown file using echo and redirection (>>)
echo "- This bulleted element and lines below are generated using echo with standard output (>>) redirection operator." >> $file
echo "- The list definition, as is, is using space to separate lines. Thus the use of commas and hyphens in output." >> $file

# Define an array of actions and their descriptions
actions=("ls,list-directory" "cd,change-directory" "pwd,present-working-directory" "if-then-fi,test-condition" "env,bash-environment-variables" "cat,view-file-contents" "tee,write-to-output" "echo,display-content-of-string" "echo_text_>\$file,write-content-to-file" "echo_text_>>\$file,append-content-to-file")

# Loop through the actions array and append each action to the markdown file
for action in ${actions[@]}; do
  action=${action//-/ }  # Convert dash to space
  action=${action//,/: } # Convert comma to colon
  action=${action//_text_/ \"sample text\" } # Convert _text_ to "sample text", note escape character \ to avoid "" having meaning
  echo "    - ${action//-/ }" >> $file  # Append action to file
done

echo ""
echo "File listing and status"
ls -l $file # List file details
wc $file   # Show word count
mdless $file  # Render markdown from terminal (requires mdless installation)

rm $file  # Clean up temporary 

# SHELL COMMANDS USING MAN

# This example has an error in VSCode; it runs best on Jupyter
cd /tmp

file="sample.md"
if [ -f "$file" ]; then
    rm $file
fi

# Set locale to C to avoid locale-related errors
export LC_ALL=C

# Create a markdown file using tee and here document (<<EOF)
tee -a $file >/dev/null <<EOF
# Show Generated Markdown
This introductory paragraph and this line and the title above are generated using tee with the standard input (<<) redirection operator.
- This bulleted element is still part of the tee body.
EOF

# Append additional lines to the markdown file using echo and redirection (>>)
echo "- This bulleted element and lines below are generated using echo with standard output (>>) redirection operator." >> $file
echo "- The list definition, as is, is using space to separate lines. Thus the use of commas and hyphens in output." >> $file

# Define an array of commands
commands=("ls" "cat" "tail" "pwd" "env" "grep" "awk" "sed" "curl" "wget")

# Loop through the commands array and append each command description to the markdown file
for cmd in ${commands[@]}; do
  description=$(man $cmd | col -b | awk '/^NAME/{getline; print}')
  echo "    - $description" >> $file
done

echo ""
echo "File listing and status"
ls -l $file # List file details
wc $file   # Show word count
mdless $file  # Render markdown from terminal (requires mdless installation)

rm $file  # Clean up temporary file