Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44636 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfEOSIo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 14:08:44 -0400
MIME-Version: 1.0
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190515073818.22486-1-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 16 May 2019 03:07:54 +0900
Message-ID: <CAK7LNATUvPMqt93iwzNud0mxk99Si=CEBDyjA8BLEXM_tcTBfQ@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: check uniqueness of basename of modules
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, May 15, 2019 at 4:40 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

>         $(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
> diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> new file mode 100755
> index 000000000000..944e68bd22b0
> --- /dev/null
> +++ b/scripts/modules-check.sh
> @@ -0,0 +1,18 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# Warn if two or more modules have the same basename
> +check_same_name_modules()
> +{
> +       same_name_modules=$(cat modules.order modules.builtin | \
> +                               xargs basename -a | sort | uniq -d)


I noticed a bug here.


allnoconfig + CONFIG_MODULES=y
will create empty modules.order and modules.builtin.

Then, 'basename -a' will emit the error messages
since it receives zero arguments.


basename: missing operand
Try 'basename --help' for more information.



I can fix it by checking the size of them.


    # If both modules.order and modules.builtin are empty,
    # "basename -a" emits error messages.
    if [ ! -s modules.order -a ! -s modules.builtin ]; then
            return
    fi

    same_name_modules=$(cat modules.order modules.builtin | \
                                   xargs basename -a | sort | uniq -d)




I wonder if there is a more elegant way...




> +       for m in $same_name_modules
> +       do
> +               echo "warning: same basename '$m' if the following are built as modules:"
> +               grep --no-filename -e /$m modules.order modules.builtin | \
> +                                                       sed 's:^kernel/:  :'
> +       done
> +}
> +
> +check_same_name_modules
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
