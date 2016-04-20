Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48269 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753414AbcDTIib (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2016 04:38:31 -0400
Date: Wed, 20 Apr 2016 10:38:17 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: delete unnecessary "@:"
Message-ID: <20160420083817.GE15339@pobox.suse.cz>
References: <1459422856-31754-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459422856-31754-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Ley Foon Tan <lftan@altera.com>, linux-sh@vger.kernel.org, Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-s390@vger.kernel.org, linux-am33-list@redhat.com, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, David Howells <dhowells@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Dmitry Vyukov <dvyukov@google.com>, Rich Felker <dalias@libc.org>, Andrew Morton <akpm@linux-foundation.org>, uclinux-h8-devel@lists.sourceforge.jp, Yoshinori Sato <ysato@users.sourceforge.jp>, Christian Borntraeger <borntraeger@de.ibm.com>, Russell King <linux@arm.linux.org.uk>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org, nios2-dev@lists.rocketboards.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Thu, Mar 31, 2016 at 08:14:16PM +0900, Masahiro Yamada wrote:
> Since commit 2aedcd098a94 ('kbuild: suppress annoying "... is up to
> date." message'), $(call if_changed,...) is evaluated to "@:"
> when there is nothing to do.
> 
> We no longer need to add "@:" after $(call if_changed,...) to
> suppress "... is up to date." message.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/arm/boot/Makefile                  | 1 -
>  arch/arm/boot/bootp/Makefile            | 1 -
>  arch/h8300/boot/compressed/Makefile     | 1 -
>  arch/m32r/boot/compressed/Makefile      | 1 -
>  arch/mn10300/boot/compressed/Makefile   | 1 -
>  arch/nios2/boot/compressed/Makefile     | 1 -
>  arch/s390/boot/compressed/Makefile      | 1 -
>  arch/sh/boot/compressed/Makefile        | 1 -
>  arch/sh/boot/romimage/Makefile          | 1 -
>  arch/unicore32/boot/compressed/Makefile | 1 -
>  arch/x86/boot/compressed/Makefile       | 1 -
>  arch/x86/purgatory/Makefile             | 2 --
>  arch/x86/realmode/rm/Makefile           | 1 -
>  13 files changed, 14 deletions(-)

Applied to kbuild.git#kbuild, thanks.

Michal
