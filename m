Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52506 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753788AbdDMXpF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Apr 2017 19:45:05 -0400
MIME-Version: 1.0
In-Reply-To: <20170412194352.108290-1-mka@chromium.org>
References: <20170412194352.108290-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 14 Apr 2017 08:44:56 +0900
Message-ID: <CAK7LNAQcPmL9wscO2NY78zc8q+07ck8LucZDUUPjzAYxcyK10g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Consolidate header generation from ASM offset information
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kieran.bingham@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-ia64@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

2017-04-13 4:43 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> Largely redundant code is used in different places to generate C headers
> from offset information extracted from assembly language output.
> Consolidate the code in Makefile.lib and use this instead.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>


Applied to linux-kbuild/kbuild.
Thanks!


-- 
Best Regards
Masahiro Yamada
