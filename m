Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:51792 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753185AbeBSSBu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Feb 2018 13:01:50 -0500
MIME-Version: 1.0
In-Reply-To: <CA+55aFwiRzpSRW8xhoMs9cbFFXZGmEyyVa4a7aeZzQGYuO211w@mail.gmail.com>
References: <1518806331-7101-1-git-send-email-yamada.masahiro@socionext.com>
 <1518806331-7101-12-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFwQLrrBeXZXK_qUXiGVFNv3qPJS4tNKFacuk0Y0WgZjCA@mail.gmail.com>
 <20180219044845.7cnqpgyiinn6hkyb@huvuddator> <CA+55aFwiRzpSRW8xhoMs9cbFFXZGmEyyVa4a7aeZzQGYuO211w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Feb 2018 10:01:49 -0800
Message-ID: <CA+55aFzu8+yaAGvdZMRYJWWZmv_OnFnocnvUiSKcAyNQ1z9kmQ@mail.gmail.com>
Subject: Re: [PATCH 11/23] kconfig: add 'shell-stdout' function
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Feb 19, 2018 at 9:44 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I do like your "success"/"stdout" more than "shell"/"shell-stdout",
> because with that naming I don't get the feeling that one should
> subsume the other.

Hmm. Thinking about it some more, I really would prefer just "$(shell
...)" everywhere.

But it would be nice if perhaps the error handling would match the
context somehow.

I'm wondering if this might tie into the whole quoting discussion in
the other thread.

Because the rule could be:

(a) unquoted $(shell ) is a bool, and failing is ok (and turns into
y/n depending on whether successful or failing)

So

  config CC_IS_GCC
          bool
          default $(shell $CC --version | grep -q gcc)

works automatically.

(b) but with quoting, $(shell ) is a string, and failing is an error

So

  config GCC_VERSION
          int
          default "$(shell-stdout $srctree/scripts/gcc-version.sh $CC
| sed 's/^0*//')" if CC_IS_GCC
          default 0

would need those quotes, and if the shell-script returns a failure,
we'd _abort_.

Which is actually what we want there.

Hmm? Is that too nasty?

                Linus
