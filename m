Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:36945 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751210AbeC2Cmn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 22:42:43 -0400
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-8-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-8-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 29 Mar 2018 04:42:42 +0200
Message-ID: <CAFkk2KQjBO=ck6i-L2h2XWehQrJotbzPv66JH+stZ7Q6M5YXTw@mail.gmail.com>
Subject: Re: [PATCH v2 07/21] kconfig: add function support and implement
 'shell' function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 27, 2018 at 7:29 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This commit adds a new concept 'function' to do more text processing
> in Kconfig.
>
> A function call looks like this:
>
>   $(function arg1, arg2, arg3, ...)
>
> (Actually, this syntax was inspired by make.)
>
> Real examples will look like this:
>
>   $(shell echo hello world)
>   $(cc-option -fstackprotector)
>
> This commit adds the basic infrastructure to add, delete, evaluate
> functions, and also the first built-in function $(shell ...).  This
> accepts a single command to execute.  It returns the standard output
> from it.
>
> [Example code]
>
>   config HELLO
>           string
>           default "$(shell echo hello world)"
>
>   config Y
>           def_bool $(shell echo y)
>
> [Result]
>
>   $ make -s alldefconfig && tail -n 2 .config
>   CONFIG_HELLO="hello world"
>   CONFIG_Y=y
>
> Caveat:
> Like environments, functions are expanded in the lexer.  You cannot
> pass symbols to function arguments.  This is a limitation to simplify
> the implementation.  I want to avoid the dynamic function evaluation,
> which would introduce much more complexity.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Reminder for myself:
> Update Documentation/kbuild/kconfig-language.txt
>
>
> Changes in v2:
>   - Use 'shell' for getting stdout from the comment.
>     It was 'shell-stdout' in the previous version.
>   - Symplify the implementation since the expansion has been moved to
>     lexer.
>
>  scripts/kconfig/function.c  | 170 ++++++++++++++++++++++++++++++++++++++++++++
>  scripts/kconfig/lkc_proto.h |   5 ++
>  scripts/kconfig/util.c      |  46 +++++++++---
>  scripts/kconfig/zconf.y     |   9 +++
>  4 files changed, 222 insertions(+), 8 deletions(-)
>  create mode 100644 scripts/kconfig/function.c
>

The gotcha from 04/21 ("kconfig: reference environments directly and
remove 'option env=' syntax") applies here too. For example, the
following will work:

    config A
        bool "A"
        default $(shell echo "B && C")

Some people might argue that that's a feature (I sense a mess down the
road if people start depending on it), but just in case you hadn't
thought of it.

Similarly, the following will only work as expected if 'cmd' outputs
the name of an undefined Kconfig symbol:

    config A
        string
        default $(shell cmd)

You could argue that people should add quotes there though (though
that's broken at the moment if the output from 'cmd' includes a
quote).

Quotes in Kconfig speak just mean "constant value". Problem is it's
undocumented, and no one would intuitively expect it.

Cheers,
Ulf
