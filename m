Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20642 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751346AbbBDMFg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Feb 2015 07:05:36 -0500
Message-id: <54D20B08.7010508@samsung.com>
Date: Wed, 04 Feb 2015 15:05:28 +0300
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: Re: [PATCH] kasan: fix build warnings
References: <20150204185328.1ee3ce3c@canb.auug.org.au>
 <1423050231-1701-1-git-send-email-a.ryabinin@samsung.com>
In-reply-to: <1423050231-1701-1-git-send-email-a.ryabinin@samsung.com>
Content-type: text/plain; charset=utf-8
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On 02/04/2015 02:43 PM, Andrey Ryabinin wrote:
> Some versions of gcc produce warning instead of error when
> -fsanitize flag uses unsupported argument:
> 	https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61065
> 
> This breaks our detection of whether -fsanitize=kernel-address
> is supported by compiler or not. Thus we have tons of build
> warnings like this:
> 	x86_64-linux-gcc: warning: unrecognized argument to -fsanitize= option: 'kernel-address'
> 
> Passing -Werror into $(call cc-option) will fix this problem
> as gcc will error out now.
> 
> Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
> 
> Hi Andrew, this patch applies on top kasan patch set.
> We can't just fix add-kernel-address-sanitizer-infrastructure.patch
> as patch  kasan-enable-instrumentation-of-global-variables.patch
> depends on it.
> 
> Let me know if your prefer to update all needed patches instead
> of this fix.
> 
>  scripts/Makefile.kasan | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index df302f8..72a40bb 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -5,15 +5,14 @@ else
>  	call_threshold := 0
>  endif
>  
> -CFLAGS_KASAN_MINIMAL := $(call cc-option, -fsanitize=kernel-address \
> -				--param asan-globals=1)
> +CFLAGS_KASAN_MINIMAL := -fsanitize=kernel-address --param asan-globals=1
>  
>  CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
>  		-fasan-shadow-offset=$(CONFIG_KASAN_SHADOW_OFFSET) \
>  		--param asan-stack=1 --param asan-globals=1 \
>  		--param asan-instrumentation-with-call-threshold=$(call_threshold))
>  
> -ifeq ($(CFLAGS_KASAN_MINIMAL),)
> +ifeq ($(call cc-option, $(CFLAGS_KASAN_MINIMAL) -Werror),)
>          $(warning Cannot use CONFIG_KASAN: \
>              -fsanitize=kernel-address is not supported by compiler)
>  else
> 


Or maybe it would be be better always use -Werror in cc-option?

---
From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [PATCH] kbuild: always use -Werror in 'call cc-option'

Some versions of gcc produce warning instead of error when
-fsanitize flag uses unsupported argument:
	https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61065

This breaks our detection of whether -fsanitize=kernel-address
is supported by compiler or not. Thus we have tons of build
warnings like this:
	x86_64-linux-gcc: warning: unrecognized argument to -fsanitize= option: 'kernel-address'

To workaround this compiler bug we could always use -Werror
with 'call cc-option' forcing gcc to produce error instead of
warnings.

Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michal Marek <mmarek@suse.cz>
---
 scripts/Kbuild.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index d3437b8..6bc4e3e 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -111,12 +111,12 @@ as-instr = $(call try-run,\
 # Usage: cflags-y += $(call cc-option,-march=winchip-c6,-march=i586)

 cc-option = $(call try-run,\
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -Werror -c -x c /dev/null -o "$$TMP",$(1),$(2))

 # cc-option-yn
 # Usage: flag := $(call cc-option-yn,-march=winchip-c6)
 cc-option-yn = $(call try-run,\
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -Werror -c -x c /dev/null -o "$$TMP",y,n)

 # cc-option-align
 # Prefix align with either -falign or -malign

