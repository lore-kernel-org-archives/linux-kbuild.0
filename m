Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgELTXr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 15:23:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCEBC061A0E
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2020 12:23:46 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id u15so1856377plm.2
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2020 12:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com> <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
In-Reply-To: <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 12 May 2020 12:23:34 -0700
Message-ID: <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Fangrui Song <maskray@google.com>, Sedat Dilek <sedat.dilek@gmail.com>
Cc: Nick Desaulniers <nick.desaulniers@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Changbin Du <changbin.du@intel.com>, Randy Dunlap <rdunlap@infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>

On Mon, May 11, 2020 at 10:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > >On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
> > ><nick.desaulniers@gmail.com> wrote:
> > >>
> > >> As debug information gets larger and larger, it helps significantly save
> > >> the size of vmlinux images to compress the information in the debug
> > >> information sections. Note: this debug info is typically split off from
> > >> the final compressed kernel image, which is why vmlinux is what's used
> > >> in conjunction with GDB. Minimizing the debug info size should have no
> > >> impact on boot times, or final compressed kernel image size.
> > >>
> Nick,
>
> I am OK with this patch.
>
> Fangrui provided the minimal requirement for
> --compress-debug-sections=zlib
>
>
> Is it worth recording in the help text?
> Do you want to send v2?

Yes I'd like to record that information.  I can also record Sedat's
Tested-by tag.  Thank you for testing Sedat.

I don't know what "linux-image-dbg file" are, or why they would be
bigger.  The size of the debug info is the primary concern with this
config.  It sounds like however that file is created might be
problematic.

Fangrui, I wasn't able to easily find what version of binutils first
added support.  Can you please teach me how to fish?

Another question I had for Fangrui is, if the linker can compress
these sections, shouldn't we just have the linker do it, not the the
compiler and assembler?  IIUC the debug info can contain relocations,
so the linker would have to decompress these, perform relocations,
then recompress these?  I guess having the compiler and assembler
compress the debug info as well would minimize the size of the .o
files on disk.

Otherwise I should add this flag to the assembler invocation, too, in
v2.  Thoughts?

I have a patch series that enables dwarf5 support in the kernel that
I'm working up to.  I wanted to send this first.  Both roughly reduce
the debug info size by 20% each, though I haven't measured them
together, yet.  Requires ToT binutils because there have been many
fixes from reports of mine recently.
-- 
Thanks,
~Nick Desaulniers
