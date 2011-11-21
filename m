Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e4.ny.us.ibm.com ([32.97.182.144]:40367 "EHLO e4.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756381Ab1KUWHh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 17:07:37 -0500
Received: from /spool/local
	by e4.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <john.stultz@linaro.org>;
	Mon, 21 Nov 2011 17:07:34 -0500
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id pALM6ewc3424330
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 17:06:41 -0500
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id pALM6D2T014786
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 15:06:15 -0700
Message-ID: <1321913170.6445.23.camel@work-vm>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 21 Nov 2011 14:06:10 -0800
In-Reply-To: <1321685490-11706-1-git-send-email-lacombar@gmail.com>
References: <1321567131.25715.32.camel@work-vm>
	 <1321685490-11706-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sat, 2011-11-19 at 01:51 -0500, Arnaud Lacombe wrote:
> Hi,
> 
> On Thu, Nov 17, 2011 at 4:58 PM, john stultz <johnstul@us.ibm.com> wrote:
> > [...]
> >
> > v2:
> >  * Reworked to use alldefconfig instead of the proposed
> > olddefconfig as suggested by Sam Ravnborg.
> >
> > v3:
> >  * Script improvements from Dmitri.
> >  * allnoconfig option from Darren
> >  * pre-make exit option from Darren
> >  * lots of other fixes/cleanups from Darren.
> >  * Fix final check to not compain about config values in comments
> >
> If Dmitri and Darren have direct contribution to the script, shouldn't their
> Signed-off-by tag be present ?

Dmitri didn't provide a Signed-off-by, and I had reworked things
sufficiently that his patch didn't apply, so I re-implemented many of
the suggested improvements myself. However, Dmitri deserves the credits
for pointing the issues out.

Similarly, with Darren, there were a number of non-signed-off-by'ed
changes, I had to merge in by hand due to my folding of my own work in.
But there were also a few proper patches from Darren that I did fold in
and should have preserved his Signed-off-by. That was sloppy, so my
apologies. Its now fixed in my tree.

> You'll find below some more nits
> 
> 1) bail out early on error.
> 
> This fixes handling of non-existant file:
> 
> Before:
>     % sh scripts/kconfig/merge_config.sh non existant files
>     Merging non
>     sed: can't read non: No such file or directory
>     cat: non: No such file or directory
>     Merging existant
>     sed: can't read existant: No such file or directory
>     cat: existant: No such file or directory
>     Merging files
>     sed: can't read files: No such file or directory
>     cat: files: No such file or directory
>     scripts/kconfig/conf --alldefconfig Kconfig
>     #
>     # configuration written to .config
>     #
> 
> After:
> 
>     % sh scripts/kconfig/merge_config.sh non existant files
>     Merging non
>     sed: can't read non: No such file or directory
> 
> 2) re-implement argument parsing using sh(1) getopts builtin
> 
> 3) verify that the script was given enough argument to proceed. There isn't
> much point running the script with less than 2 arguments.
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
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

Thanks for these great cleanups and feedback!

Acked-by: John Stultz <john.stultz@linaro.org>

I've queued these (along with your and Darren's other changes).

thanks
-john

> ---
>  scripts/kconfig/merge_config.sh |   24 ++++++++++++------------
>  1 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 890276b..abfd8b2 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -20,6 +20,8 @@
>  #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>  #  See the GNU General Public License for more details.
> 
> +set -e
> +
>  clean_up() {
>         rm -f $TMP_FILE
>         exit
> @@ -36,29 +38,27 @@ usage() {
>  MAKE=true
>  ALLTARGET=alldefconfig
> 
> -while true; do
> -	case $1 in
> -	"-n")
> +while getopts "nmh" opt; do
> +	case ${opt} in
> +	n)
>  		ALLTARGET=allnoconfig
> -		shift
> -		continue
>  		;;
> -	"-m")
> +	m)
>  		MAKE=false
> -		shift
> -		continue
>  		;;
> -	"-h")
> +	h)
>  		usage
>  		exit
>  		;;
> -	*)
> -		break
> -		;;
>  	esac
>  done
> 
> +shift $(expr $OPTIND - 1)
> 
> +if [ $# -lt 2 ]; then
> +	usage
> +	exit 1
> +fi
> 
>  MERGE_LIST=$*
>  SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"


