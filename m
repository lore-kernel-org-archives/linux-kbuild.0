Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f42.google.com ([209.85.214.42]:43775 "EHLO
        mail-it0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1764152AbdKRCBJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Nov 2017 21:01:09 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAThpT3_kEpR=m=pXh9YV27bgaytER33JadjxvaWJGWKWw@mail.gmail.com>
References: <CAK7LNAThpT3_kEpR=m=pXh9YV27bgaytER33JadjxvaWJGWKWw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Nov 2017 18:01:08 -0800
Message-ID: <CA+55aFzo2sdQseGj1UM-tYnov25ThwRwN3YSOAu44f63JRZuPQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v4.15
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Oh, and I forgot to ask..

On Fri, Nov 17, 2017 at 9:22 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> One of the most remarkable improvements in this cycle is, Kbuild is
> now able to cache the result of shell commands.

I see the "limit it to 500 lines", but I don't see any real coherency.

So I take it that if you upgrade your gcc version, you may need to
blow this cache away manually?

Or is there something subtle going on that I've missed?

FWIW, I still think we should probably make the compiler versions etc
available to the configuration management rather than necessarily
cache them.

                Linus
