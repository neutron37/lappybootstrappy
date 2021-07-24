#!/bin/bash

##################################################################
##################################################################
# START bashlib include boilerplate.                             #
# See https://github.com/neutron37/bashlib/blob/master/README.md #
##################################################################
BASHLIB_SOURCE="${BASH_SOURCE[0]}"
while [ -h "${BASHLIB_SOURCE}" ]; do
  # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P $( dirname ${BASHLIB_SOURCE} ) && pwd )
  BSOURCE=$( readlink "${BASHLIB_SOURCE}" );
  [[ $BASHLIB_SOURCE != /* ]] && SOURCE="${DIR}/${BASHLIB_SOURCE}"
done
BASHLIB_THIS_DIR=$( dirname ${BASHLIB_SOURCE} )
export BASHLIB_THIS_DIR=$( cd -P $BASHLIB_THIS_DIR && pwd )
export BASHLIB_DIR=$( cd -P "${BASHLIB_THIS_DIR}/bashlib" && pwd )
source "${BASHLIB_DIR}/bashlib.sh"
##################################################################
# END bashlib include boilerplate.                               #
##################################################################

bashlib::check_admin

if [ -z ${SUSUDOIO_TARGET+x} ]; then
  echo "$STYLE_RED This script must be invoked via susudoio.$STYLE_NORMAL"
  exit 37
fi

if [ ! -f /opt/homebrew/bin/brew ]; then
  echo "Installing homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$SUSUDOIO_TARGET/.zprofile
fi

# Make extra sure that brew is available.
eval "$(/opt/homebrew/bin/brew shellenv)"

HOSTNAME=$1

bash $BASHLIB_THIS_DIR/macos_tasks_0_su.sh $HOSTNAME
bash $BASHLIB_THIS_DIR/macos_tasks_1_admin.sh
sudo -H -u $SUSUDOIO_TARGET bash $BASHLIB_THIS_DIR/macos_tasks_2_user.sh
