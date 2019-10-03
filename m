Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36309 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389289AbfJCRiE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 13:38:04 -0400
MIME-Version: 1.0
References: <20191001101429.24965-1-bjorn.topel@gmail.com> <CAK7LNATNw4Qysj1Q2dXd4PALfbtgMXPwgvmW=g0dRcrczGW-Fg@mail.gmail.com>
 <CAJ+HfNgvxornSfqnbAthNy6u6=-enGCdA8K1e6rLXhCzGgmONQ@mail.gmail.com>
 <CAK7LNATD4vCQnNsHXP8A2cyWDkCNX=LGh0ej-dkDajm-+Lfw8Q@mail.gmail.com>
 <CAJ+HfNgem7ijzQkz7BU-Z_A-CqWXY_uMF6_p0tGZ6eUMx_N3QQ@mail.gmail.com>
 <20191002231448.GA10649@khorivan> <CAJ+HfNiCrcVDwQw4nxsntnTSy2pUgV2n6pW206==hUmq1=ZUTA@mail.gmail.com>
 <CAK7LNARd4_o4E=TSONZjJ9iyyeUE1=L_njU7LiEZFpNunSEEkw@mail.gmail.com>
 <CAJ+HfNhx+gQmRMb18UDRrmzciDYUbdezUh9bRhWG8_HTUCLk9w@mail.gmail.com> <CAEf4BzbZxa3iGZEWB03rdL+7ErmhdpB0e3aeOQvbLPu0o8XFqw@mail.gmail.com>
In-Reply-To: <CAEf4BzbZxa3iGZEWB03rdL+7ErmhdpB0e3aeOQvbLPu0o8XFqw@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Thu, 3 Oct 2019 19:37:51 +0200
Message-ID: <CAJ+HfNi1cTvCxcgjU4r03eJt_mc7L4Zwn7vfgWHAPWyjH0q4Bw@mail.gmail.com>
Subject: Re: [PATCH bpf] samples/bpf: kbuild: add CONFIG_SAMPLE_BPF Kconfig
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>, Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>

On Thu, 3 Oct 2019 at 19:16, Andrii Nakryiko <andrii.nakryiko@gmail.com> wr=
ote:
>
> On Thu, Oct 3, 2019 at 3:52 AM Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.c=
om> wrote:
> >
> > On Thu, 3 Oct 2019 at 12:37, Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > On Thu, Oct 3, 2019 at 3:28 PM Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gma=
il.com> wrote:
> > > >
> > > > On Thu, 3 Oct 2019 at 01:14, Ivan Khoronzhuk <ivan.khoronzhuk@linar=
o.org> wrote:
> > > > >
> > > > > On Wed, Oct 02, 2019 at 09:41:15AM +0200, Bj=C3=B6rn T=C3=B6pel w=
rote:
> > > > > >On Wed, 2 Oct 2019 at 03:49, Masahiro Yamada
> > > > > ><yamada.masahiro@socionext.com> wrote:
> > > > > >>
> > > > > >[...]
> > > > > >> > Yes, the BPF samples require clang/LLVM with BPF support to =
build. Any
> > > > > >> > suggestion on a good way to address this (missing tools), be=
tter than
> > > > > >> > the warning above? After the commit 394053f4a4b3 ("kbuild: m=
ake single
> > > > > >> > targets work more correctly"), it's no longer possible to bu=
ild
> > > > > >> > samples/bpf without support in the samples/Makefile.
> > > > > >>
> > > > > >>
> > > > > >> You can with
> > > > > >>
> > > > > >> "make M=3Dsamples/bpf"
> > > > > >>
> > > > > >
> > > > > >Oh, I didn't know that. Does M=3D support "output" builds (O=3D)=
?
> > >
> > > No.
> > > O=3D points to the output directory of vmlinux,
> > > not of the external module.
> > >
> > > You cannot put the build artifacts from samples/bpf/
> > > in a separate directory.
> > >
> >
> > Hmm, I can't even get "make M=3Dsamples/bpf/" to build. Am I missing
> > something obvious?
>
> There were 3 or 4 separate fixes submitted for samples/bpf yesterday,
> maybe you are hitting some of those issues. Try to pull latest (not
> sure if bpf or bpf-next tree). I tried make M=3Dsamples/bpf and it
> worked for me.
>

Yeah, it was PEBKAC. "make M=3Dsamples/bpf" works if you have a proper
.config + "make prepare" ;-)

I guess I need to change my workflow. I build all my kernels "O=3D", and
did so with samples/bpf as well. Everything ended up in the same
output directory. Now I need to have all this build output in source
tree, and need to manage the .config files in where the source is at.
Oh well... I'll stop complaining now. :-)

Thanks,
Bj=C3=B6rn

> >
> > Prior 394053f4a4b3 "make samples/bpf/" and "make O=3D/foo/bar
> > samples/bpf/" worked, but I guess I can live with that...
> >
> >
> > Thanks!
> > Bj=C3=B6rn
> >
> >
> > >
> > >
> > > > > >I usually just build samples/bpf/ with:
> > > > > >
> > > > > >  $ make V=3D1 O=3D/home/foo/build/bleh samples/bpf/
> > > > > >
> > > > > >
> > > > > >Bj=C3=B6rn
> > > > >
> > > > > Shouldn't README be updated?
> > > > >
> > > >
> > > > Hmm, the M=3D variant doesn't work at all for me. The build is stil=
l
> > > > broken for me. Maybe I'm missing anything obvious...
> > > >
> > > >
> > > > > --
> > > > > Regards,
> > > > > Ivan Khoronzhuk
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
