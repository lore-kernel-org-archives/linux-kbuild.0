Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:36362 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905Ab1KSGvl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 19 Nov 2011 01:51:41 -0500
Received: by yenq3 with SMTP id q3so3237041yen.19
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Nov 2011 22:51:40 -0800 (PST)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
Date: Sat, 19 Nov 2011 01:51:30 -0500
Message-Id: <1321685490-11706-1-git-send-email-lacombar@gmail.com>
In-Reply-To: <1321567131.25715.32.camel@work-vm>
References: <1321567131.25715.32.camel@work-vm>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: John Stultz <johnstul@us.ibm.com>
Cc: Arnaud Lacombe <lacombar@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi,

On Thu, Nov 17, 2011 at 4:58 PM, john stultz <johnstul@us.ibm.com> wrote:
> [...]
>
> v2:
>  * Reworked to use alldefconfig instead of the proposed
> olddefconfig as suggested by Sam Ravnborg.
>
> v3:
>  * Script improvements from Dmitri.
>  * allnoconfig option from Darren
>  * pre-make exit option from Darren
>  * lots of other fixes/cleanups from Darren.
>  * Fix final check to not compain about config values in comments
>
If Dmitri and Darren have direct contribution to the script, shouldn't their
Signed-off-by tag be present ?

> Please let me know if you have any comments or thoughts!
>
> CC: Sam Ravnborg <sam@ravnborg.org>
> CC: gthelen@google.com
> CC: tartler@cs.fau.de
> CC: Dmitry Fink <Dmitry.Fink@palm.com>
> CC: Darren Hart <dvhart@linux.intel.com>
> CC: Eric B Munson <ebmunson@us.ibm.com>
> CC: Bruce Ashfield <Bruce.Ashfield@windriver.com>
> CC: Michal Marek <mmarek@suse.cz>
> CC: linux-kbuild@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

You'll find below some more nits

1) bail out early on error.

This fixes handling of non-existant file:

Before:
    % sh scripts/kconfig/merge_config.sh non existant files
    Merging non
    sed: can't read non: No such file or directory
    cat: non: No such file or directory
    Merging existant
    sed: can't read existant: No such file or directory
    cat: existant: No such file or directory
    Merging files
    sed: can't read files: No such file or directory
    cat: files: No such file or directory
    scripts/kconfig/conf --alldefconfig Kconfig
    #
    # configuration written to .config
    #

After:

    % sh scripts/kconfig/merge_config.sh non existant files
    Merging non
    sed: can't read non: No such file or directory

2) re-implement argument parsing using sh(1) getopts builtin

3) verify that the script was given enough argument to proceed. There isn't
much point running the script with less than 2 arguments.

CC: Sam Ravnborg <sam@ravnborg.org>
CC: gthelen@google.com
CC: tartler@cs.fau.de
CC: Dmitry Fink <Dmitry.Fink@palm.com>
CC: Darren Hart <dvhart@linux.intel.com>
CC: Eric B Munson <ebmunson@us.ibm.com>
CC: Bruce Ashfield <Bruce.Ashfield@windriver.com>
CC: Michal Marek <mmarek@suse.cz>
CC: linux-kbuild@vger.kernel.org
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/merge_config.sh |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 890276b..abfd8b2 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -20,6 +20,8 @@
 #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 #  See the GNU General Public License for more details.
 
+set -e
+
 clean_up() {
        rm -f $TMP_FILE
        exit
@@ -36,29 +38,27 @@ usage() {
 MAKE=true
 ALLTARGET=alldefconfig
 
-while true; do
-	case $1 in
-	"-n")
+while getopts "nmh" opt; do
+	case ${opt} in
+	n)
 		ALLTARGET=allnoconfig
-		shift
-		continue
 		;;
-	"-m")
+	m)
 		MAKE=false
-		shift
-		continue
 		;;
-	"-h")
+	h)
 		usage
 		exit
 		;;
-	*)
-		break
-		;;
 	esac
 done
 
+shift $(expr $OPTIND - 1)
 
+if [ $# -lt 2 ]; then
+	usage
+	exit 1
+fi
 
 MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
-- 
1.7.6.153.g78432

