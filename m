Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:50340 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932317AbeBURCB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Feb 2018 12:02:01 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT1QNMrHL_JikeEk1ejen-03u_vwkdQmHhHxrxHLtaa0Q@mail.gmail.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-12-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFwQLrrBeXZXK_qUXiGVFNv3qPJS4tNKFacuk0Y0WgZjCA@mail.gmail.com>
 <20180219044845.7cnqpgyiinn6hkyb@huvuddator> <CA+55aFwiRzpSRW8xhoMs9cbFFXZGmEyyVa4a7aeZzQGYuO211w@mail.gmail.com>
 <CA+55aFzu8+yaAGvdZMRYJWWZmv_OnFnocnvUiSKcAyNQ1z9kmQ@mail.gmail.com> <CAK7LNAT1QNMrHL_JikeEk1ejen-03u_vwkdQmHhHxrxHLtaa0Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 21 Feb 2018 09:01:59 -0800
Message-ID: <CA+55aFyNM+qrF=f2gX4ktp5U+WOycktkrYfGos7VdTdOuhtvvw@mail.gmail.com>
Subject: Re: [PATCH 11/23] kconfig: add 'shell-stdout' function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 20, 2018 at 8:59 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> IMO, I prefer to use different names for different purpose.
> So, 'stdout' and 'success' look good to me.
>
> BTW, I noticed just one built-in function is enough
> because 'success' can be derived from 'stdout'.
>
> So, my plan is, implement $(shell ...) as a built-in function.
> This returns the stdout from the command.
>
> Then, implement 'success' as a textual shorthand
> by using macro, like this:
>
> macro success $(shell ($(1) && echo y) || echo n)

I like it. This is nice and clean, and seems to be very generic. I see
no issues with this approach.

                Linus
