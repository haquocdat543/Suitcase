#!/bin/bash

OPTION=${1}
SECOND_OPTION=${2}

DEFAULT_DIRECTORY="${HOME}/.password-store"
GPG_OPTIONS="--batch --quiet -d"

RELATIVE_PATH=${SECOND_OPTION}

FULL_DIRECTORY="${DEFAULT_DIRECTORY}/${RELATIVE_PATH}"

# Function to read secret with confirmation
function get_secret() {
	read -sp "Enter your secret: " SECRET1
	echo
	read -sp "Confirm your secret: " SECRET2
	echo

	if [[ "${SECRET1}" == "${SECRET2}" ]]; then
		echo "Secret matched"
		continue
	else
		echo "Secrets do not match. Please try again."
		get_secret
	fi
}

if [[ ${OPTION} == "show" ]]; then
	# tree default directory
	tree ${DEFAULT_DIRECTORY}
elif [[ ${OPTION} == "fzf" ]]; then

	# tree default directory with fzf
	KEY_PATH=$(find ${DEFAULT_DIRECTORY} -path "${DEFAULT_DIRECTORY}/.git" -prune -o -type f -print | fzf)
	gpg ${GPG_OPTIONS} ${KEY_PATH}

elif [[ ${OPTION} == "insert" ]]; then

	# setup env
	KEY_PATH=${FULL_DIRECTORY}
	KEY_PART=$(basename "$KEY_PATH")
	DIRECTORY_PART=$(dirname "$KEY_PATH")

	# confirm secret
	get_secret

	# create directory
	mkdir -p ${DIRECTORY_PART}
	echo ${SECRET1} >${KEY_PATH}

	# encrypt key
	EMAIL=$(gpg --list-secret-keys --keyid-format LONG | grep -E 'uid' | awk -F '<|>' '{print $2}')
	gpg -e -r ${EMAIL} ${KEY_PATH}
	rm -rf ${KEY_PATH}
	echo "Encrypted ${KEY_PATH} sucessfully !"

	git -C ${DEFAULT_DIRECTORY} add "${FULL_DIRECTORY}.gpg"
	git -C ${DEFAULT_DIRECTORY} commit -m "Add given password for ${RELATIVE_PATH} to store."

else
	# tree default directory
	tree ${DEFAULT_DIRECTORY}
fi
