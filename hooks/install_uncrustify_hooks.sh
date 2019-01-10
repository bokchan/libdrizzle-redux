#!/bin/sh
#
# Wraps the scripts developed by David Martin to install
# git pre commit hook for uncrustify
#
# For more information on the scripts please refer to:
#
# Link:    https://github.com/ddddavidmartin/Pre-commit-hooks
# Contact: David Martin, ddddavidmartin@fastmail.com

cd `dirname $0`

# Clone the git repository
git clone git@github.com:ddddavidmartin/Pre-commit-hooks.git

# Copy the configuration files into the cloned repo
cp "./pre-commit.cfg" "./pre-commit-uncrustify.cfg" \
"`pwd`/Pre-commit-hooks/"

# Run install script
./Pre-commit-hooks/install_hooks.sh $PWD/..

# Remove cloned repo
rm -rf Pre-commit-hooks

cd - > /dev/null

# Check if uncrustify is installed
if ! type "uncrustify" > /dev/null 2>&1
then
  cat << EOF

'uncrustify' is not found!

If 'uncrustify' is installed please set the correct path
for the setting UNCRUSTIFY in the file:

  PROJ_ROOT/.git/hooks/pre-commit-uncrustify.cfg

Else please visit 'http://uncrustify.sourceforge.net' and
follow the instructions on how to install the program
EOF
fi
