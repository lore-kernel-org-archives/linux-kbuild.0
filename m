Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f51.google.com ([74.125.83.51]:33835 "EHLO
        mail-pg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753248AbdFUQ6k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 12:58:40 -0400
Received: by mail-pg0-f51.google.com with SMTP id e187so27095969pgc.1
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 09:58:35 -0700 (PDT)
Date: Wed, 21 Jun 2017 09:58:32 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the
 'duplicate-decl-specifier' warning
Message-ID: <20170621165832.GB52338@google.com>
References: <20170421213931.155210-1-mka@chromium.org>
 <20170421213931.155210-3-mka@chromium.org>
 <CAD=FV=XENNp3rcD5OK1d2WmccbqaT9=bjsayvbnA2Th8zmOAwg@mail.gmail.com>
 <CAK8P3a1y0MoxhMNr2v=R7-CANaATfFy58FM8heyOP78g-JZwHA@mail.gmail.com>
 <20170517184529.GG141096@google.com>
 <20170524000419.GQ141096@google.com>
 <CAK8P3a3D6oW4vaUD9JSGXFqqydrm5-Z0x9qOwzfn_WQryXezsA@mail.gmail.com>
 <CAK7LNASXC1T_OkXD-T5XSKAHSNWrxAQCHPfk4dgnyq7MJBCSnQ@mail.gmail.com>
 <CAK8P3a1QOz6qQdQux4mFXfwadhosHUgw0Ypwmz5tjZOWcV+0qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1QOz6qQdQux4mFXfwadhosHUgw0Ypwmz5tjZOWcV+0qQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Doug Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Alexander Potapenko <glider@google.com>, Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@linaro.org>

El Wed, Jun 21, 2017 at 12:11:55PM +0200 Arnd Bergmann ha dit:

> On Wed, Jun 21, 2017 at 11:11 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > 2017-05-24 17:21 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> >> On Wed, May 24, 2017 at 2:04 AM, Matthias Kaehlcke <mka@chromium.org> wrote:
> >>> El Wed, May 17, 2017 at 11:45:29AM -0700 Matthias Kaehlcke ha dit:
> >>>> El Wed, May 17, 2017 at 09:35:57AM +0200 Arnd Bergmann ha dit:
> >>>> > On Tue, May 16, 2017 at 11:41 PM, Doug Anderson <dianders@chromium.org> wrote:
> >>> It seems the duplicate-decl-specifier warning targets specifically C89:
> >>>
> >>> "The same type qualifier shall not appear more than once in the same
> >>> specifier list or qualifier list, either directly or via one or more
> >>> typedefs."
> >>>
> >>> C89 (6.5.3)
> >>>
> >>> gcc also raises a warning when '-pedantic' is specified and
> >>> -std=gnu89/c89 (or unspecified), but not with -std=gnu99/c99.
> >>>
> >>> This bug might help to shed more light on this:
> >>> https://bugs.llvm.org/show_bug.cgi?id=32985
> >>
> >> I also notice that neither compiler differentiates between a)
> >>
> >> typedef const int cint;
> >> const cint i;
> >>
> >> and b)
> >> const int i;
> >> const typeof(a) j;
> >>
> >> I would have expected a warning for a) but not b), but both 'clang --std=gnu89'
> >> and 'gcc --pedantic --std=gnu89' warn about both of b as well, and don't warn
> >> for newer standards.
> >>
> >>        Arnd
> >
> >
> >
> >
> > I think we agreed to apply 1/2.
> >
> > How about 2/2?
> >
> > I think we mostly discussed preferable behavior of -Wduplicate-decl-specifier,
> > but we did not come up with an idea to solve the problem for
> > already shipped clang versions.
> > (BTW, we have not defined the minimal supported version of clang yet.)

I think it will have to be a future version. There is still an issue
affecting at least llist_for_each_entry_safe(), where clang optimizes
away a check for check for a NULL pointer. For gcc this optimization
is switched off with -fno-delete-null-pointer-check, clang currently
does not have this flag or an equivalent.

For now a workaround like this is needed for newer kernels:

https://android-git.linaro.org/kernel/hikey-clang.git/commit/?h=android-hikey-linaro-4.9-clang&id=4f3c3c1e7b153e333603be74d786d79bb872e8ff

For arm64 at least one other clang fix is missing, to make
-mgeneral-regs-only consistent with gcc
(https://bugs.llvm.org/show_bug.cgi?id=30792)

> I see that container_of() has been modified in linux-next and no longer adds
> the 'const' keyword, do we actually still need the patch?

There is still (at least) the case of const arrays passed to
MODULE_DEVICE_TABLE.
