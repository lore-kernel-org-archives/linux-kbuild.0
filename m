Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:56844 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753044Ab1KUXaX (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 18:30:23 -0500
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <johnstul@us.ibm.com>;
	Mon, 21 Nov 2011 16:30:22 -0700
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id pALNTThR059138
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 16:29:29 -0700
Received: from d03av05.boulder.ibm.com (loopback [127.0.0.1])
	by d03av05.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id pALNTRWg001485
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 16:29:29 -0700
Message-ID: <1321918165.6445.42.camel@work-vm>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: john stultz <johnstul@us.ibm.com>
Date: Mon, 21 Nov 2011 15:29:25 -0800
In-Reply-To: <CACqU3MWBDHJoAA5RfOdELDw-ZgsQh0f5aUPtJ4vMi-DnhjSvqQ@mail.gmail.com>
References: <1321567131.25715.32.camel@work-vm>
	 <CACqU3MXg8L7O0UT1ow3pVyM+NJTjjyABW2D6LLFWYSDWy6XEiw@mail.gmail.com>
	 <1321570492.25715.45.camel@work-vm>
	 <CACqU3MWBDHJoAA5RfOdELDw-ZgsQh0f5aUPtJ4vMi-DnhjSvqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sat, 2011-11-19 at 01:24 -0500, Arnaud Lacombe wrote:
> Hi,
> 
> On Thu, Nov 17, 2011 at 5:54 PM, john stultz <johnstul@us.ibm.com> wrote:
> > On Thu, 2011-11-17 at 17:44 -0500, Arnaud Lacombe wrote:
> >> Hi,
> >>
> >> On Thu, Nov 17, 2011 at 4:58 PM, john stultz <johnstul@us.ibm.com> wrote:
> >> > Hey Andrew,
> >> >        I've tried sending this via Michal a few times, but haven't heard much
> >> > back. So I wanted to check if you would consider merging it via your
> >> > tree, or if you had any suggestions of who would be better to
> >> > review/merge this.
> >> >
> >> One of the worry I would have is that the script is merging config
> >> blindly, ie. there is no dependency checking done. I have some some
> >> work-in-progress to help resolving this, but still lots of thought to
> >> be implemented.
> >
> > So the script actually does warn you if a specified option is dropped
> > due to missing dependencies or if the option is removed.  So, I guess
> > could you clarify your concern a bit more?
> >
> well, assuming the following Kconfig's snippet:
> 
> choice
>         bool "choice"
> config A
>         bool "A"
> config B
>         bool "B"
> endchoice
> 
> and trying to merge:
> 
>  - `config1':
> 
> CONFIG_A=y
> 
>  - `config2':
> 
> Result in:
> 
>  % sh scripts/kconfig/merge_config.sh config1 config2
> Merging config1
> Merging config2
> scripts/kconfig/conf --alldefconfig Kconfig
> ./.tmp.config.uMY8Z97l9T:2:warning: override: B changes choice state
> #
> # configuration written to .config
> #
> 
> % cat .config
> #
> # Automatically generated file; DO NOT EDIT.
> # Linux Kernel Configuration
> #
> # CONFIG_A is not set
> CONFIG_B=y
> 
> so we still get the warning from the incantation of `alldefconfig',
> but the one in the script is defeated.
> 
> Moreover, there might still be performance optimization to realize,
> considering a base 'defconfig' amended by disabling
> CONFIG_DECOMPRESS_GZIP, we get:
> 
> % time sh scripts/kconfig/merge_config.sh base amend
> Merging base
> Merging amend
> Value of CONFIG_DECOMPRESS_GZIP is redefined by fragment amend:
> Previous value: CONFIG_DECOMPRESS_GZIP=y
> New value: # CONFIG_DECOMPRESS_GZIP is not set
> 
> scripts/kconfig/conf --alldefconfig Kconfig
> #
> # configuration written to .config
> #
> sh scripts/kconfig/merge_config.sh base amend  158.20s user 30.19s
> system 100% cpu 3:07.86 total

Yep. So you've caught a bug! Thanks for pointing this out!

> Just by getting rid of the two `| grep ...' in the last step:
> 
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -104,8 +104,8 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $ALLTARGET
>  # Check all specified config values took (might have missed-dependency issues)
>  for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
> 
> -       REQUESTED_VAL=$(sed -n "$SED_CONFIG_EXP" $TMP_FILE | grep -w -e "$CFG")
> -       ACTUAL_VAL=$(sed -n "$SED_CONFIG_EXP" .config | grep -w -e "$CFG")
> +       REQUESTED_VAL=$(sed -n "/\<$CFG\>/!d; $SED_CONFIG_EXP" $TMP_FILE)
> +       ACTUAL_VAL=$(sed -n "/\<$CFG\>/!d; $SED_CONFIG_EXP" .config)
>         if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
>                 echo "Value requested for $CFG not in final .config"
>                 echo "Requested value:  $REQUESTED_VAL"

So, its not the greps in my mind that are the issue, its the
SED_CONF_EXP lines. Those shouldn't be applied to the REQUESTED and
ACTUAL values, since they would strip out any difference between the
two, causing the comparison to be moot.

I was trying to fix the script from complaining like:
	Value requested for CONFIG_EXPERT not in final .config
	Requested value:  # CONFIG_EXPERT=y
	Actual value:     # CONFIG_EXPERT is not set

But clearly the change was wrong.

Anyway, reverting back to something like the following should fix it:

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index b146b76..adac068 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -105,8 +105,8 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $ALLTARGET
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 
-	REQUESTED_VAL=$(sed -n "$SED_CONFIG_EXP" $TMP_FILE | grep -w -e "$CFG")
-	ACTUAL_VAL=$(sed -n "$SED_CONFIG_EXP" .config | grep -w -e "$CFG")
+	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
+	ACTUAL_VAL=$(grep -w -e "$CFG" .config)
 	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
 		echo "Value requested for $CFG not in final .config"
 		echo "Requested value:  $REQUESTED_VAL"


Andrew: Would you prefer small fixes ontop of the patch you took, or
just a new patch that includes this along with Darren's and Arnaud's
fixes? 

thanks
-john

