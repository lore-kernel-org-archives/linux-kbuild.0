Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53142 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933354AbdKPTNP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 14:13:15 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAGJ921u127235
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 14:13:14 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2e9ec17pvc-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 14:13:14 -0500
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 16 Nov 2017 14:13:13 -0500
Date: Thu, 16 Nov 2017 11:13:07 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171116161731.GA94341@samitolvanen.mtv.corp.google.com>
 <20171116163054.kcsdsomr7u2mqql2@hirez.programming.kicks-ass.net>
 <CAKwvOdkV_g0XAbGM+nF2zt=2+tHLLcj=pbSxRDd2HMbrtU3cZg@mail.gmail.com>
 <20171116165922.llrojrvomuihabrt@hirez.programming.kicks-ass.net>
 <CAKwvOd=k=iVQvWmzP1E3XHUCYLoJgx+F9zoPuE+R2oaw_ePUVA@mail.gmail.com>
 <20171116173417.nqsh5dpu65uj7b5s@hirez.programming.kicks-ass.net>
 <20171116174830.GX3624@linux.vnet.ibm.com>
 <CAKwvOdkDz1yRo=Skt_mWxs0uucK+adXx8kFQksMbTE3ofnpUMQ@mail.gmail.com>
 <20171116183950.GA3624@linux.vnet.ibm.com>
 <20171116184508.GC21898@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116184508.GC21898@arm.com>
Message-Id: <20171116191307.GC3624@linux.vnet.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Alexander Potapenko <glider@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>

On Thu, Nov 16, 2017 at 06:45:08PM +0000, Will Deacon wrote:
> On Thu, Nov 16, 2017 at 10:39:51AM -0800, Paul E. McKenney wrote:
> > On Thu, Nov 16, 2017 at 10:16:22AM -0800, Nick Desaulniers wrote:
> > > > On Thu, Nov 16, 2017 at 06:34:17PM +0100, Peter Zijlstra wrote:
> > > >> So the problem is that its very very hard (and painful) to find these
> > > >> bugs. Getting the tools people to comment on these specific
> > > >> optimizations would really help lots.
> > > 
> > > No doubt; I do not disagree with you.  Kernel developers have very
> > > important use cases for the language.
> > > 
> > > But the core point I'm trying to make is "do we need to block this
> > > patch set until issues with the C standards body in regards to the
> > > kernels memory model are resolved?"  I would hope the two are
> > > orthogonal and that we'd take them and then test them even more
> > > extensively than the developer has in order to find out.
> > 
> > Given that I have been working on getting the C and C++ standards to
> > correctly handle rcu_dereference() for more than ten years, I recommend
> > -against- waiting on standardization in the strongest possible terms.
> > And if you think that ten years is bad, the Java standards community has
> > been struggling with out-of-thin-air (OOTA) values for almost 20 years.
> > And the C and C++ standards haven't solved OOTA, either.
> 
> The problem is, if we go ahead with this change, the compiler *will* break
> some address dependencies and something will eventually go wrong. At that
> point, what do we do? Turn off some random compiler optimisation? Add a
> random barrier()?
> 
> We don't necessarily need standardisation, but we at least need guarantees
> from the compiler implementation that LTO/PGO will respect source level
> address dependencies. I don't think we have that today.

Ah, if "this patch set" meant "adding LTO", I stand corrected and I
apologize for my confusion.

I agree that we need LTO/PGO to be housebroken from an LKMM viewpoint
before it is enabled.

							Thanx, Paul

