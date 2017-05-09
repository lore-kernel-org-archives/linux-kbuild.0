Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:55416 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754120AbdEIRWI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 May 2017 13:22:08 -0400
MIME-Version: 1.0
In-Reply-To: <6085107a-b860-92d3-c921-7fa6524c3d0a@6wind.com>
References: <CAK7LNAR_yp+O9jUZC8mKdaHgTiCkE7p2-ZbA9YZ8OGyp+uxhBQ@mail.gmail.com>
 <1490617217-30192-1-git-send-email-nicolas.dichtel@6wind.com>
 <1490617217-30192-11-git-send-email-nicolas.dichtel@6wind.com>
 <CAK7LNAT_iNH7RyPKW8aqOTcbr8rHyeWb2ijJpkw3b-rnR_=eFQ@mail.gmail.com> <6085107a-b860-92d3-c921-7fa6524c3d0a@6wind.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 10 May 2017 02:22:03 +0900
Message-ID: <CAK7LNARQTCNcmVb3b3H4fDEZ93cWuowkYU2+OCUcr9Dxq6x0bA@mail.gmail.com>
Subject: Re: [PATCH v11 10/12] uapi: export all headers under uapi directories
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Nicolas,

2017-05-09 19:09 GMT+09:00 Nicolas Dichtel <nicolas.dichtel@6wind.com>:
> Le 08/05/2017 =C3=A0 01:17, Masahiro Yamada a =C3=A9crit :
> Hi Masahiro,
>
> [snip]
>
>> I will send pull-requests for v4.12 in a few days.
>>
>> I need to fix a complex conflict reported by
>> https://lkml.org/lkml/2017/4/10/1208
>>
>> I rebased linux-kbuild/uapi on commit 13e0988140
>> (dropping 08/12 "cryptouser.h: fix include from userland").
> Ok.
>
>>
>>
>> I updated the list of headers, which were not exported,
>> are now exported.
>>
>> If you find something is wrong, please let me know.
>> The list is now as follows:
>>
>>     asm-arc/kvm_para.h
>>     asm-arc/ucontext.h
>>     asm-blackfin/shmparam.h
>>     asm-blackfin/ucontext.h
>>     asm-c6x/shmparam.h
>>     asm-c6x/ucontext.h
>>     asm-cris/kvm_para.h
>>     asm-h8300/shmparam.h
>>     asm-h8300/ucontext.h
>>     asm-hexagon/shmparam.h
>>     asm-m32r/kvm_para.h
>>     asm-m68k/kvm_para.h
>>     asm-m68k/shmparam.h
>>     asm-metag/kvm_para.h
>>     asm-metag/shmparam.h
>>     asm-metag/ucontext.h
>>     asm-mips/hwcap.h
>>     asm-mips/reg.h
>>     asm-mips/ucontext.h
>>     asm-nios2/kvm_para.h
>>     asm-nios2/ucontext.h
>>     asm-openrisc/shmparam.h
>>     asm-parisc/kvm_para.h
>>     asm-powerpc/perf_regs.h
>>     asm-sh/kvm_para.h
>>     asm-sh/ucontext.h
>>     asm-tile/shmparam.h
>>     asm-unicore32/shmparam.h
>>     asm-unicore32/ucontext.h
>>     asm-x86/hwcap2.h
>>     asm-xtensa/kvm_para.h
>>     drm/armada_drm.h
>>     drm/etnaviv_drm.h
>>     drm/vgem_drm.h
>>     linux/aspeed-lpc-ctrl.h
>>     linux/auto_dev-ioctl.h
>>     linux/bcache.h
>>     linux/btrfs_tree.h
>>     linux/can/vxcan.h
>>     linux/cifs/cifs_mount.h
>>     linux/coresight-stm.h
>>     linux/cryptouser.h
>>     linux/genwqe/genwqe_card.h
>>     linux/fsmap.h
>>     linux/hash_info.h
>>     linux/kcm.h
>>     linux/kcov.h
>>     linux/kfd_ioctl.h
>>     linux/lightnvm.h
>>     linux/module.h
>>     linux/nbd-netlink.h
>>     linux/nilfs2_api.h
>>     linux/nilfs2_ondisk.h
>>     linux/nsfs.h
>>     linux/pr.h
>>     linux/qrtr.h
>>     linux/rpmsg.h
>>     linux/sched/types.h
>>     linux/sed-opal.h
>>     linux/smc.h
>>     linux/smc_diag.h
>>     linux/stm.h
>>     linux/wil6210_uapi.h
>>     rdma/bnxt_re-abi.h
>
> linux/vfio_ccw.h is missing in your list.
> And to be a bit picky, linux/fsmap.h should be put before
> linux/genwqe/genwqe_card.h ;-)
>
> I've rebased my tree on commit 2868b2513aa7 (see
> https://github.com/NicolasDichtel/linux/commits/master) and the following=
 file
> should also be added after that: linux/switchtec_ioctl.h.
>

This is helpful.  Thank you!


--=20
Best Regards
Masahiro Yamada
