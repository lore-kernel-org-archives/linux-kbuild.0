Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42858 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbfJAOQU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Oct 2019 10:16:20 -0400
MIME-Version: 1.0
References: <20191001101429.24965-1-bjorn.topel@gmail.com> <CAK7LNATNw4Qysj1Q2dXd4PALfbtgMXPwgvmW=g0dRcrczGW-Fg@mail.gmail.com>
In-Reply-To: <CAK7LNATNw4Qysj1Q2dXd4PALfbtgMXPwgvmW=g0dRcrczGW-Fg@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Tue, 1 Oct 2019 16:16:05 +0200
Message-ID: <CAJ+HfNgvxornSfqnbAthNy6u6=-enGCdA8K1e6rLXhCzGgmONQ@mail.gmail.com>
Subject: Re: [PATCH bpf] samples/bpf: kbuild: add CONFIG_SAMPLE_BPF Kconfig
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>

On Tue, 1 Oct 2019 at 14:33, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Bjorn
>
> On Tue, Oct 1, 2019 at 7:14 PM Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.c=
om> wrote:
> >
[...]
> >  subdir-$(CONFIG_SAMPLE_VFS)            +=3D vfs
> > +subdir-$(CONFIG_SAMPLE_BPF)            +=3D bpf
>
>
> Please keep samples/Makefile sorted alphabetically.
>

Thank you, I'll address that in the v2!

>
>
>
> I am not checking samples/bpf/Makefile, but
> allmodconfig no longer compiles for me.
>
>
>
> samples/bpf/Makefile:209: WARNING: Detected possible issues with include =
path.
> samples/bpf/Makefile:210: WARNING: Please install kernel headers
> locally (make headers_install).
> error: unable to create target: 'No available targets are compatible
> with triple "bpf"'
> 1 error generated.
> readelf: Error: './llvm_btf_verify.o': No such file
> *** ERROR: LLVM (llc) does not support 'bpf' target
>    NOTICE: LLVM version >=3D 3.7.1 required
>

Yes, the BPF samples require clang/LLVM with BPF support to build. Any
suggestion on a good way to address this (missing tools), better than
the warning above? After the commit 394053f4a4b3 ("kbuild: make single
targets work more correctly"), it's no longer possible to build
samples/bpf without support in the samples/Makefile.


Thanks,
Bj=C3=B6rn

> --
> Best Regards
> Masahiro Yamada
