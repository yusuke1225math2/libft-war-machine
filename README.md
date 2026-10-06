# PREAMBLE
This fork adapts libft-war-machine to Libft subject v19.2. It derives from the 2019 tester by @jtoty and @lmartin. <br/>
(ORIGINAL REP : https://github.com/jtoty/Libftest) <br/>
This update was made by @lmartin <br/>

# libft-war-machine
<img align="right" src="./srcs/img_readme.png" width="50%"/>
This repository contains script to test your libft project.
The script will do the following tests :

- Check whether README.md meets the subject structure
- Check if libft.h exists
- Check norme of libft.h
- Check if the Makefile file exists
- Check rules in Makefile
- Check compilation's flag in Makefile
- Compil library
- Check norme errors
- Check forbidden functions
- Tests functions

At the end of the tests, a deepthought file will be created, inside which you
can find all the results and error/failure messages. You can also see your
results in tests directory.

The script will compil your files with your libft, so you must have your
Makefile up to date.

:warning:All the tests made are not the official tests:warning:

## Getting Started

### Installation

```bash
git clone https://github.com/yusuke1225math2/libft-war-machine
```

### Configuration

If you run the script for the first time, it will automatically create
`my_config.sh` file and ask you to edit it with the path of your libft
project.
You can also choose the colors that will be used and the path where the
deepthought file will be created.

#### Custom directories

If you use custom directories for your header and source files; you should specify there name in my_config.sh.

The following variables must be set:
```
HEADER_DIR
SRC_DIR
```
Exemple:
```
HEADER_DIR="includes"
SRC_DIR="srcs"
```


## Running script

Go to the directory where you cloned and run the script
```bash
bash grademe.sh
```
or simply run the script with the path
```bash
bash /path/where/you/cloned/grademe.sh
```

### Options available
| Option | Description |
| --- | --- |
| `-h`<br />`--help` | Display help and exit |
| `-d` | Allows to perform the tests even if the files are in directories |
| `-c` | Disable color |
| `-s` | Disable searching Makefile and README.md |
| `-m` | When compiling library, test all the Makefile's rules (instead of doing only make re and checking if other rules exist). |
| `-l` | Disable compiling library |
| `-f` | Disable checking forbidden functions |
| `-n` | Disable norminette |
| `-u` | Disable checking updates at launch (already disabled by default in this fork) |
| `-p1` | Disable part 1 tests |
| `-p2` | Disable part 2 tests |
| `-p3` | Disable mandatory Part 3 (linked-list) tests |
| `-a` | Disable additional part tests |
| `-op1`| Do only part 1 tests |
| `-op2`| Do only part 2 tests |
| `-op3` | Do only mandatory Part 3 (linked-list) tests |
| `-oa` | Do only additional part tests |
| `ft_function` | Test only this function |

Add successively all options you want, in the order you want.
For example :
```bash
bash grademe.sh ft_atoi -f ft_strlen -n
```

### Supported functions
All the supported functions are listed [on this page](https://github.com/yusuke1225math2/libft-war-machine/blob/master/supported_functions.md).
## Contribution

Any suggestions or bugs reporting ?
Contact lmartin@student.42.fr

### Contributors
- jtoty : https://github.com/jtoty
- jmichaud : https://github.com/MrJe
- tlernoul

## Subject v19.2 changes

- Linked-list functions are mandatory Part 3 and use `ft_lst*.c` filenames.
- The file check expects the subject's README.md structure instead of `author`.
- `make bonus` is not required for the mandatory test run.
- `ft_calloc` is checked for zero-size, overflow, and distinct freeable allocations.
- Character classification tests require exact 0 or 1 return values.
- The old automatic update check is disabled by default to preserve local fork edits.
- This is an unofficial test suite; compare any disagreement with `en.subject.pdf`.
