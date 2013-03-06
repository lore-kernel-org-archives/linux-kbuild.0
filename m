Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:49995 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751027Ab3CFQvO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Mar 2013 11:51:14 -0500
Message-ID: <513773C0.5010309@windriver.com>
Date: Wed, 6 Mar 2013 11:50:08 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: Re: make headers_install fail when path is too long
References: <51372591.1090606@6wind.com> <20130306161026.GA13449@merkur.ravnborg.org> <51376E6C.4040903@6wind.com>
In-Reply-To: <51376E6C.4040903@6wind.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nicolas.dichtel@6wind.com
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On 13-03-06 11:27 AM, Nicolas Dichtel wrote:
> Le 06/03/2013 17:10, Sam Ravnborg a écrit :
>> On Wed, Mar 06, 2013 at 12:16:33PM +0100, Nicolas Dichtel wrote:
>>> This problem has probably already been reported, but I don't find the
>>> fix
>>> in a kernel.org tree and I don't understand why.
>>
>> First time I see this bug described - but I may missed it here at kbuild.
> It's probably why I didn't find this on a linux kernel mailing list ;-)

And it's been on my TODO list to float this as a RFC to the kbuild lists
before 3.9 arrived .. a goal that I managed to miss (again).

The patch in question has us up and installing headers on Yocto kernel/
kernel header packages greater than 3.7, so it has received a decent
amount of testing.

As for it being the perfect approach, I only claim that it works in
the environment that I've been using and it is functional.

If this change turns out to be acceptable, that's great. I can also
spend time re-working as appropriate .. or someone else's solution
can be adopted.

In the end it's a win and a fix, and the thread has prompted me to
get the change floated :)

Cheers,

Bruce

>
>> If a patch exists then please include the patch in your mail so we can
>> see it and comment on it.
>>
>> And make sure to have the attribution correct if you consider it to
>> be applied.
> I'm not the author of the patch, I've found it on the web. Here it is:
>
>  From cb9c811b8f23277de95dc687e87c6859308e68e6 Mon Sep 17 00:00:00 2001
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date: Wed, 6 Mar 2013 17:23:51 +0100
> Subject: [PATCH] scripts/Makefile.headersinst: install headers from scratch
>   file
>
> If headers_install is executed from a deep/long directory structure, the
> shell's maximum argument length can be execeeded, which breaks the
> operation
> with:
>
> | make[2]: execvp: /bin/sh: Argument list too long
> | make[2]: ***
>
> By dumping the input files to a scratch file and using xargs to read the
> input list from the scratch file, we can avoid blowing out the maximum
> argument size and install headers in a long path name environment.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   scripts/Makefile.headersinst | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
> index 25f216a..c481986 100644
> --- a/scripts/Makefile.headersinst
> +++ b/scripts/Makefile.headersinst
> @@ -71,7 +71,7 @@ printdir = $(patsubst $(INSTALL_HDR_PATH)/%/,%,$(dir $@))
>   quiet_cmd_install = INSTALL $(printdir) ($(words $(all-files))\
>                               file$(if $(word 2, $(all-files)),s))
>         cmd_install = \
> -        $(PERL) $< $(installdir) $(SRCARCH) $(input-files); \
> +        xargs $(PERL) $< $(installdir) $(SRCARCH) <
> $(INSTALL_HDR_PATH)/.input-files; \
>           for F in $(wrapper-files); do                                   \
>                   echo "\#include <asm-generic/$$F>" >
> $(installdir)/$$F;    \
>           done;                                                           \
> @@ -100,7 +100,9 @@ targets += $(install-file)
>   $(install-file): scripts/headers_install.pl $(input-files) FORCE
>       $(if $(unwanted),$(call cmd,remove),)
>       $(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
> +    @echo $(input-files) > $(INSTALL_HDR_PATH)/.input-files
>       $(call if_changed,install)
> +    @rm $(INSTALL_HDR_PATH)/.input-files
>
>   else
>   __headerscheck: $(subdirs) $(check-file)

