Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55746 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754528AbeGITVh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 15:21:37 -0400
Date: Mon, 9 Jul 2018 14:21:34 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] objtool: move libelf detection to Kconfig from Makefile
Message-ID: <20180709192134.vhd4lh443fymthfs@treble>
References: <1531043982-13325-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1531043982-13325-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

On Sun, Jul 08, 2018 at 06:59:42PM +0900, Masahiro Yamada wrote:
> Currently, users are allowed to enable STACK_VALIDATION regardless
> of the compiler capability.  The top-level Makefile warns or breaks
> the build if it turns out that the host compiler cannot link libelf.
> 
> Move the libelf test to Kconfig so that users can enable the feature
> only when the host compiler can build the objtool.  The ugly check
> in the Makefile will go away.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for cleaning this up!

> I am sure about this patch only from the build system point of view.
> 
> Please review this from x86 and objtool point of view.
> 
> In my understanding:
> 
>  - UNWINDER_ORC _requires_ objtool,
>    so I added 'depends on STACK_VALIDATION'.
>    ('select' would end up with unmet depenency)

Correct.

>  - RETPOLINE _wants_ objtool, so I added 'imply'

Yeah, I think this is fine.

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh
