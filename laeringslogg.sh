#!/bin/bash

read -p "Enter date (YYYY-MM-DD), or press ENTER for todays date: " DATE_PARAM
read -p "Enter tags separated by space or comma(,): " TAGS
read -p "Open file after creation? [Y/n]: " OPEN_FILE

IFS=', ' read -r -a array <<< "$TAGS"
DATE_PARAM_MOD=$(echo $DATE_PARAM | sed 's/[^0-9]*//g')
PATH_TO_DIR=~/Repos/HUGO-blog/content/laeringslogg
CURRENT_DATE=$(date '+%Y-%m-%d')
YEAR=${DATE_PARAM_MOD:0:4}
MONTH=${DATE_PARAM_MOD:4:2}
DAY=${DATE_PARAM_MOD:6:${#DATE_PARAM}}

generate_tags() {
for index in "${!array[@]}"
do
    if test $index -eq $((${#array[@]}-1))
    then
        echo -n "${array[index]}"
    else
        echo -n "${array[index]}, "
    fi
done
exit 0
}

generate_output() {
echo "---"
echo "title: $1" # Pass the title as the first argument to the script
echo "date: $1" # Use the current date as the "date" field in the front matter
echo "laeringsemner: [$(generate_tags)]"
echo "---"
for index in "${!array[@]}"
do
    echo "## ${array[index]}"
    echo 
done
# exit 0
}

file-creation() {
    local OUTPUT_FILE="index.md"
    generate_output $1  > $OUTPUT_FILE
    # exit 0
}

folder-creation() {
    if [ ! -d ${PATH_TO_DIR}/${1} ] 
    then
        cd $PATH_TO_DIR
        mkdir $1
        if [ -d ${PATH_TO_DIR}/${1} ]
        then
            echo "sdfsfds"
            echo "Successfully created folder $1" 
            cd $1
            file-creation $1
            if [ $OPEN_FILE ]; then
                nvim index.md
                exit 0
            fi
            exit 0
        else
            echo "Something went wrong."
            exit 1
        fi
    else
        echo "Folder $1 already exist."
        exit 1
    fi
}

# Check if target directory exists
[ ! -d $PATH_TO_DIR ] && \
    { echo "Can't find folder $PATH_TO_DIR"; exit 1; }

# Check if date param is given
if [ $DATE_PARAM ]
then
    # Check if date is valid
    if test "${#DATE_PARAM_MOD}" -gt 7 && date -d "${YEAR}-${MONTH}-${DAY}" &> /dev/null
    then 
        folder-creation $DATE_PARAM
        exit 0
    else 
        echo "Date $DATE_PARAM is invalid"
        exit 1
    fi
else
    folder-creation $CURRENT_DATE
    exit 0
fi


