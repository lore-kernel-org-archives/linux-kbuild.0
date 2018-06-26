Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0018.hostedemail.com ([216.40.44.18]:55620 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754177AbeFZUVk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jun 2018 16:21:40 -0400
Message-ID: <46d20fac2dc15d842ebf23c62372ecdb892d7efd.camel@perches.com>
Subject: Re: [RFC][PATCH] Makefile: globally enable VLA warning
From: Joe Perches <joe@perches.com>
Date: Tue, 26 Jun 2018 13:21:35 -0700
In-Reply-To: <20180626174013.GA41617@beast>
References: <20180626174013.GA41617@beast>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Palmer Dabbelt <palmer@dabbelt.com>, Matt Redfearn <matt.redfearn@mips.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, David Airlie <airlied@linux.ie>, linux-kbuild@vger.kernel.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Linus Torvalds <torvalds@linux-foundation.org>

On Tue, 2018-06-26 at 10:40 -0700, Kees Cook wrote:
> This is the patch I've got prepared now that fixes for all VLAs have been
> sent to maintainers (some are still under review/adjustment, but there
> aren't any unexplored cases left). My intention would be to have this land
> at the end of the next merge window after all the pending VLA patches
> have landed. I just wanted to get any feedback here, since it touches
> a couple areas in the process and I didn't want anyone to be surprised. :)
[]
> diff --git a/Makefile b/Makefile
[]
> @@ -778,6 +778,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  # warn about C99 declaration after statement
>  KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
>  
> +# VLAs should not be used anywhere in the kernel
> +KBUILD_CFLAGS += $(call cc-option,-Wvla)

I'd probably spell out what a VLA is here.
# VLAs (Variable Length Arrays) should not be used anywhere in the kernel

Beyond that, seems sensible, thanks.
