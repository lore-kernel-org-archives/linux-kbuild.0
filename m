Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0059.hostedemail.com ([216.40.44.59]:49504 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751376AbbDMTcP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 15:32:15 -0400
Date: Mon, 13 Apr 2015 15:32:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] Use -mcount-record for dynamic ftrace
Message-ID: <20150413153212.131fabc1@gandalf.local.home>
In-Reply-To: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
References: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz, Andi Kleen <ak@linux.intel.com>

On Sun, 12 Apr 2015 17:54:27 -0700
Andi Kleen <andi@firstfloor.org> wrote:

> From: Andi Kleen <ak@linux.intel.com>
> 
> gcc 5 supports a new -mcount-record option to generate ftrace
> tables directly. This avoids the need to run record_mcount
> manually.
> 
> Use this option when available.
> 
> It also has a -mcount-nop option to generate the mcount calls
> as nops. So far that is not implemented, but it could be used
> to optimize patching at boot up.

Interesting. But I can't accept this until I can test it. I don't have
the time to build gcc from scratch, and currently none of my boxes have
a gcc 5 install.

I wonder who's responsible for
https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/

If they can add a i386/x86_64 build for gcc5 I'll be happy to download
it and test this patch.

Thanks,

-- Steve


> 
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---
>  scripts/Makefile.build | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 01df30a..f258e9b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -210,6 +210,11 @@ cmd_modversions =								\
>  	fi;
>  endif
>  
> +# gcc 5 supports generating the mcount tables directly
> +ifneq ($(call cc-option,-mrecord-mcount,y),y)
> +KBUILD_CFLAGS += -mrecord-mcount
> +else
> +# else do it all manually
>  ifdef CONFIG_FTRACE_MCOUNT_RECORD
>  ifdef BUILD_C_RECORDMCOUNT
>  ifeq ("$(origin RECORDMCOUNT_WARN)", "command line")
> @@ -240,6 +245,7 @@ cmd_record_mcount =						\
>  		$(sub_cmd_record_mcount)			\
>  	fi;
>  endif
> +endif
>  
>  define rule_cc_o_c
>  	$(call echo-cmd,checksrc) $(cmd_checksrc)			  \

