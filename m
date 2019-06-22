Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:41492 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbfFVFNU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 01:13:20 -0400
MIME-Version: 1.0
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
 <20190604101409.2078-16-yamada.masahiro@socionext.com> <CAK8P3a08f25WYP5r57JHPcZWieS2+07=_qTphLosS4M2w8F0Zw@mail.gmail.com>
In-Reply-To: <CAK8P3a08f25WYP5r57JHPcZWieS2+07=_qTphLosS4M2w8F0Zw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 22 Jun 2019 14:12:37 +0900
Message-ID: <CAK7LNATt8BSrMfrOVjZ_SbA0awsh4CvRhu6TF3gYYynirpviWw@mail.gmail.com>
Subject: Re: [PATCH 15/15] kbuild: compile test UAPI headers to ensure they
 are self-contained
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Yonghong Song <yhs@fb.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>, Martin KaFai Lau <kafai@fb.com>, Palmer Dabbelt <palmer@sifive.com>, bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, Albert Ou <aou@eecs.berkeley.edu>

On Sat, Jun 22, 2019 at 4:05 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jun 4, 2019 at 12:16 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1363,7 +1363,7 @@ CLEAN_DIRS  +=3D $(MODVERDIR) include/ksym
> >  CLEAN_FILES +=3D modules.builtin.modinfo
> >
> >  # Directories & files removed with 'make mrproper'
> > -MRPROPER_DIRS  +=3D include/config usr/include include/generated      =
    \
> > +MRPROPER_DIRS  +=3D include/config include/generated          \
> >                   arch/$(SRCARCH)/include/generated .tmp_objdiff
> >  MRPROPER_FILES +=3D .config .config.old .version \
> >                   Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS G=
SYMS \
>
> This change seems to have caused a minor regression:
>
> $ make clean ; make clean
> find: =E2=80=98*=E2=80=99: No such file or directory

Hmm, I cannot reproduce this.

I checked the latest linux-next.


masahiro@grover:~/ref/linux-next$ git describe
next-20190621
masahiro@grover:~/ref/linux-next$ make clean; make clean
masahiro@grover:~/ref/linux-next$





> Any idea?
>
>       Arnd



--=20
Best Regards
Masahiro Yamada
