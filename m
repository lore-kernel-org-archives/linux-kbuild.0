Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:21635 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729647AbgGFSPw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 14:15:52 -0400
MIME-Version: 1.0
References: <20200628015041.1000002-1-masahiroy@kernel.org>
 <87imfa8le0.fsf@mpe.ellerman.id.au> <CAK7LNATusciypBJ4dYZcyrugdi_rXEV_s=zxAehDxsX+Sd5z4g@mail.gmail.com>
 <CADYN=9JnzPC6Ja9s3_01k-CDTSuxKBMRdrqU5rqp0xw1r9XpRw@mail.gmail.com>
In-Reply-To: <CADYN=9JnzPC6Ja9s3_01k-CDTSuxKBMRdrqU5rqp0xw1r9XpRw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 Jul 2020 03:14:40 +0900
Message-ID: <CAK7LNARg_B+tcbduBzrh2_Q3dwk_XxDcaw+sMTwsMOxNYM7hnQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Ingo Molnar <mingo@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Paul Mackerras <paulus@samba.org>, Rich Felker <dalias@libc.org>, Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux-sh list <linux-sh@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

Hi Anders,

On Mon, Jul 6, 2020 at 8:24 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>

> The full log can be found here [1].
>
> Without this patch for  'trace_selftest_dynamic' for instance, CC_FLAGS_FTRACE
> was removed from kernel/trace/*, and then added back to
> kernel/trace/trace_selftest_dynamic.
> While with this patch it looks like we add the flag (even though it is
> already there), and then
> removes the flag for all files in kernel/trace/* .


You are right.

I will drop this patch,
and send v2.


Thank you.




-- 
Best Regards
Masahiro Yamada
