Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44439 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfIDIIH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 04:08:07 -0400
MIME-Version: 1.0
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <20190831162555.31887-2-yamada.masahiro@socionext.com> <CAKwvOdm0zcyaBLdSVc7PmjUa-wyVuCaN=6qZoPLvnoJC1ammog@mail.gmail.com>
 <CA+icZUWzSsFXLmrO2G7ochE62e=kByEV6UKregcJqZrJN1WJxQ@mail.gmail.com>
In-Reply-To: <CA+icZUWzSsFXLmrO2G7ochE62e=kByEV6UKregcJqZrJN1WJxQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 4 Sep 2019 10:07:51 +0200
Message-ID: <CA+icZUXboR-0TzpSHf7a8MSjxPWxdC13Oudu8D+b+umtvWCCkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to KBUILD_EXTRA_WARN
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>, linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Sep 4, 2019 at 8:58 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Tue, Sep 3, 2019 at 11:50 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Sat, Aug 31, 2019 at 9:26 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > KBUILD_ENABLE_EXTRA_GCC_CHECKS started as a switch to add extra warning
> > > options for GCC, but now it is a historical misnomer since we use it
> > > also for Clang, DTC, and even kernel-doc.
> >
> > Thanks for the patch!
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> >
>
> Thanks for the patch.
> I like the backward compatibility and am OK with pointing to 'make
> --help' for the documentation part (KISS - Keep It Simple and
> Short/Stupid).
>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

If you will do a next version...

- @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
+ @echo  '  make W=n   [targets] Enable extra checks, n=1,2,3 where'

...clarify on extra checks for compiler...

+ @echo  '  make W=n   [targets] Enable extra *compiler* checks, n=1,2,3 where'

Thanks in advance.

- Sedat -
