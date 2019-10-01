Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36852 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfJAMds (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Oct 2019 08:33:48 -0400
MIME-Version: 1.0
References: <20191001101429.24965-1-bjorn.topel@gmail.com>
In-Reply-To: <20191001101429.24965-1-bjorn.topel@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 1 Oct 2019 21:33:00 +0900
Message-ID: <CAK7LNATNw4Qysj1Q2dXd4PALfbtgMXPwgvmW=g0dRcrczGW-Fg@mail.gmail.com>
Subject: Re: [PATCH bpf] samples/bpf: kbuild: add CONFIG_SAMPLE_BPF Kconfig
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Cc: Networking <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf@vger.kernel.org

Hi Bjorn

On Tue, Oct 1, 2019 at 7:14 PM Bj=C3=B6rn T=C3=B6pel <bjorn.topel@gmail.com=
> wrote:
>
> From: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
>
> This commit makes it possible to build the BPF samples via a Kconfig
> option, CONFIG_SAMPLE_BPF. Further, it fixes that samples/bpf/ could
> not be built due to a missing samples/Makefile subdir-y entry, after
> the introduction of commit 394053f4a4b3 ("kbuild: make single targets
> work more correctly").
>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn.topel@intel.com>
> ---
>  samples/Kconfig  | 4 ++++
>  samples/Makefile | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/samples/Kconfig b/samples/Kconfig
> index c8dacb4dda80..054297ac89ad 100644
> --- a/samples/Kconfig
> +++ b/samples/Kconfig
> @@ -169,4 +169,8 @@ config SAMPLE_VFS
>           as mount API and statx().  Note that this is restricted to the =
x86
>           arch whilst it accesses system calls that aren't yet in all arc=
hes.
>
> +config SAMPLE_BPF
> +       bool "BPF samples"
> +       depends on HEADERS_INSTALL
> +
>  endif # SAMPLES
> diff --git a/samples/Makefile b/samples/Makefile
> index 7d6e4ca28d69..49aa2f7d044b 100644
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@ -20,3 +20,4 @@ obj-$(CONFIG_SAMPLE_TRACE_PRINTK)     +=3D trace_printk=
/
>  obj-$(CONFIG_VIDEO_PCI_SKELETON)       +=3D v4l/
>  obj-y                                  +=3D vfio-mdev/
>  subdir-$(CONFIG_SAMPLE_VFS)            +=3D vfs
> +subdir-$(CONFIG_SAMPLE_BPF)            +=3D bpf


Please keep samples/Makefile sorted alphabetically.




I am not checking samples/bpf/Makefile, but
allmodconfig no longer compiles for me.



samples/bpf/Makefile:209: WARNING: Detected possible issues with include pa=
th.
samples/bpf/Makefile:210: WARNING: Please install kernel headers
locally (make headers_install).
error: unable to create target: 'No available targets are compatible
with triple "bpf"'
1 error generated.
readelf: Error: './llvm_btf_verify.o': No such file
*** ERROR: LLVM (llc) does not support 'bpf' target
   NOTICE: LLVM version >=3D 3.7.1 required

--=20
Best Regards
Masahiro Yamada
