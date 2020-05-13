Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25771 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgEMCwE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 22:52:04 -0400
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com> <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
In-Reply-To: <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 13 May 2020 11:51:12 +0900
Message-ID: <CAK7LNATm2r9pH7i=pe3e7WvNmumGnivn05J+Mz10DzrzB8i=hw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Fangrui Song <maskray@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Nick Desaulniers <nick.desaulniers@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Changbin Du <changbin.du@intel.com>, Randy Dunlap <rdunlap@infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>

Nick,

On Wed, May 13, 2020 at 4:23 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, May 11, 2020 at 10:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > > >On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
> > > ><nick.desaulniers@gmail.com> wrote:
> > > >>
> > > >> As debug information gets larger and larger, it helps significantly save
> > > >> the size of vmlinux images to compress the information in the debug
> > > >> information sections. Note: this debug info is typically split off from
> > > >> the final compressed kernel image, which is why vmlinux is what's used
> > > >> in conjunction with GDB. Minimizing the debug info size should have no
> > > >> impact on boot times, or final compressed kernel image size.
> > > >>
> > Nick,
> >
> > I am OK with this patch.
> >
> > Fangrui provided the minimal requirement for
> > --compress-debug-sections=zlib
> >
> >
> > Is it worth recording in the help text?
> > Do you want to send v2?
>
> Yes I'd like to record that information.  I can also record Sedat's
> Tested-by tag.  Thank you for testing Sedat.
>
> I don't know what "linux-image-dbg file" are, or why they would be
> bigger.  The size of the debug info is the primary concern with this
> config.  It sounds like however that file is created might be
> problematic.



As Sedat explained, deb package data
is compressed by xz, which is default.

You can use another compression method,
or disable compression if you desire.



"man dpkg-deb" says as follows:

 -Zcompress-type
      Specify which compression type to use when building a package.
      Allowed  values  are  gzip,  xz  (since  dpkg  1.15.6), and none
      (default is xz).



Kbuild supports KDEB_COMPRESS variable
to change the compression method.
See line 46 of scripts/package/builddeb.



If you are interested,
try "make bindeb-pkg" with/without CONFIG_DEBUG_INFO_COMPRESSED,
and compare the size of the generated debug package.




As Sedat stated,

(plain data) -> compress by gzip  ->  compress by xz

   is often less efficient than

(plain data) -> compress by xz



I hope this is clearer.








> Fangrui, I wasn't able to easily find what version of binutils first
> added support.  Can you please teach me how to fish?
>
> Another question I had for Fangrui is, if the linker can compress
> these sections, shouldn't we just have the linker do it, not the the
> compiler and assembler?  IIUC the debug info can contain relocations,
> so the linker would have to decompress these, perform relocations,
> then recompress these?  I guess having the compiler and assembler
> compress the debug info as well would minimize the size of the .o
> files on disk.
>
> Otherwise I should add this flag to the assembler invocation, too, in
> v2.  Thoughts?
>
> I have a patch series that enables dwarf5 support in the kernel that
> I'm working up to.  I wanted to send this first.  Both roughly reduce
> the debug info size by 20% each, though I haven't measured them
> together, yet.  Requires ToT binutils because there have been many
> fixes from reports of mine recently.
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
