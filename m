Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f171.google.com ([74.125.82.171]:33437 "EHLO
	mail-we0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965319AbaGPQPI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 12:15:08 -0400
Received: by mail-we0-f171.google.com with SMTP id p10so1197869wes.16
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Jul 2014 09:15:07 -0700 (PDT)
Message-ID: <53C6A509.5060809@plexistor.com>
Date: Wed, 16 Jul 2014 19:15:05 +0300
From: Boaz Harrosh <boaz@plexistor.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Fix compiler message generation
References: <20140702105645.17220.92338.stgit@warthog.procyon.org.uk> <20140702124016.GA26965@sepie.suse.cz>
In-Reply-To: <20140702124016.GA26965@sepie.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, David Howells <dhowells@redhat.com>
Cc: torvalds@linux-foundation.org, sam@ravnborg.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 07/02/2014 03:40 PM, Michal Marek wrote:
<>
>>From 5b59dcacf358f143b9fb39d2f788142ab9ba3e00 Mon Sep 17 00:00:00 2001
> From: Michal Marek <mmarek@suse.cz>
> Date: Wed, 2 Jul 2014 14:28:26 +0200
> Subject: [PATCH] kbuild: Print the name of the build directory
> 
> With commit 9da0763b (kbuild: Use relative path when building in a
> subdir of the source tree), the compiler messages include relative
> paths. These are however relative to the build directory, not the
> directory where make was started. Print the "Entering directory ..."
> message once, so that IDEs/editors can find the source files.
> 
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 97b2861..40544a0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -126,7 +126,10 @@ PHONY += $(MAKECMDGOALS) sub-make
>  $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
>  	@:
>  
> +# Fake the "Entering directory" message once, so that IDEs/editors are
> +# able to understand relative filenames.
>  sub-make: FORCE
> +	@echo "make[1]: Entering directory \`$(KBUILD_OUTPUT)'"
>  	$(if $(KBUILD_VERBOSE:1=),@)$(MAKE) -C $(KBUILD_OUTPUT) \
>  	KBUILD_SRC=$(CURDIR) \
>  	KBUILD_EXTMOD="$(KBUILD_EXTMOD)" -f $(CURDIR)/Makefile \
> 

Sir Michal, sorry for the late response

This patch by itself works with kdevelop so I hope you did not submit my crap
KBUILD_FULL_PATH patch at all and only added this one (and I know, the fix to this
one with the -s)

For me I do not have use for KBUILD_FULL_PATH so I do not see any point for it.

Also not that I like your patches because now I can compile the same directory
from different machines with different absolute paths to the source and the
compilation will come out the same. (before changed absolute path would cause
a rebuild)

Thanks
Boaz

