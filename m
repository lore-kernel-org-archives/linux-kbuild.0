Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pb-smtp1.pobox.com ([64.147.108.70]:59962 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750743AbeBPTtd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Feb 2018 14:49:33 -0500
Date: Fri, 16 Feb 2018 14:49:31 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH 08/23] kconfig: add 'macro' keyword to support user-defined
 function
In-Reply-To: <1518806331-7101-9-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1802161438470.31719@knanqh.ubzr>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com> <1518806331-7101-9-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Sat, 17 Feb 2018, Masahiro Yamada wrote:

> Now, we got a basic ability to test compiler capability in Kconfig.
> 
> config CC_HAS_STACKPROTECTOR
>         bool
>         default $(shell $CC -Werror -fstack-protector -c -x c /dev/null -o /dev/null)
> 
> This works, but it is ugly to repeat this long boilerplate.
> 
> We want to describe like this:
> 
> config CC_HAS_STACKPROTECTOR
>         bool
>         default $(cc-option -fstack-protector)
> 
> It is straight-forward to implement a new function, but I do not like
> to hard-code specialized functions like this.  Hence, here is another
> feature to add functions from Kconfig files.
> 
> A user-defined function can be defined as a string type symbol with
> a special keyword 'macro'.  It can be referenced in the same way as
> built-in functions.  This feature was also inspired by Makefile where
> user-defined functions are referenced by $(call func-name, args...),
> but I omitted the 'call' to makes it shorter.
> 
> The macro definition can contain $(1), $(2), ... which will be replaced
> with arguments from the caller.
> 
> Example code:
> 
>   config cc-option
>           string
>           macro $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)

I think this syntax for defining a macro shouldn't start with the 
"config" keyword, unless you want it to be part of the config symbol 
space and land it in .config. And typing it as a "string" while it 
actually returns y/n (hence a bool) is also strange.

What about this instead:

macro cc-option
	bool $(shell $CC -Werror $(1) -c -x c /dev/null -o /dev/null)

This makes it easier to extend as well if need be.


Nicolas
