Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36421 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCG21 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 02:28:27 -0400
MIME-Version: 1.0
References: <20191001101429.24965-1-bjorn.topel@gmail.com> <CAK7LNATNw4Qysj1Q2dXd4PALfbtgMXPwgvmW=g0dRcrczGW-Fg@mail.gmail.com>
 <CAJ+HfNgvxornSfqnbAthNy6u6=-enGCdA8K1e6rLXhCzGgmONQ@mail.gmail.com>
 <CAK7LNATD4vCQnNsHXP8A2cyWDkCNX=LGh0ej-dkDajm-+Lfw8Q@mail.gmail.com>
 <CAJ+HfNgem7ijzQkz7BU-Z_A-CqWXY_uMF6_p0tGZ6eUMx_N3QQ@mail.gmail.com> <20191002231448.GA10649@khorivan>
In-Reply-To: <20191002231448.GA10649@khorivan>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Thu, 3 Oct 2019 08:28:14 +0200
Message-ID: <CAJ+HfNiCrcVDwQw4nxsntnTSy2pUgV2n6pW206==hUmq1=ZUTA@mail.gmail.com>
Subject: Re: [PATCH bpf] samples/bpf: kbuild: add CONFIG_SAMPLE_BPF Kconfig
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>

On Thu, 3 Oct 2019 at 01:14, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> w=
rote:
>
> On Wed, Oct 02, 2019 at 09:41:15AM +0200, Bj=C3=B6rn T=C3=B6pel wrote:
> >On Wed, 2 Oct 2019 at 03:49, Masahiro Yamada
> ><yamada.masahiro@socionext.com> wrote:
> >>
> >[...]
> >> > Yes, the BPF samples require clang/LLVM with BPF support to build. A=
ny
> >> > suggestion on a good way to address this (missing tools), better tha=
n
> >> > the warning above? After the commit 394053f4a4b3 ("kbuild: make sing=
le
> >> > targets work more correctly"), it's no longer possible to build
> >> > samples/bpf without support in the samples/Makefile.
> >>
> >>
> >> You can with
> >>
> >> "make M=3Dsamples/bpf"
> >>
> >
> >Oh, I didn't know that. Does M=3D support "output" builds (O=3D)?
> >
> >I usually just build samples/bpf/ with:
> >
> >  $ make V=3D1 O=3D/home/foo/build/bleh samples/bpf/
> >
> >
> >Bj=C3=B6rn
>
> Shouldn't README be updated?
>

Hmm, the M=3D variant doesn't work at all for me. The build is still
broken for me. Maybe I'm missing anything obvious...


> --
> Regards,
> Ivan Khoronzhuk
