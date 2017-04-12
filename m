Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:36274 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751645AbdDLBih (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Apr 2017 21:38:37 -0400
Received: by mail-pg0-f47.google.com with SMTP id g2so6678092pge.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Apr 2017 18:38:37 -0700 (PDT)
Date: Tue, 11 Apr 2017 18:38:34 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH] kbuild: Consolidate header generation from ASM offset
 information
Message-ID: <20170412013834.GE28657@google.com>
References: <20170403193739.84905-1-mka@chromium.org>
 <CAK7LNAQ0sUnXJAzEy8ukK994mUMPJQKHAvyqpvqOXUfaX-pSvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ0sUnXJAzEy8ukK994mUMPJQKHAvyqpvqOXUfaX-pSvA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Michal Marek <mmarek@suse.com>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kieran.bingham@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-ia64@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

Hi Masahiro,

El Wed, Apr 12, 2017 at 09:03:28AM +0900 Masahiro Yamada ha dit:

> 2017-04-04 4:37 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> > Largely redundant code is used in different places to generate C headers
> > from offset information extracted from assembly language output.
> > Consolidate the code in a Makefile include and use this instead.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> 
> Please move sed-y and filechk_offsets to scripts/Makefile.lib .
> (You may need to rename sed-y
> because arch/xtensa/kernel/Makefile uses this name.)
> 
> 
> We see various helpers in scripts/Makefile.lib,
> so I do not think we need to create a new file just for this one.
> 
> Then, please reuse it from arch/ia64/kernel/Makefile and scripts/mod/Makefile.
> Like this:
> 
> include/generated/nr-irqs.h: arch/$(SRCARCH)/kernel/nr-irqs.s FORCE
>         $(call filechk,offsets,__ASM_NR_IRQS_H__)
> 
> $(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FORCE
>         $(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)

Thanks for your comments, I'll rework the patch accordingly.

Cheers

Matthias
