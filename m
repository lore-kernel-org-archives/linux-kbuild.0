Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44223 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfIEIHA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Sep 2019 04:07:00 -0400
MIME-Version: 1.0
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <CAK8P3a0kPFojqAWqXEAcitVMjBA5ABc=rRx=zHMxXat+gCz=gA@mail.gmail.com> <20190904224050.GA82176@archlinux-threadripper>
In-Reply-To: <20190904224050.GA82176@archlinux-threadripper>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 5 Sep 2019 10:06:42 +0200
Message-ID: <CAK8P3a3d-hFFznJAXOjtemV02Zzm_wJW2LefLONRJmobYodmrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] kbuild: refactor scripts/Makefile.extrawarn
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Sep 5, 2019 at 12:40 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> On Wed, Sep 04, 2019 at 11:46:45PM +0200, Arnd Bergmann wrote:
> > On Sat, Aug 31, 2019 at 6:26 PM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> >
> > FWIW, I just found out I missed a bug that clang failed to warn about
> > because of the  -Wno-format. Apparently gcc warns only about type
> > mismatches that result in incompatible calling conventions (e.g.
> > int vs int64_t) but not smaller types (int, short) that get converted to an
> > int anyway. Passing -Wno-format turns both off.
> >
> >       Arnd
>
> Hi Arnd,
>
> This has been fixed in clang 10.0.0 but this areas has not been updated
> as nobody has sent a patch yet:
>
> https://github.com/ClangBuiltLinux/linux/issues/378#issuecomment-524411147

Ok, that's good. I see that on clang-9, the documentation also
mentions that -Wformat control -Wformat-extra-args -Wformat-invalid-specifier
-Wformat-y2k -Wformat-zero-length -Wnonnull and -Wformat-security.
We can probably turn these all on, regardless. The only warning
that produces output here is -Wformat-security, and only in a couple of
files (number of warnings per file from a few hundred randconfig builds):

   384 kernel/trace/ring_buffer_benchmark.c
    176 samples/trace_printk/trace-printk.c
    174 kernel/debug/kdb/kdb_io.c
    102 arch/x86/kernel/e820.c
     80 fs/btrfs/check-integrity.c
     67 fs/reiserfs/prints.c
     63 fs/xfs/xfs_log_recover.c
     54 fs/quota/dquot.c
     53 lib/test_printf.c
     39 sound/core/sound.c
     28 arch/x86/kernel/cpu/mce/core.c
     21 kernel/trace/preemptirq_delay_test.c
     19 sound/core/seq/seq_clientmgr.c
     17 sound/pci/hda/hda_bind.c
     16 sound/usb/mixer_quirks.c
     16 arch/x86/kernel/cpu/mce/amd.c
     15 net/smc/smc_ism.c
     12 kernel/debug/kdb/kdb_main.c
      8 net/netfilter/nf_conntrack_helper.c
      4 kernel/power/suspend_test.c
      3 sound/pci/rme32.c
      3 net/dsa/dsa.c
      2 sound/pci/rme96.c
      1 sound/soc/sof/intel/hda-codec.c
      1 sound/pci/korg1212/korg1212.c

      Arnd
