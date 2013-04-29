Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:52982 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757150Ab3D2Me0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 08:34:26 -0400
Message-ID: <517E68BE.2060303@windriver.com>
Date: Mon, 29 Apr 2013 08:34:06 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH linux-next v2] fix make headers_install when path is too
 long
References: <20130426185709.GA13399@merkur.ravnborg.org> <1367237751-24962-1-git-send-email-nicolas.dichtel@6wind.com>
In-Reply-To: <1367237751-24962-1-git-send-email-nicolas.dichtel@6wind.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: sam@ravnborg.org, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On 13-04-29 08:15 AM, Nicolas Dichtel wrote:
> If headers_install is executed from a deep/long directory structure, the
> shell's maximum argument length can be execeeded, which breaks the operation
> with:
>
> | make[2]: execvp: /bin/sh: Argument list too long
> | make[2]: ***
>
> Instead of passing each files name with the entire path, I give only the file
> name without the source path and give this path as a new argument to
> headers_install.pl.
>
> Because there is three possible paths, I have tree input-files list, one per
> path.

This version still works for my test case.

Tested-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> ---
>
> v2: rebase patch on linux-next
>
>   scripts/Makefile.headersinst | 20 ++++++++++++++------
>   scripts/headers_install.sh   |  7 +++++--
>   2 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
> index 182084d..8ccf830 100644
> --- a/scripts/Makefile.headersinst
> +++ b/scripts/Makefile.headersinst
> @@ -47,18 +47,24 @@ header-y      := $(filter-out $(generic-y), $(header-y))
>   all-files     := $(header-y) $(genhdr-y) $(wrapper-files)
>   output-files  := $(addprefix $(installdir)/, $(all-files))
>
> -input-files   := $(foreach hdr, $(header-y), \
> +input-files1  := $(foreach hdr, $(header-y), \
>   		   $(if $(wildcard $(srcdir)/$(hdr)), \
> -			$(wildcard $(srcdir)/$(hdr)), \
> +			$(wildcard $(srcdir)/$(hdr))) \
> +		   )
> +input-files1-name := $(notdir $(input-files1))
> +input-files2  := $(foreach hdr, $(header-y), \
> +		   $(if  $(wildcard $(srcdir)/$(hdr)),, \
>   			$(if $(wildcard $(oldsrcdir)/$(hdr)), \
>   				$(wildcard $(oldsrcdir)/$(hdr)), \
>   				$(error Missing UAPI file $(srcdir)/$(hdr))) \
> -		   )) \
> -		 $(foreach hdr, $(genhdr-y), \
> +		   ))
> +input-files2-name := $(notdir $(input-files2))
> +input-files3  := $(foreach hdr, $(genhdr-y), \
>   		   $(if	$(wildcard $(gendir)/$(hdr)), \
>   			$(wildcard $(gendir)/$(hdr)), \
>   			$(error Missing generated UAPI file $(gendir)/$(hdr)) \
>   		   ))
> +input-files3-name := $(notdir $(input-files3))
>
>   # Work out what needs to be removed
>   oldheaders    := $(patsubst $(installdir)/%,%,$(wildcard $(installdir)/*.h))
> @@ -72,7 +78,9 @@ printdir = $(patsubst $(INSTALL_HDR_PATH)/%/,%,$(dir $@))
>   quiet_cmd_install = INSTALL $(printdir) ($(words $(all-files))\
>                               file$(if $(word 2, $(all-files)),s))
>         cmd_install = \
> -        $(CONFIG_SHELL) $< $(installdir) $(input-files); \
> +        $(CONFIG_SHELL) $< $(installdir) $(srcdir) $(input-files1-name); \
> +        $(CONFIG_SHELL) $< $(installdir) $(oldsrcdir) $(input-files2-name); \
> +        $(CONFIG_SHELL) $< $(installdir) $(gendir) $(input-files3-name); \
>           for F in $(wrapper-files); do                                   \
>                   echo "\#include <asm-generic/$$F>" > $(installdir)/$$F;    \
>           done;                                                           \
> @@ -98,7 +106,7 @@ __headersinst: $(subdirs) $(install-file)
>   	@:
>
>   targets += $(install-file)
> -$(install-file): scripts/headers_install.sh $(input-files) FORCE
> +$(install-file): scripts/headers_install.sh $(input-files1) $(input-files2) $(input-files3) FORCE
>   	$(if $(unwanted),$(call cmd,remove),)
>   	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
>   	$(call if_changed,install)
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 643764f..5de5660 100644
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -2,7 +2,7 @@
>
>   if [ $# -lt 1 ]
>   then
> -	echo "Usage: headers_install.sh OUTDIR [FILES...]
> +	echo "Usage: headers_install.sh OUTDIR SRCDIR [FILES...]
>   	echo
>   	echo "Prepares kernel header files for use by user space, by removing"
>   	echo "all compiler.h definitions and #includes, removing any"
> @@ -10,6 +10,7 @@ then
>   	echo "asm/inline/volatile keywords."
>   	echo
>   	echo "OUTDIR: directory to write each userspace header FILE to."
> +	echo "SRCDIR: source directory where files are picked."
>   	echo "FILES:  list of header files to operate on."
>
>   	exit 1
> @@ -19,6 +20,8 @@ fi
>
>   OUTDIR="$1"
>   shift
> +SRCDIR="$1"
> +shift
>
>   # Iterate through files listed on command line
>
> @@ -34,7 +37,7 @@ do
>   		-e 's/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((packed))\2/g' \
>   		-e 's/(^|[ \t(])(inline|asm|volatile)([ \t(]|$)/\1__\2__\3/g' \
>   		-e 's@#(ifndef|define|endif[ \t]*/[*])[ \t]*_UAPI@#\1 @' \
> -		"$i" > "$OUTDIR/$FILE.sed" || exit 1
> +		"$SRCDIR/$i" > "$OUTDIR/$FILE.sed" || exit 1
>   	scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ "$OUTDIR/$FILE.sed" \
>   		> "$OUTDIR/$FILE"
>   	[ $? -gt 1 ] && exit 1
>

