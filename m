Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44850 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752107Ab0ADNss (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2010 08:48:48 -0500
Message-ID: <4B41F1BD.8050603@suse.cz>
Date: Mon, 04 Jan 2010 14:48:45 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: really fix bzImage build with non-bash sh
References: <bug-14848-10286@http.bugzilla.kernel.org/> <20091222154935.5da4be37.akpm@linux-foundation.org> <20091228193827.GA2157@localhost>
In-Reply-To: <20091228193827.GA2157@localhost>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: sd@sedf.de, Andrew Morton <akpm@linux-foundation.org>, Michael Tokarev <mjt@tls.msk.ru>, Alek Du <alek.du@intel.com>, linux-kbuild@vger.kernel.org, Michael Guntsche <mike@it-loops.com>

On 28.12.2009 20:38, Jonathan Nieder wrote:
> In an x86 build with CONFIG_KERNEL_LZMA enabled and dash as sh,
> arch/x86/boot/compressed/vmlinux.bin.lzma ends with
> '\xf0\x7d\x39\x00' (16 bytes) instead of the 4 bytes intended and
> the resulting vmlinuz fails to boot.  This improves on the
> previous behavior, in which the file contained the characters
> '-ne ' as well, but not by much.
> 
> Previous commits replaced "echo -ne" first with "/bin/echo -ne",
> then "printf" in the hope of improving portability, but none of
> these commands is guaranteed to support hexadecimal escapes on
> POSIX systems.  So use the shell to convert from hexadecimal to
> octal.
> 
> With this change, an LZMA-compressed kernel built with dash as sh
> boots correctly again.
> 
> Reported-by: sd@sedf.de
> Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: Michael Tokarev <mjt@tls.msk.ru>
> Cc: Alek Du <alek.du@intel.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
> Andrew Morton wrote:
> 
>> switched to email.
> 
> Thanks.
> 
> sd@sedf.de reported through <http://bugzilla.kernel.org/show_bug.cgi?id=14848>:
> 
>>> The kernel fails to boot if compressed with bzip2 or lzma, gzip works.
>>>
>>> Commit 4a2ff67c88211026afcbdbc190c13f705dae1b59 does:
> 
> Thanks for tracking it down.  The change below works here.

Worked for me as well, so let's hope this finally fixes the issue with
/bin/sh -> dash. I added it to for-linus and will send a pull request soon.

Thanks!
Michal

> 
>  scripts/Makefile.lib |    9 +++++++--
>  1 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index cd815ac..eabedbb 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -219,8 +219,13 @@ for F in $1; do								\
>  	fsize=$$(stat -c "%s" $$F);					\
>  	dec_size=$$(expr $$dec_size + $$fsize);				\
>  done;									\
> -printf "%08x" $$dec_size |						\
> -	sed 's/\(..\)\(..\)\(..\)\(..\)/\\\\x\4\\\\x\3\\\\x\2\\\\x\1/g'	\
> +printf "%08x\n" $$dec_size |						\
> +	sed 's/\(..\)/\1 /g' | {					\
> +		read ch0 ch1 ch2 ch3;					\
> +		for ch in $$ch3 $$ch2 $$ch1 $$ch0; do			\
> +			printf '%s%03o' '\\' $$((0x$$ch)); 		\
> +		done;							\
> +	}								\
>  )
>  
>  quiet_cmd_bzip2 = BZIP2   $@

