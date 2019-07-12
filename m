Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64039 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbfGLBuC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 21:50:02 -0400
MIME-Version: 1.0
References: <20190712010556.248319-1-briannorris@chromium.org>
 <CAK7LNARGNVfxexE616cQDs1fK7SzToKwHxO_T69+RShL6QVTCQ@mail.gmail.com> <CA+ASDXNGqYkBjMsjcRKAit+0cd0n7dwxKhezyYCXSh_HjucvQw@mail.gmail.com>
In-Reply-To: <CA+ASDXNGqYkBjMsjcRKAit+0cd0n7dwxKhezyYCXSh_HjucvQw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 12 Jul 2019 10:49:18 +0900
Message-ID: <CAK7LNARJ=aAf-iG7RVDp=bs7DTScJ1GBpEpkqtKDFDJYHEekUA@mail.gmail.com>
Subject: Re: [RFC PATCH] bug: always show source-tree-relative paths in WARN()/BUG()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jason Baron <jbaron@akamai.com>, Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@suse.de>, Michal Marek <michal.lkml@markovi.net>

On Fri, Jul 12, 2019 at 10:23 AM Brian Norris <briannorris@chromium.org> wrote:
>
> On Thu, Jul 11, 2019 at 6:14 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > BTW, did you see this?
> >
> > commit a73619a845d5625079cc1b3b820f44c899618388
> > Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Date:   Fri Mar 30 13:15:26 2018 +0900
> >
> >     kbuild: use -fmacro-prefix-map to make __FILE__ a relative path
>
> Oh, wow, no I did not. If my reading is correct, that's GCC only? I've
> been using various combinations of newer (5.2) and older (4.14.y --
> didn't have that patch) kernels, older GCC (doesn't have that feature
> AFAICT), and newer Clang (doesn't appear to have that feature). So I'm
> not totally sure if I ever actually tried a combo that *could* make
> use of that. But I may give it another shot.
>
> In the event that this is GCC-specific...I don't suppose I could
> convince anybody to expend any effort (e.g., taking a patch like mine)
> to solve it for the non-GCC world?
>
> Thanks for the tip,
> Brian


GCC 8 added this flag.
So, it will be eventually all solved in the GCC world.

Clang has not supported it yet...


Trimming absolute path at run-time
is no help for reducing the kernel image.

Turning __FILE__ into a relative path at compile-time is better.


I hope Clang people will consider to support it.
I guess implementing this feature should not be so hard.


-- 
Best Regards
Masahiro Yamada
