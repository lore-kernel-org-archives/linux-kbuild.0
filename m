Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42394 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfI2RAN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Sep 2019 13:00:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so6990556lje.9
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Sep 2019 10:00:12 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id y8sm2444354ljh.21.2019.09.29.10.00.10
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Sep 2019 10:00:10 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id a22so7047887ljd.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Sep 2019 10:00:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
 <CAHk-=wjdc7Ovi-iVGBGzuP6prTXVRT8rgbnabBd0AiHRqECMCg@mail.gmail.com> <CAK7LNAQuY50tB790n85LGpX3m6yuxHTyB++0BwVFnSnz1B0gWA@mail.gmail.com>
In-Reply-To: <CAK7LNAQuY50tB790n85LGpX3m6yuxHTyB++0BwVFnSnz1B0gWA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Sep 2019 09:59:54 -0700
Message-ID: <CAHk-=wjhKeCH+yGOmHk_2v8GY2EHwXboSS6R-Jov63JHat21XQ@mail.gmail.com>
Subject: Re: [GIT PULL] More Kbuild updates for v5.4-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

On Sat, Sep 28, 2019 at 9:00 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The concept of header test is to make sure every header
> is self-contained,

Yes, I realize. But at the same time the filenames it creates are very
annoying and clutter up the tree, and I'm not sure we really want that
in the first place.

The thing _I_ would want is actually a lot less includes, and a lot
more streamlined, just for better build times. I sometimes get a small
pull, and wonder why the *whole* tree recompiles, and realize that
it's due to some really obscure header file that just gets included
"in case".

So I'd like us to be stricter about header files another way entirely,
and I'm not sure that header files should need to be completely
independent.

> Of course, you can argue that it is addressing hypothetical issues
> "what if the include directives are arranged in this order?",
> that nobody has been hit before.

Well, I think people hit it all the time but just add the right header
file when some build fails.

In a perfect world, we'd have something that understands what symbols
get declared in each header file, and what symbols each header file
needs, and have a SAT solver for this that actually also understands
about different configurations and architectures. And actually
minimize the headers, and have a tool that warns when you have
unnecessary ones - or are lacking some.

Yeah, it's probably too complex to be worth the pain, but it would be lovely.

> But, at least, I want to continue compile-testing
> uapi headers that are exported to user-space.

I think the uapi headers have a much stronger case for being
self-sufficient, but even there I'd really prefer some other model
than "*.h.s".

We have the dot-files for dependencies and for tracking the command
that was used to generate them, I'd much rather have that. At least
then we wouldn't uglify the directory structure.

Yea, I realize that some people "solve" that problem by just not
building in the source-tree at all, but I find that annoying too.

               Linus
