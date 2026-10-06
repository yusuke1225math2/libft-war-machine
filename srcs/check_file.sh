#!/bin/bash

check_makefile()
{
	printf "Makefile"
	#if [ -e ${PATH_LIBFT}/Makefile ] || [ -e ${PATH_LIBFT}/makefile ]
	if [ -e "${PATH_LIBFT}"/${MAKEFILE_VAR} ]
	then
		printf "\033[15G-Wall"
		printf "\033[25G-Wextra"
		printf "\033[35G-Werror\n"
		printf "${COLOR_OK}found${DEFAULT}"
		printf "\033[15G"
		if [ -z "$(grep -w '\-Wall' "${PATH_LIBFT}"/${MAKEFILE_VAR})" ]
		then
			printf "${COLOR_FAIL}missing${DEFAULT}"
		else
			printf "${COLOR_OK}ok${DEFAULT}"
		fi
		printf "\033[25G"
		if [ -z "$(grep -w '\-Wextra' "${PATH_LIBFT}"/${MAKEFILE_VAR})" ]
		then
			printf "${COLOR_FAIL}missing${DEFAULT}"
		else
			printf "${COLOR_OK}ok${DEFAULT}"
		fi
		printf "\033[35G"
		if [ -z "$(grep -w '\-Werror' "${PATH_LIBFT}"/${MAKEFILE_VAR})" ]
		then
			printf "${COLOR_FAIL}missing\n${DEFAULT}"
		else
			printf "${COLOR_OK}ok\n${DEFAULT}"
		fi
	else
		printf "${COLOR_FAIL}\nnot found${DEFAULT}\n"
	fi
}

check_readme()
{
	printf "\nREADME.md"
	if [ ! -f "${PATH_LIBFT}/README.md" ]; then
		printf "${COLOR_FAIL}\nnot found${DEFAULT}\n"
		return
	fi
	printf "${COLOR_OK}\nfound${DEFAULT}"
	if ! head -n 1 "${PATH_LIBFT}/README.md" | grep -Eq '^\*This project has been created as part of the 42 curriculum by .+\*$'; then
		printf "${COLOR_FAIL}\nrequired italic first line missing${DEFAULT}"
	fi
	for section in Description Instructions Resources; do
		if ! grep -Eiq "^#{1,6} +${section}([[:space:]]|$)" "${PATH_LIBFT}/README.md"; then
			printf "${COLOR_FAIL}\n${section} section missing${DEFAULT}"
		fi
	done
	printf "\n"
}

check_header()
{
	printf "Header file"
	if [ -e "${PATH_LIBFT}"/${HEADER_DIR}/libft.h ]
	then
		printf "\033[15GNorme\n"
		printf "${COLOR_OK}found${DEFAULT}"
		if [ ${OPT_NO_NORMINETTE} -eq 1 ]
		then
			printf "${DEFAULT}\033[15Gdisabled\n"
		else
			text="= libft.h"
			printf "\n${text}" >> "${PATH_DEEPTHOUGHT}"/deepthought
			printf "%.s=" $(seq 1 $(( 80 - ${#text} ))) >> "${PATH_DEEPTHOUGHT}"/deepthought
			printf "\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
			printf "$> norminette libft.h | grep -E '(Error|Warning)'\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
			NORME_VAR=$(norminette "${PATH_LIBFT}"/libft.h 2>&1)
			if echo "$NORME_VAR" | grep -q command
			then
				printf "${COLOR_WARNING}\033[15Gnot found${DEFAULT}\n"
				printf "norminette : command not found\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
			elif echo "$NORME_VAR" | grep -qE '(Error|Warning)'
			then
				printf "${COLOR_FAIL}\033[15Gcheck failed${DEFAULT}\n"
				echo "$NORME_VAR" | grep -E '(Error|Warning)' >> "${PATH_DEEPTHOUGHT}"/deepthought
				printf "Norme check failed\n" >> "${PATH_DEEPTHOUGHT}"/deepthought
			else
				printf "${COLOR_OK}\033[15Gok${DEFAULT}\n"
			fi
		fi
	else
		printf "${COLOR_FAIL}\nnot found${DEFAULT}\n"
	fi
	printf "\n"
}

func_check_file()
{
	text="CHECKING FILES"
	printf "${COLOR_TITLE}"
	printf "%.s${CHAR_LENGTH}" $(seq 1 ${TITLE_LENGTH})
	printf "\n${CHAR_WIDTH}\033[$(( (${TITLE_LENGTH} - ${#text}) / 2 ))G${text}\033[${TITLE_LENGTH}G${CHAR_WIDTH}\n"
	printf "%.s${CHAR_LENGTH}" $(seq 1 ${TITLE_LENGTH})
	printf "\n\n${DEFAULT}"
	check_makefile
	check_readme
	check_header
}
