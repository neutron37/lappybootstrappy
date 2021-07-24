#!/usr/bin/env bash
# <<YAMLDOC
# namespace: /neutron37/lappybootstrappy
# description: "Content Project"
# copyright: "Neutron37"
# authors: "neutron37@hauskreativ.com"
# tags: bootstrap macbook laptop docker
# YAMLDOC

##################################################################
# START bashlib boilerplate.                                     #
# See https://github.com/neutron37/bashlib/blob/master/README.md #
##################################################################
trap 'echo "Aborting  due to errexit on line $LINENO. Exit code: $?" >&2' ERR
set -euo pipefail
BASHLIB_SOURCE="${BASH_SOURCE[0]}"
while [ -h "${BASHLIB_SOURCE}" ]; do
  # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P $( dirname ${BASHLIB_SOURCE} ) && pwd )
  BSOURCE=$( readlink "${BASHLIB_SOURCE}" );
  [[ $BASHLIB_SOURCE != /* ]] && SOURCE="${DIR}/${BASHLIB_SOURCE}"
done
BASHLIB_THIS_DIR=$( dirname ${BASHLIB_SOURCE} )
export BASHLIB_THIS_DIR=$( cd -P $BASHLIB_THIS_DIR && pwd )

export BASHLIB_DIR="${BASHLIB_THIS_DIR}/src/bashlib"
if [ ! -d "${BASHLIB_DIR}" ]; then
  echo "------------------------------------------------------------"
  echo "Installing neutron37 bashlib."
  cd "${BASHLIB_THIS_DIR}/src"
  git clone https://github.com/neutron37/bashlib.git
  echo "------------------------------------------------------------"
fi
# Be sure to customize $BASHLIB_PROJECT_DIR for your project.
export BASHLIB_PROJECT_DIR=$( cd -P $BASHLIB_THIS_DIR/.. && pwd )
source "${BASHLIB_DIR}/bashlib.sh"
##################################################################
# END bashlib boilerplate.                                       #
##################################################################

lbs::logo() {
  echo -n "${STYLE_MAGENTA}"
  cat <<"EOF"

  ┏━━━━━━━━━━━━━━┓
  ┃  LAPPY _/    ┃
  ┃  BOOTSTRAPPY ┃
  ┗━━━━━━━━━━━━━━┛
EOF
  echo "   ©$( date +%Y ) Neutron37"
  echo "${STYLE_NORMAL}"
}

lbs::help() {
  lbs::logo
  bashlib::msg_stdout "   usage:  ${STYLE_BOLD}lapybootstrappy.sh <hostname>${STYLE_NORMAL}"
  bashlib::exit_success ""
}

##########
## Args ##
##########
if [ -z "$*" ]; then
  lbs::help
fi

HOSTNAME="$1"

##########
## Main ##
##########

if [ -z ${@+x} ]; then
  lbs::help
fi

trap '' ERR

lbs::logo
$BASHLIB_SRC_DIR/macos_install_susudoio.sh
~/.local/bin/susudoio -a src/macos_install.sh $HOSTNAME
open '/Applications/Docker.app'
open '/Applications/Alfred 4.app'
open '/Applications/Little Snitch.app'
open '/Applications/Micro Snitch.app'
open '/Applications/Rectangle.app'

echo
echo "Secure that shit, Hudson!"
echo " * https://bash-prompt.net/guides/bash-ssh-yubikey/"
echo " * https://aditsachde.com/posts/yubikey-ssh/"
echo " * https://github.com/vorburger/vorburger.ch-Notes/blob/develop/security/ed25519-sk.md"
echo " * https://github.com/drduh/macOS-Security-and-Privacy-Guide"
echo " * https://github.com/drduh/YubiKey-Guide"

exit "$?"