Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:61389 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754461Ab2JCHHS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Oct 2012 03:07:18 -0400
MIME-Version: 1.0
In-Reply-To: <20121003014416.GA10769@localhost>
References: <20121003014416.GA10769@localhost>
Date: Wed, 3 Oct 2012 09:07:17 +0200
Message-ID: <CAMuHMdXZe+cESgU21uB5-QbJa62=Qt8Z7d67-B1-onmUoFAKTQ@mail.gmail.com>
Subject: Re: usr/include/linux/kvm_para.h:26: included file
 'asm-m68k/kvm_para.h' is not exported
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On Wed, Oct 3, 2012 at 3:44 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> FYI, something goes wrong since
>
> commit: 2bbc89a8e9c652ee71c6c3b2e0679b7ecedb1a09  m68k: Use Kbuild logic to import asm-generic headers
> config: m68k-allmodconfig
>
> All error/warnings:
>
> usr/include/linux/kexec.h:49: userspace cannot reference function or variable defined in the kernel
> usr/include/linux/kvm_para.h:26: included file 'asm-m68k/kvm_para.h' is not exported
> usr/include/linux/soundcard.h:1054: userspace cannot reference function or variable defined in the kernel

Yes, this is a known issue, cfr. e.g. https://lkml.org/lkml/2012/9/16/77
The kvm and kbuild people have to get their act together and agree on
a solution.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
