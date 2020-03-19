Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:56546 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgCSIDY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Mar 2020 04:03:24 -0400
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02J83Avo026110
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2020 17:03:11 +0900
Received: by mail-vk1-f180.google.com with SMTP id s194so446929vkb.11
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2020 01:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev> <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
 <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev> <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
 <a4e69e0c-284c-8599-71ed-e20e6a25fcf7@mir.dev>
In-Reply-To: <a4e69e0c-284c-8599-71ed-e20e6a25fcf7@mir.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 19 Mar 2020 17:02:33 +0900
Message-ID: <CAK7LNATOK_BuFSUD19ixFa7AVS55KADd_VSffZ3sO=m-CtoY2A@mail.gmail.com>
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with CONFIG_KALLSYMS_BASE_RELATIVE
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mikhail Petrov <Mikhail.Petrov@mir.dev>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>

Hi Mikhail,

On Fri, Mar 13, 2020 at 4:36 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>
>
>
> On 11.03.2020 23:56, Masahiro Yamada wrote:
> > On Thu, Mar 12, 2020 at 3:18 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
> >>
> >> Hi Masahiro,
> >>
> >> On 11.03.2020 9:06, Masahiro Yamada wrote:
> >>> Hi Mikhail,
> >>>
> >>> On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
> >>>>
> >>>> There is the code in the read_symbol function in 'scripts/kallsyms.c':
> >>>>
> >>>>         if (is_ignored_symbol(name, type))
> >>>>                 return NULL;
> >>>>
> >>>>         /* Ignore most absolute/undefined (?) symbols. */
> >>>>         if (strcmp(name, "_text") == 0)
> >>>>                 _text = addr;
> >>>>
> >>>> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
> >>>>
> >>>> It makes the wrong kallsyms_relative_base symbol as a result of the code:
> >>>>
> >>>>         if (base_relative) {
> >>>>                 output_label("kallsyms_relative_base");
> >>>>                 output_address(relative_base);
> >>>>                 printf("\n");
> >>>>         }
> >>>>
> >>>> Because the output_address function uses the _text variable.
> >>>>
> >>>> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
> >>>>
> >>>>         Call Trace:
> >>>>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
> >>>>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
> >>>>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
> >>>>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
> >>>>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
> >>>>
> >>>> The right stack trace:
> >>>>
> >>>>         Call Trace:
> >>>>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
> >>>>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
> >>>>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
> >>>>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
> >>>>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
> >>>>
> >>>> Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>
> >>>>
> >>>> ---
> >>>
> >>>
> >>> Thanks for the patch.
> >>>
> >>> Just for curiosity, on which architecrure
> >>> did you see  name="_text" and type='a' case ?
> >>
> >> Actually 'a' is 'A' (my mistake). The architecture is PowerPC - core PPC476FS.
> >>
> >> nm -n .tmp_vmlinux1 looks like:
> >>
> >> ...
> >>          w kallsyms_token_table
> >>          w mach_powermac
> >> 00000007 a LG_CACHELINE_BYTES
> >> 00000007 a LG_CACHELINE_BYTES
> >> 00000007 a LG_CACHELINE_BYTES
> >> 00000020 a reg
> >> 0000007f a CACHELINE_MASK
> >> 0000007f a CACHELINE_MASK
> >> 0000007f a CACHELINE_MASK
> >> 00000080 a CACHELINE_BYTES
> >> 00000080 a CACHELINE_BYTES
> >> 00000080 a CACHELINE_BYTES
> >> 00000400 a dcr
> >> 80000000 T _start
> >> 80000000 A _stext
> >> 80000000 A _text
> >
> >
> > Hmm, I am still not able to reproduce this.
> >
> > I compiled ARCH=powerpc, but
> > 'powerpc-linux-nm -n .tmp_vmlinux1' got this.
> >
> >
> > 0000007f a CACHELINE_MASK
> > 0000007f a CACHELINE_MASK
> > 0000007f a CACHELINE_MASK
> > 00000080 a CACHELINE_BYTES
> > 00000080 a CACHELINE_BYTES
> > 00000080 a CACHELINE_BYTES
> > 00000400 a dcr
> > c0000000 T _start
> > c0000000 T _stext
> > c0000000 T _text
> > c00000b8 t interrupt_base
> > c00000c0 t CriticalInput
> > c00001a0 t MachineCheck
> > c0000280 t MachineCheckA
> >
> >
> >
> >
> > Which defconfig did you use?
>
> I use a custom config file for a custom SoC with two PPC476FS cores. The config is not in the upstream repository. The same effect can be reached with '44x/akebono_defconfig'.
>
> I did some investigation with the GCC version.
>
> GCC version  4.8.1 (akebono_defconfig):
>
> 00000007 a LG_CACHELINE_BYTES
> 00000020 a reg
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000400 a dcr
> 00000400 a spr
> c0000000 T _start
> c0000000 A _stext
> c0000000 A _text
> c0000088 t interrupt_base
> c00000a0 t CriticalInput
> c0000180 t MachineCheck
>
> GCC version 7.5.0 (akebono_defconfig):
>
> 00000007 a LG_CACHELINE_BYTES
> 00000020 a reg
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 0000007f a CACHELINE_MASK
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000080 a CACHELINE_BYTES
> 00000400 a dcr
> 00000400 a spr
> c0000000 T _start
> c0000000 T _stext
> c0000000 T _text
> c0000088 t interrupt_base
> c00000a0 t CriticalInput
> c0000180 t MachineCheck
>
> So, I used an old version of GCC. Changing the GCC version solved the problem. Maybe the patch is not necessary.



Confirmed.

I was able to reproduce it with the following toolchain.

https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/x86_64-gcc-4.6.3-nolibc_powerpc64-linux.tar.xz



Actually, this is not GCC, but linker (binutils) issue.

This happens on any architecture
if you use GNU binutils <= 2.22


The current minimal supported version is
2.21, so I will pick up v2.





>
> >
> >
> > (I also CCed the ppc maintainer,
> > I am just curious what makes _text absolute.)
> >
> >
> >
> >
> >
> >
> >
> >> 80000088 t interrupt_base
> >> 800000a0 t CriticalInput
> >> 80000180 t MachineCheck
> >> 80000260 t MachineCheckA
> >> 80000360 t DataStorage
> >> 80000420 t InstructionStorage
> >> 80000500 t ExternalInput
> >> 800005c0 t Alignment
> >> 80000680 t Program
> >> 80000740 t FloatingPointUnavailable
> >> 80000820 t SystemCall
> >> 80000900 t AuxillaryProcessorUnavailable
> >> ...
> >>
> >>
> >>> Could you wrap the commit log to avoid
> >>> this checkpatch warning?
> >>> WARNING: Possible unwrapped commit description (prefer a maximum 75
> >>> chars per line)
> >>>
> >>> Also, could you shorten the patch subject
> >>> to make it fit in this limit?
> >>
> >> Sorry for that. Now I know about scripts/checkpatch.pl. I will improve and resubmit the patch soon.
> >>
> >> Thanks.
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
> >
>
> --
> Best Regards,
> Mikhail Petrov
>


--
Best Regards
Masahiro Yamada
