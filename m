Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390336AbgEMTAk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 May 2020 15:00:40 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4843C061A0E
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2020 12:00:40 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f15so197716plr.3
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2020 12:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com> <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com> <20200512200114.64vo5lbl7wk2tzxk@google.com>
In-Reply-To: <20200512200114.64vo5lbl7wk2tzxk@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 May 2020 12:00:29 -0700
Message-ID: <CAKwvOdnArcsqusvmMDUJyTjVhkOufJZoRHxg-ARDfPhfjNj_JA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fangrui Song <maskray@google.com>, nickc@redhat.com, "H.J. Lu" <hjl.tools@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, Nick Desaulniers <nick.desaulniers@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Changbin Du <changbin.du@intel.com>, Randy Dunlap <rdunlap@infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>

On Tue, May 12, 2020 at 1:01 PM Fangrui Song <maskray@google.com> wrote:
>
> >Fangrui, I wasn't able to easily find what version of binutils first
> >added support.  Can you please teach me how to fish?
>
> I actually downloaded https://ftp.gnu.org/gnu/binutils/ archives and
> located the sources... I think an easier way is:
>
> % cd binutils-gdb
> % git show binutils-2_26:./gas/as.c | grep compress-debug-sections

This assumes you knew to look at the binutils-2_26 tag, which is
putting the cart before the horse. ;)

I guess:
$ git log gas/as.c
/compress-debug-sections
commit 19a7fe52ae3d ("Make default compression gABI compliant")
looks related
$ git describe --contains "19a7fe52ae3d" | sed 's/~.*//'
users/hjl/linux/release/2.25.51.0.4
so it landed in 2.25.51.0.4.

+ Nick, H.J.
I'm unfamiliar with the git tag conventions of binutils.  Does a patch
that landed in 2.25.51.0.4 mean it shipped in the official 2.25
release, or 2.26 release?  Specifically, commit 19a7fe52ae3d.

> --compress-debug-sections[={none|zlib|zlib-gnu|zlib-gabi}]\n\
> ...
>
> GNU as 2.25 only supports --compress-debug-sections which means "zlib-gnu" in
> newer versions.
>
> Similarly, for GNU ld:
>
> % git show binutils-2_26:./ld/lexsup.c | grep compress-debug-sections
>    --compress-debug-sections=[none|zlib|zlib-gnu|zlib-gabi]\n\
>
> (I have spent a lot of time investigating GNU ld's behavior :)
>
> >Another question I had for Fangrui is, if the linker can compress
> >these sections, shouldn't we just have the linker do it, not the the
> >compiler and assembler?  IIUC the debug info can contain relocations,
> >so the linker would have to decompress these, perform relocations,
> >then recompress these?  I guess having the compiler and assembler
> >compress the debug info as well would minimize the size of the .o
> >files on disk.
>
> The linker will decompress debug info unconditionally. Because
> input .debug_info sections need to be concatenated to form the output
> .debug_info . Whether the output .debug_info is compressed is controlled
> by the linker option --compress-debug-sections=zlib, which is not
> affected by the compression state of object files.
>
> Both GNU as and GNU ld name the option --compress-debug-sections=zlib.
> In a compiler driver context, an unfamiliar user may find
> -Wa,--compress-debug-sections=zlib -Wl,--compress-debug-sections=zlib
> confusing:/

The kernel uses the compiler as the driver for out of line assembly,
as they are all preprocessed first.  Most out of line assembly in the
kernel uses the C preprocessor to #include headers that share #defines
of common constants shared between C and asm.  #ifdef __ASSEMBLY__ is
used frequently in these headers.  But for the linker, the linker
itself is invoked as the driver, though there are a few
inconsistencies we've cleaned up or still have to.

>
> >Otherwise I should add this flag to the assembler invocation, too, in
> >v2.  Thoughts?
>
> Compressing object files along with the linked output should be fine. It
> can save disk space. (It'd be great if you paste the comparison
> with and w/o object files compressed)
>
> Feel free to add:
>
> Reviewed-by: Fangrui Song <maskray@google.com>

Thanks, will add that to v2.

>
> >I have a patch series that enables dwarf5 support in the kernel that
> >I'm working up to.  I wanted to send this first.  Both roughly reduce
> >the debug info size by 20% each, though I haven't measured them
> >together, yet.  Requires ToT binutils because there have been many
> >fixes from reports of mine recently.
>
> This will be awesome! I also heard that enabling DWARF v5 for our object
> files can easily make debug info size smaller by 20%. Glad that the
> kernel can benefit it as well:)

-- 
Thanks,
~Nick Desaulniers
