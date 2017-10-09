Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:44392 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754212AbdJIO0N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 10:26:13 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQaGd5h5OHe5ArXV=wms07Zpd4OBPLrPYwZ68KpbjeGcQ@mail.gmail.com>
References: <1505920670-8290-1-git-send-email-yamada.masahiro@socionext.com>
 <20170927232415.GB5939@codeaurora.org> <CAK7LNAQaGd5h5OHe5ArXV=wms07Zpd4OBPLrPYwZ68KpbjeGcQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 9 Oct 2017 23:25:28 +0900
Message-ID: <CAK7LNARd6ovx=qmny1micPx7BUXf9uL9soES_OcotF-bYCCQWw@mail.gmail.com>
Subject: Re: [PATCH] hexagon: get rid of #include <generated/compile.h>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Kuo <rkuo@codeaurora.org>
Cc: linux-hexagon@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, Oleg Nesterov <oleg@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-10-03 10:26 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Hi Richard,
>
> 2017-09-28 8:24 GMT+09:00 Richard Kuo <rkuo@codeaurora.org>:
>> On Thu, Sep 21, 2017 at 12:17:50AM +0900, Masahiro Yamada wrote:
>>> <generated/compile.h> is created (or updated) when Kbuild descends
>>> into the init/ directory.  In parallel building from a pristine
>>> source tree, there is no guarantee <generated/compile.h> exists when
>>> arch/hexagon/kernel/ptrace.c is compiled.
>>>
>>> For hexagon architecture, we know UTS_MACHINE is a fixed string
>>> "hexagon", so let's hard-code it, like many architectures do.
>>>
>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>> ---
>>>
>>>  arch/hexagon/kernel/ptrace.c | 4 +---
>>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>
>> Acked-by: Richard Kuo <rkuo@codeaurora.org>
>>
>
> How should this patch be handled?
>

I checked
git://git.kernel.org/pub/scm/linux/kernel/git/rkuo/linux-hexagon-kernel.git

I could not see any patch applied to the tree since last year.

Assuming the tree is unmaintained, I am picking this patch to Kbuild tree.



Applied to linux-kbuild/kbuild with Rechard's Acked.



-- 
Best Regards
Masahiro Yamada
