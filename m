Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33915 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387935AbfG0TOC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jul 2019 15:14:02 -0400
Subject: Re: [RFC PATCH] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <CAK7LNATg1m_pzsZqGDUOUZHzv6jn2K0My8vFWbOVdUSTMQ05Ug@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Message-ID: <5232680b-5303-3d63-db51-de65eea76e3a@linux.com>
Date: Sat, 27 Jul 2019 22:13:50 +0300
MIME-Version: 1.0
In-Reply-To: <CAK7LNATg1m_pzsZqGDUOUZHzv6jn2K0My8vFWbOVdUSTMQ05Ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi.

> Could you drop the solved ones from the list?

Yes, of course. Do you want me to remove all symbols fixed with patches 
or only those are in-tree now?

Should it be like this:
  1. "torture_onoff_cleanup" [kernel/torture]
     "torture_shuffle_cleanup" [kernel/torture]
     Patch: https://lkml.org/lkml/2019/7/4/411 (accepted)
  2. "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress]
     Patch: https://lkml.org/lkml/2019/7/8/842
  3. "drm_client_close" [drivers/gpu/drm/drm]
     Patch: https://lkml.org/lkml/2019/7/3/758 (accepted)
  4. "ahci_em_messages" [drivers/ata/libahci]
     Patch: https://lkml.org/lkml/2019/7/10/550 (reviewed)
  5. "ftrace_set_clr_event" [vmlinux]
     Patch: https://lkml.org/lkml/2019/7/4/609 (reviewed)
  6. "rmi_2d_sensor_set_input_params" [drivers/input/rmi4/rmi_core]
     Patch: https://lkml.org/lkml/2019/7/8/999 (accepted)
  10. "empty_zero_page" [vmlinux]
  11. "phys_base" [vmlinux]
  12. "hypercall_page" [vmlinux]

Or like this:
  1. "empty_zero_page" [vmlinux]
  2. "phys_base" [vmlinux]
  3. "hypercall_page" [vmlinux]

Well, I could remove this list at all. It seems like the following list 
with existing commits is enough to show the problem of static exported 
functions.

I will resend the patch shortly after.

Regards,
Denis
