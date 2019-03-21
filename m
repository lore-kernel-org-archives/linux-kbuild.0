Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51084 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726914AbfCUBRw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Mar 2019 21:17:52 -0400
MIME-Version: 1.0
References: <1552968156-3920-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1552968156-3920-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Mar 2019 10:16:53 +0900
Message-ID: <CAK7LNARuyLG52m1oe_2MeuoThR4qur9HgE3ZCz4=jyuvrqew+g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: skip sub-make for in-tree build with GNU Make 4.x
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Andreas Schwab <schwab@suse.de>, David Howells <dhowells@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 19, 2019 at 1:03 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Commit 2b50f7ab6368 ("kbuild: add workaround for Debian make-kpkg")
> annoyed people who want to wrap the top Makefile with GNUmakefile
> or something in order to customize it for their use.
>
> On second thought, we do not need to run the sub-make for in-tree
> build with Make 4.x because the 'MAKEFLAGS += -rR' issue only happens
> on GNU Make 3.x.
>
> With this commit, people will get back the workflow, and the Debian
> make-kpkg will still work.
>
> Fixes: 2b50f7ab6368 ("kbuild: add workaround for Debian make-kpkg")
> Reported-by: Andreas Schwab <schwab@suse.de>
> Reported-by: David Howells <dhowells@redhat.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/fixes.


>
>  Makefile | 31 +++++++++++++++----------------
>  1 file changed, 15 insertions(+), 16 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 99c0530..d9591f2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -31,26 +31,12 @@ _all:
>  # descending is started. They are now explicitly listed as the
>  # prepare rule.
>
> -# Ugly workaround for Debian make-kpkg:
> -# make-kpkg directly includes the top Makefile of Linux kernel. In such a case,
> -# skip sub-make to support debian_* targets in ruleset/kernel_version.mk, but
> -# displays warning to discourage such abusage.
> -ifneq ($(word 2, $(MAKEFILE_LIST)),)
> -$(warning Do not include top Makefile of Linux Kernel)
> -sub-make-done := 1
> -MAKEFLAGS += -rR
> -endif
> -
>  ifneq ($(sub-make-done),1)
>
>  # Do not use make's built-in rules and variables
>  # (this increases performance and avoids hard-to-debug behaviour)
>  MAKEFLAGS += -rR
>
> -# 'MAKEFLAGS += -rR' does not become immediately effective for old
> -# GNU Make versions. Cancel implicit rules for this Makefile.
> -$(lastword $(MAKEFILE_LIST)): ;
> -
>  # Avoid funny character set dependencies
>  unexport LC_ALL
>  LC_COLLATE=C
> @@ -153,6 +139,7 @@ $(if $(KBUILD_OUTPUT),, \
>  # 'sub-make' below.
>  MAKEFLAGS += --include-dir=$(CURDIR)
>
> +need-sub-make := 1
>  else
>
>  # Do not print "Entering directory ..." at all for in-tree build.
> @@ -160,6 +147,15 @@ MAKEFLAGS += --no-print-directory
>
>  endif # ifneq ($(KBUILD_OUTPUT),)
>
> +ifneq ($(filter 3.%,$(MAKE_VERSION)),)
> +# 'MAKEFLAGS += -rR' does not immediately become effective for GNU Make 3.x
> +# We need to run sub-make to avoid implicit rules in the top Makefile.
> +need-sub-make := 1
> +# Cancel implicit rules for this Makefile.
> +$(lastword $(MAKEFILE_LIST)): ;
> +endif
> +
> +ifeq ($(need-sub-make),1)
>  PHONY += $(MAKECMDGOALS) sub-make
>
>  $(filter-out _all sub-make $(CURDIR)/Makefile, $(MAKECMDGOALS)) _all: sub-make
> @@ -171,8 +167,11 @@ sub-make:
>         $(if $(KBUILD_OUTPUT),-C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR)) \
>         -f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))
>
> -else # sub-make-done
> +endif # need-sub-make
> +endif # sub-make-done
> +
>  # We process the rest of the Makefile if this is the final invocation of make
> +ifeq ($(need-sub-make),)
>
>  # Do not print "Entering directory ...",
>  # but we want to display it when entering to the output directory
> @@ -1757,7 +1756,7 @@ existing-targets := $(wildcard $(sort $(targets)))
>
>  endif   # ifeq ($(config-targets),1)
>  endif   # ifeq ($(mixed-targets),1)
> -endif   # sub-make-done
> +endif   # need-sub-make
>
>  PHONY += FORCE
>  FORCE:
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
