Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57742 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750794AbdKUSvz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Nov 2017 13:51:55 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vALInHbx040455
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2017 13:51:55 -0500
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ecsdn8skh-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Nov 2017 13:51:54 -0500
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 21 Nov 2017 13:51:53 -0500
Date: Tue, 21 Nov 2017 10:51:47 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171116174830.GX3624@linux.vnet.ibm.com>
 <CAKwvOdkDz1yRo=Skt_mWxs0uucK+adXx8kFQksMbTE3ofnpUMQ@mail.gmail.com>
 <20171116183950.GA3624@linux.vnet.ibm.com>
 <20171116184508.GC21898@arm.com>
 <20171116191307.GC3624@linux.vnet.ibm.com>
 <20171116201701.GA143965@samitolvanen.mtv.corp.google.com>
 <20171120180554.GM32488@arm.com>
 <20171120193256.e6fnn2arwqc5wqkp@hirez.programming.kicks-ass.net>
 <20171120205350.GZ3624@linux.vnet.ibm.com>
 <1f19a8816278495f997f4331ef0e015e@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f19a8816278495f997f4331ef0e015e@AcuMS.aculab.com>
Message-Id: <20171121185147.GN3624@linux.vnet.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>, Sami Tolvanen <samitolvanen@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Alexander Potapenko <glider@google.com>, Stephen Hines <srhines@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Manoj Gupta <manojgupta@google.com>

On Tue, Nov 21, 2017 at 05:23:52PM +0000, David Laight wrote:
> From: Paul E. McKenney
> > Sent: 20 November 2017 20:54
> > 
> > On Mon, Nov 20, 2017 at 08:32:56PM +0100, Peter Zijlstra wrote:
> > > On Mon, Nov 20, 2017 at 06:05:55PM +0000, Will Deacon wrote:
> > > > Although the current direction of the C++ committee is to prefer
> > > > that dependencies are explicitly "marked", this is not deemed to be
> > > > acceptable for the kernel (in other words, everything is always considered
> > > > "marked").
> > >
> > > Yeah, that is an attitude not compatible with existing code. Much like
> > > the proposal to allow temporary/wide stores on everything not explicitly
> > > declared atomic. Such stuff instantly breaks all extant code that does
> > > multi-threading with no recourse.
> > 
> > If someone suggests temporary/wide stores, even on non-atomics, tell
> > them that the standard does not permit them to introduce data races.
> 
> The C standard doesn't say anything about multi-threading.

Actually, recent versions of the C standard really do cover
multi-threading, and have for some years.  For example, the June 2010
draft has this to say in section 5.1.2.4:

	Under a hosted implementation, a program can have more than one
	thread of execution (or thread) running concurrently.

Later, in paragraph 25 of this same section:

	The execution of a program contains a data race if it contains
	two conflicting actions in different threads, at least one of
	which is not atomic, and neither happens before the other. Any
	such data race results in undefined behavior.

Because the compiler is not allowed to introduce undefined behavior in a
program that does not already contain undefined behavior, the compiler
is absolutely forbidden from inventing stores unless it can prove that
doing so does not introduce a data race.

One (painful and annoying) case in which it can prove this is just before
a normal (non-volatile and non-atomic) store.

> The x86 bis (bit set) family are well known for being problematic
> because they always do a 32bit wide rmw cycle.

If the compiler is careful, it can invent atomic read-modify-write cycles
to uninvolved variables.  Here "is careful" includes ensuring that any
read from or write to one of those uninvolved variables acts just as it
would in the absence of the atomic read-modify-write cycle.

But I did say "store" above, not atomic read-modify-write operation.  ;-)

							Thanx, Paul

