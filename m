Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:21757 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752603AbdDLADh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Apr 2017 20:03:37 -0400
MIME-Version: 1.0
In-Reply-To: <20170403193739.84905-1-mka@chromium.org>
References: <20170403193739.84905-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 12 Apr 2017 09:03:28 +0900
Message-ID: <CAK7LNAQ0sUnXJAzEy8ukK994mUMPJQKHAvyqpvqOXUfaX-pSvA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Consolidate header generation from ASM offset information
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Michal Marek <mmarek@suse.com>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kieran.bingham@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-ia64@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

Hi Matthias,


2017-04-04 4:37 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> Largely redundant code is used in different places to generate C headers
> from offset information extracted from assembly language output.
> Consolidate the code in a Makefile include and use this instead.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>


Please move sed-y and filechk_offsets to scripts/Makefile.lib .
(You may need to rename sed-y
because arch/xtensa/kernel/Makefile uses this name.)


We see various helpers in scripts/Makefile.lib,
so I do not think we need to create a new file just for this one.

Then, please reuse it from arch/ia64/kernel/Makefile and scripts/mod/Makefile.
Like this:

include/generated/nr-irqs.h: arch/$(SRCARCH)/kernel/nr-irqs.s FORCE
        $(call filechk,offsets,__ASM_NR_IRQS_H__)

$(obj)/$(devicetable-offsets-file): $(obj)/devicetable-offsets.s FORCE
        $(call filechk,offsets,__DEVICETABLE_OFFSETS_H__)






-- 
Best Regards
Masahiro Yamada
