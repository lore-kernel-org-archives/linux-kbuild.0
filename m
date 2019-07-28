Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([193.142.43.55]:51491 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbfG1JNx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 05:13:53 -0400
Date: Sun, 28 Jul 2019 11:13:44 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] Kbuild: Handle PREEMPT_RT for version string and magic
In-Reply-To: <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1907281111570.1791@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de> <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Sebastian Sewior <bigeasy@linutronix.de>

Masahiro,

On Sun, 28 Jul 2019, Masahiro Yamada wrote:
> 
> Since CONFIG_PREEMPTION was introduced after -rc1,
> I think this should be queued on top of -rc2.

Right. Are you picking it up?

> > -#ifdef CONFIG_PREEMPT
> > -#define MODULE_VERMAGIC_PREEMPT "preempt "
> > +#ifdef CONFIG_PREEMPTION
> > +# ifdef CONFIG_PREEMPT
> > +#  define MODULE_VERMAGIC_PREEMPT "preempt "
> > +# else
> > +#  define MODULE_VERMAGIC_PREEMPT "preempt_rt "
> > +# endif
> >  #else
> > -#define MODULE_VERMAGIC_PREEMPT ""
> > +# define MODULE_VERMAGIC_PREEMPT ""
> 
> Maybe, is the following more readable?
> 
> #if defined(CONFIG_PREEMPT_RT)
> #define MODULE_VERMAGIC_PREEMPT "preempt_rt "
> #elif defined(CONFIG_PREEMPT)
> #define MODULE_VERMAGIC_PREEMPT "preempt "
> #else
> #define MODULE_VERMAGIC_PREEMPT ""
> #endif

Doh. That's obvious. Must be a result of the heat wave we had.
Will send a V2.

Thanks,

	tglx
