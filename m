Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38742 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfG2CXG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 22:23:06 -0400
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de>
 <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
 <alpine.DEB.2.21.1907281111570.1791@nanos.tec.linutronix.de> <alpine.DEB.2.21.1907282026320.1791@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1907282026320.1791@nanos.tec.linutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 29 Jul 2019 11:22:21 +0900
Message-ID: <CAK7LNARTNzxHg4G0jxdNcNhwxtSbBRYNKgYSeFfR1edMw5DrwQ@mail.gmail.com>
Subject: Re: [PATCH V2] Kbuild: Handle PREEMPT_RT for version string and magic
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Sebastian Sewior <bigeasy@linutronix.de>

On Mon, Jul 29, 2019 at 3:27 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Update the build scripts and the version magic to reflect when
> CONFIG_PREEMPT_RT is enabled in the same way as CONFIG_PREEMPT is treated.
>
> The resulting version strings:
>
>   Linux m 5.3.0-rc1+ #100 SMP Fri Jul 26 ...
>   Linux m 5.3.0-rc1+ #101 SMP PREEMPT Fri Jul 26 ...
>   Linux m 5.3.0-rc1+ #102 SMP PREEMPT_RT Fri Jul 26 ...
>
> The module vermagic:
>
>   5.3.0-rc1+ SMP mod_unload modversions
>   5.3.0-rc1+ SMP preempt mod_unload modversions
>   5.3.0-rc1+ SMP preempt_rt mod_unload modversions
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
> V2: Simplify the ifdeffery as pointed out by Masahiro


Applied to linux-kbuild.
Thanks.

-- 
Best Regards
Masahiro Yamada
