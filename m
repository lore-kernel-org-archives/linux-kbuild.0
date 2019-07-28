Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:34809 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbfG1CAu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jul 2019 22:00:50 -0400
MIME-Version: 1.0
References: <20190714152817.24693-1-efremov@linux.com> <CAK7LNATg1m_pzsZqGDUOUZHzv6jn2K0My8vFWbOVdUSTMQ05Ug@mail.gmail.com>
 <5232680b-5303-3d63-db51-de65eea76e3a@linux.com>
In-Reply-To: <5232680b-5303-3d63-db51-de65eea76e3a@linux.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Jul 2019 11:00:06 +0900
Message-ID: <CAK7LNAR5AM_fU36_9vc9wVJhxbzD5Xc72-mqBw6M3k_-9KZjjQ@mail.gmail.com>
Subject: Re: [RFC PATCH] modpost: check for static EXPORT_SYMBOL* functions
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Denis Efremov <efremov@linux.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.

On Sun, Jul 28, 2019 at 4:14 AM Denis Efremov <efremov@linux.com> wrote:
>
> Hi.
>
> > Could you drop the solved ones from the list?
>
> Yes, of course. Do you want me to remove all symbols fixed with patches
> or only those are in-tree now?
>
> Should it be like this:
>   1. "torture_onoff_cleanup" [kernel/torture]
>      "torture_shuffle_cleanup" [kernel/torture]
>      Patch: https://lkml.org/lkml/2019/7/4/411 (accepted)
>   2. "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress]
>      Patch: https://lkml.org/lkml/2019/7/8/842
>   3. "drm_client_close" [drivers/gpu/drm/drm]
>      Patch: https://lkml.org/lkml/2019/7/3/758 (accepted)
>   4. "ahci_em_messages" [drivers/ata/libahci]
>      Patch: https://lkml.org/lkml/2019/7/10/550 (reviewed)
>   5. "ftrace_set_clr_event" [vmlinux]
>      Patch: https://lkml.org/lkml/2019/7/4/609 (reviewed)
>   6. "rmi_2d_sensor_set_input_params" [drivers/input/rmi4/rmi_core]
>      Patch: https://lkml.org/lkml/2019/7/8/999 (accepted)
>   10. "empty_zero_page" [vmlinux]
>   11. "phys_base" [vmlinux]
>   12. "hypercall_page" [vmlinux]
>
> Or like this:
>   1. "empty_zero_page" [vmlinux]
>   2. "phys_base" [vmlinux]
>   3. "hypercall_page" [vmlinux]
>
> Well, I could remove this list at all. It seems like the following list
> with existing commits is enough to show the problem of static exported
> functions.

Yeah, I agree.
Showing some existing commits is enough.



> I will resend the patch shortly after.
>
> Regards,
> Denis



-- 
Best Regards
Masahiro Yamada
