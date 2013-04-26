Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:65356 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753071Ab3DZSO5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Apr 2013 14:14:57 -0400
Message-ID: <517AC412.9020505@windriver.com>
Date: Fri, 26 Apr 2013 14:14:42 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH] fix make headers_install when path is too long
References: <513895F9.2050900@windriver.com> <1366994198-30550-1-git-send-email-nicolas.dichtel@6wind.com>
In-Reply-To: <1366994198-30550-1-git-send-email-nicolas.dichtel@6wind.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: mmarek@suse.cz, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On 13-04-26 12:36 PM, Nicolas Dichtel wrote:
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

This will work. I considered the same option when I solved the similar
problem for Yocto installs, but managed to avoid it with a shorter
term fixed.

>
> Because there is three possible path, I have tree input-files list, one per
> path.
>
> Signed-off-by: Nicolas Dichtel<nicolas.dichtel@6wind.com>

Tested-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Bruce

> ---
>
> I come back to this issue. Here is another proposal to fix this pb.
> Comments are welcome.
>
>   scripts/Makefile.headersinst | 20 ++++++++++++++------
>   scripts/headers_install.pl   |  8 ++++----
>   2 files changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/Makefile.headersinst b/scripts/Makefile.headersinst
> index 477d137..fbadfc3 100644
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
> -        $(PERL) $<  $(installdir) $(SRCARCH) $(input-files); \
> +        $(PERL) $<  $(installdir) $(SRCARCH) $(srcdir) $(input-files1-name); \
> +        $(PERL) $<  $(installdir) $(SRCARCH) $(oldsrcdir) $(input-files2-name); \
> +        $(PERL) $<  $(installdir) $(SRCARCH) $(gendir) $(input-files3-name); \
>           for F in $(wrapper-files); do                                   \
>                   echo "\#include<asm-generic/$$F>">  $(installdir)/$$F;    \
>           done;                                                           \
> @@ -98,7 +106,7 @@ __headersinst: $(subdirs) $(install-file)
>   	@:
>
>   targets += $(install-file)
> -$(install-file): scripts/headers_install.pl $(input-files) FORCE
> +$(install-file): scripts/headers_install.pl $(input-files1) $(input-files2) $(input-files3) FORCE
>   	$(if $(unwanted),$(call cmd,remove),)
>   	$(if $(wildcard $(dir $@)),,$(shell mkdir -p $(dir $@)))
>   	$(call if_changed,install)
> diff --git a/scripts/headers_install.pl b/scripts/headers_install.pl
> index 581ca99..87d9700 100644
> --- a/scripts/headers_install.pl
> +++ b/scripts/headers_install.pl
> @@ -3,7 +3,7 @@
>   # headers_install prepare the listed header files for use in
>   # user space and copy the files to their destination.
>   #
> -# Usage: headers_install.pl readdir installdir arch [files...]
> +# Usage: headers_install.pl readdir installdir arch srcdir [files...]
>   # installdir: dir to install the files to
>   # arch:       current architecture
>   #             arch is used to force a reinstallation when the arch
> @@ -17,7 +17,7 @@
>
>   use strict;
>
> -my ($installdir, $arch, @files) = @ARGV;
> +my ($installdir, $arch, $srcdir, @files) = @ARGV;
>
>   my $unifdef = "scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__";
>
> @@ -27,8 +27,8 @@ foreach my $filename (@files) {
>
>   	my $tmpfile = "$installdir/$file.tmp";
>
> -	open(my $in, '<', $filename)
> -	    or die "$filename: $!\n";
> +	open(my $in, '<', "$srcdir/$filename")
> +	    or die "$srcdir/$filename: $!\n";
>   	open(my $out, '>', $tmpfile)
>   	    or die "$tmpfile: $!\n";
>   	while (my $line =<$in>) {

