Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42394 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbeI2CBq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Sep 2018 22:01:46 -0400
MIME-Version: 1.0
References: <1538117388-11945-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1538117388-11945-1-git-send-email-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 28 Sep 2018 21:36:14 +0200
Message-ID: <CAK8P3a16pR5e1js7JiGreqHqxv5RNJZZY=JLFwLRE8i3nbg5hQ@mail.gmail.com>
Subject: Re: [PATCH] samples: run headers_install for host arch instead of
 target arch
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, David Howells <dhowells@redhat.com>, Kees Cook <keescook@chromium.org>, Richard Weinberger <richard@nod.at>, Jeff Dike <jdike@addtoit.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andy Gross <andy.gross@linaro.org>, Alex Williamson <alex.williamson@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>

On Fri, Sep 28, 2018 at 8:51 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Some samples search headers in $(objtree)/usr/include, which is made
> available by "make headers_install".  It is not kernel-space code but
> host programs that need this header search path.
>
> Commit 3fca1700c4c3 ("kbuild: make samples really depend on
> headers_install") is wrong because it installs headers of the target
> architecture.  Besides, UML fails to build with CONFIG_SAMPLES=y
> because UML does not support headers_install.
>
> Invoke "make headers_install" for the _host_ architecture in the
> prepare stage.  Introduce CONFIG_HOST_HEADERS_INSTALL so that this
> happens only for samples that need it.
>
> I also removed 'Documentation/: headers_install', which I guess is
> stale code.
>
> Fixes: 3fca1700c4c3 ("kbuild: make samples really depend on headers_install")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: David Howells <dhowells@redhat.com>

I don't understand this one. Why would we want to build the samples for
the host architecture rather than the target architecture?

I would think that the bug is that we try to build them using
HOSTCC, and they end up being unusable on the target as
a consequence.

        Arnd
