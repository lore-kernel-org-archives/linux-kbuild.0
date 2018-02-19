Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:43535 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751893AbeBSEtA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 23:49:00 -0500
Date: Mon, 19 Feb 2018 05:48:45 +0100
From: Ulf Magnusson <ulfalizer@gmail.com>
Subject: Re: [PATCH 11/23] kconfig: add 'shell-stdout' function
Message-ID: <20180219044845.7cnqpgyiinn6hkyb@huvuddator>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-12-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFwQLrrBeXZXK_qUXiGVFNv3qPJS4tNKFacuk0Y0WgZjCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+55aFwQLrrBeXZXK_qUXiGVFNv3qPJS4tNKFacuk0Y0WgZjCA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Feb 16, 2018 at 11:17:52AM -0800, Linus Torvalds wrote:
> On Fri, Feb 16, 2018 at 10:38 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > This is the second built-in function, which retrieves the first line
> > of stdout from the given shell command.
> 
> This is the only part I really don't much like in your patch series.
> 
> Most of it is just lovely and looks very nice and powerful, but the
> difference between "$(shell ..." and "$(shell-stdout ..." to me is
> bvery ugly.
> 
> Can we *please* make "shell-stdout" go away, and make this just be "shell"?
> 
> The rule would be very simple:
> 
>  - if the result of the shell command is a failure, the result is 'n'
> 
>  - otherwise, the result is the first line of stdout
> 
>  - if the result is empty, we replace it with 'y'.
> 
> So doing $(shell true) would be 100% equivalent to $(shell echo y),
> and you could still do that
> 
>           default $(shell $CC --version | grep -q gcc)
> 
> because it would just automatically do the right thing.
> 
> Basically, the only difference is how $(shell ) works in the success
> case: the result won't necessarily be 'y', it will be whatever output.
> But if you want to always turn it into 'y' (say, you don't have a "-q"
> flag for the grep equivalent above), you can always do so with
> 
>           default $(shell $CC --version | noqgrep gcc > /dev/null)
> 
> So it seems to me that there is never any fundamental reason why we'd
> want both "shell" and "shell-stdout", since "shell-stdout" is
> fundamentally more powerful than "shell", and can always be used as
> such (and just renamed to "shell").
> 
> Because I really think that it's just much prettier and more intuitive
> to be able to say
> 
>         default "/boot/config-$(shell uname --release)"
> 
> without that "-stdout" thing.
> 
> Hmm?
> 
> But I do want to say how much I liked this series. Just this part
> seemed to result in uglier Kconfig scripts.
> 
>          Linus

Could there be cases where you'd legitimately want to put empty output
from a command in a string (that would be common enough to matter)?
That'd get messier with the above rule, as it never generates an empty
string as output.

For an environment variable, stuff like prefixes come to mind, but I
can't think of anything for a command. I'm more familiar with Kconfig
than the rest of the kernel build system though.


Would you still be as opposed (or more opposed...) to having two
functions if they were called something like 'success' and 'stdout'
instead?

This reads pretty naturally to me:

	config CC_IS_GCC
		def_bool "$(success $CC --version | grep gcc)"

As does this:

	default "/boot/config-$(stdout uname --release)"

The rule for $(success ...) would be that it's textually replaced by "y"
if the exit status of the command is 0, and with "n" in all other cases.

$(stdout ...) would be textually replaced by the first line from stdout.
Maybe it'd be helpful to spit out a warning if the exit status is non-0.

All functions would just do dumb and simple-to-understand text
replacement, and all the interpretation would happen later in the normal
way. Enforcing the quotes would make this behavior obvious. That would
indirectly turn the expanded values into constant symbols internally in
Kconfig.

Thoughts?

Cheers,
Ulf
