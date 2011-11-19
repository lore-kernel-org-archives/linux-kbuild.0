Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:57111 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861Ab1KSGYd convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 19 Nov 2011 01:24:33 -0500
Received: by wwe5 with SMTP id 5so6598930wwe.1
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Nov 2011 22:24:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1321570492.25715.45.camel@work-vm>
References: <1321567131.25715.32.camel@work-vm>
	<CACqU3MXg8L7O0UT1ow3pVyM+NJTjjyABW2D6LLFWYSDWy6XEiw@mail.gmail.com>
	<1321570492.25715.45.camel@work-vm>
Date: Sat, 19 Nov 2011 01:24:32 -0500
Message-ID: <CACqU3MWBDHJoAA5RfOdELDw-ZgsQh0f5aUPtJ4vMi-DnhjSvqQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: john stultz <johnstul@us.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi,

On Thu, Nov 17, 2011 at 5:54 PM, john stultz <johnstul@us.ibm.com> wrote:
> On Thu, 2011-11-17 at 17:44 -0500, Arnaud Lacombe wrote:
>> Hi,
>>
>> On Thu, Nov 17, 2011 at 4:58 PM, john stultz <johnstul@us.ibm.com> wrote:
>> > Hey Andrew,
>> >        I've tried sending this via Michal a few times, but haven't heard much
>> > back. So I wanted to check if you would consider merging it via your
>> > tree, or if you had any suggestions of who would be better to
>> > review/merge this.
>> >
>> One of the worry I would have is that the script is merging config
>> blindly, ie. there is no dependency checking done. I have some some
>> work-in-progress to help resolving this, but still lots of thought to
>> be implemented.
>
> So the script actually does warn you if a specified option is dropped
> due to missing dependencies or if the option is removed.  So, I guess
> could you clarify your concern a bit more?
>
well, assuming the following Kconfig's snippet:

choice
        bool "choice"
config A
        bool "A"
config B
        bool "B"
endchoice

and trying to merge:

 - `config1':

CONFIG_A=y

 - `config2':

Result in:

 % sh scripts/kconfig/merge_config.sh config1 config2
Merging config1
Merging config2
scripts/kconfig/conf --alldefconfig Kconfig
./.tmp.config.uMY8Z97l9T:2:warning: override: B changes choice state
#
# configuration written to .config
#

% cat .config
#
# Automatically generated file; DO NOT EDIT.
# Linux Kernel Configuration
#
# CONFIG_A is not set
CONFIG_B=y

so we still get the warning from the incantation of `alldefconfig',
but the one in the script is defeated.

Moreover, there might still be performance optimization to realize,
considering a base 'defconfig' amended by disabling
CONFIG_DECOMPRESS_GZIP, we get:

% time sh scripts/kconfig/merge_config.sh base amend
Merging base
Merging amend
Value of CONFIG_DECOMPRESS_GZIP is redefined by fragment amend:
Previous value: CONFIG_DECOMPRESS_GZIP=y
New value: # CONFIG_DECOMPRESS_GZIP is not set

scripts/kconfig/conf --alldefconfig Kconfig
#
# configuration written to .config
#
sh scripts/kconfig/merge_config.sh base amend  158.20s user 30.19s
system 100% cpu 3:07.86 total

Just by getting rid of the two `| grep ...' in the last step:

--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -104,8 +104,8 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $ALLTARGET
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do

-       REQUESTED_VAL=$(sed -n "$SED_CONFIG_EXP" $TMP_FILE | grep -w -e "$CFG")
-       ACTUAL_VAL=$(sed -n "$SED_CONFIG_EXP" .config | grep -w -e "$CFG")
+       REQUESTED_VAL=$(sed -n "/\<$CFG\>/!d; $SED_CONFIG_EXP" $TMP_FILE)
+       ACTUAL_VAL=$(sed -n "/\<$CFG\>/!d; $SED_CONFIG_EXP" .config)
        if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
                echo "Value requested for $CFG not in final .config"
                echo "Requested value:  $REQUESTED_VAL"

we get:

sh scripts/kconfig/merge_config.sh base amend  23.20s user 22.30s
system 94% cpu 48.033 total

Btw, there is other nits in the scripts I'll comment separately.

 - Arnaud
