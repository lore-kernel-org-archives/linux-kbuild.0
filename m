Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48469 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751871AbbABQEp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 11:04:45 -0500
Message-ID: <54A6C19A.3080001@suse.cz>
Date: Fri, 02 Jan 2015 17:04:42 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] kbuild: merge bounds.h and asm-offsets.h rules
References: <1419403765-3377-1-git-send-email-yamada.m@jp.panasonic.com> <1419403765-3377-2-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1419403765-3377-2-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2014-12-24 07:49, Masahiro Yamada wrote:
> The rules "cmd_bounds" and "cmd_offsets" are almost the same.
> (The difference is only the include guards.)  They can be merged.

Good idea.


> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
> 
>  Kbuild | 59 +++++++++++++++++++++--------------------------------------
>  1 file changed, 21 insertions(+), 38 deletions(-)
> 
> diff --git a/Kbuild b/Kbuild
> index 5d7c729..55a639f 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -5,19 +5,20 @@
>  # 2) Generate asm-offsets.h (may need bounds.h)
>  # 3) Check for missing system calls
>  
> -#####
> -# 1) Generate bounds.h
> -
> -bounds-file := include/generated/bounds.h
> -
> -always  := $(bounds-file)
> -targets := $(bounds-file) kernel/bounds.s
> +# Default sed regexp - multiline due to syntax constraints
> +define sed-y
> +	"/^->/{s:->#\(.*\):/* \1 */:; \
> +	s:^->\([^ ]*\) [\$$#]*\([-0-9]*\) \(.*\):#define \1 \2 /* \3 */:; \
> +	s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; \
> +	s:->::; p;}"
> +endef
>  
> -quiet_cmd_bounds = GEN     $@
> -define cmd_bounds
> +quiet_cmd_offsets = GEN     $@
> +define cmd_offsets
>  	(set -e; \
> -	 echo "#ifndef __LINUX_BOUNDS_H__"; \
> -	 echo "#define __LINUX_BOUNDS_H__"; \
> +	 INCLUDE_GUARD=$$(echo __$(notdir $@)__ | tr '[a-z].-' '[A-Z]__'); \
> +	 echo "#ifndef $$INCLUDE_GUARD"; \
> +	 echo "#define $$INCLUDE_GUARD"; \

I think it would be more readable to write it as

  echo "#ifndef $(2)"; \
  ...

and pass the include guard name as an argument to cmd_offsets.

Otherwise it's a great cleanup.

Michal
