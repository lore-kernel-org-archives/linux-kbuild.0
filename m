Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:20368 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751163Ab1KUSWc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 13:22:32 -0500
Message-ID: <4ECA96EA.5070509@linux.intel.com>
Date: Mon, 21 Nov 2011 10:22:34 -0800
From: Darren Hart <dvhart@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
References: <1321567131.25715.32.camel@work-vm> <CACqU3MXg8L7O0UT1ow3pVyM+NJTjjyABW2D6LLFWYSDWy6XEiw@mail.gmail.com> <1321570492.25715.45.camel@work-vm> <CACqU3MWBDHJoAA5RfOdELDw-ZgsQh0f5aUPtJ4vMi-DnhjSvqQ@mail.gmail.com>
In-Reply-To: <CACqU3MWBDHJoAA5RfOdELDw-ZgsQh0f5aUPtJ4vMi-DnhjSvqQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: john stultz <johnstul@us.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org



On 11/18/2011 10:24 PM, Arnaud Lacombe wrote:
> Hi,
> 
> On Thu, Nov 17, 2011 at 5:54 PM, john stultz <johnstul@us.ibm.com> wrote:
>> On Thu, 2011-11-17 at 17:44 -0500, Arnaud Lacombe wrote:
>>> Hi,
>>>
>>> On Thu, Nov 17, 2011 at 4:58 PM, john stultz <johnstul@us.ibm.com> wrote:
>>>> Hey Andrew,
>>>>        I've tried sending this via Michal a few times, but haven't heard much
>>>> back. So I wanted to check if you would consider merging it via your
>>>> tree, or if you had any suggestions of who would be better to
>>>> review/merge this.
>>>>
>>> One of the worry I would have is that the script is merging config
>>> blindly, ie. there is no dependency checking done. I have some some
>>> work-in-progress to help resolving this, but still lots of thought to
>>> be implemented.
>>
>> So the script actually does warn you if a specified option is dropped
>> due to missing dependencies or if the option is removed.  So, I guess
>> could you clarify your concern a bit more?
>>
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
> 
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

These look like good changes to me. We made several optimizations along
these lines, but I confess performance was not my top priority while
working with John on this script.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
