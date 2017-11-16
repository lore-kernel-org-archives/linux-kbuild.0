Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40012 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S936390AbdKPRsh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Nov 2017 12:48:37 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAGHj8U9135998
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 12:48:37 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2e9ec13mpc-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Nov 2017 12:48:36 -0500
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-kbuild@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Thu, 16 Nov 2017 12:48:35 -0500
Date: Thu, 16 Nov 2017 09:48:30 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 18/18] arm64: select ARCH_SUPPORTS_LTO_CLANG
Reply-To: paulmck@linux.vnet.ibm.com
References: <20171115213428.22559-1-samitolvanen@google.com>
 <20171115213428.22559-19-samitolvanen@google.com>
 <20171116115810.GH9361@arm.com>
 <20171116161731.GA94341@samitolvanen.mtv.corp.google.com>
 <20171116163054.kcsdsomr7u2mqql2@hirez.programming.kicks-ass.net>
 <CAKwvOdkV_g0XAbGM+nF2zt=2+tHLLcj=pbSxRDd2HMbrtU3cZg@mail.gmail.com>
 <20171116165922.llrojrvomuihabrt@hirez.programming.kicks-ass.net>
 <CAKwvOd=k=iVQvWmzP1E3XHUCYLoJgx+F9zoPuE+R2oaw_ePUVA@mail.gmail.com>
 <20171116173417.nqsh5dpu65uj7b5s@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116173417.nqsh5dpu65uj7b5s@hirez.programming.kicks-ass.net>
Message-Id: <20171116174830.GX3624@linux.vnet.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Sami Tolvanen <samitolvanen@google.com>, Will Deacon <will.deacon@arm.com>, Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>

On Thu, Nov 16, 2017 at 06:34:17PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 16, 2017 at 09:16:49AM -0800, Nick Desaulniers wrote:
> > On Thu, Nov 16, 2017 at 8:59 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> > > On Thu, Nov 16, 2017 at 08:50:41AM -0800, Nick Desaulniers wrote:
> > >> On Thu, Nov 16, 2017 at 8:30 AM, Peter Zijlstra <peterz@infradead.org> wrote:
> > >>
> > >> > Ideally we'd get the toolchain people to commit to supporting the kernel
> > >> > memory model along side the C11 one. That would help a ton.
> > >>
> > >> Does anyone from the kernel side participate in the C standardization process?
> > >
> > > Yes, Paul McKenney and Will Deacon. Doesn't mean these two can still be
> > > reconciled though. From what I understand C11 (and onwards) are
> > > incompatible with the kernel model on a number of subtle points.
> > 
> > It would be good to have these incompatibilities written down, then
> > for the sake of argument, they can be cited both for discussions on
> > LKML and in the C standardization process.  For example, a running
> > list in Documentation/ or something would make it so that anyone could
> > understand and cite current issues with the latest C standard.
> 
> Will should be able to produce this list; I know he's done before, I
> just can't find it -- my Google-foo isn't strong today.

Here you go:

http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0124r4.html

> > I don't understand why we'd block patches for enabling experimental
> > features.  We've been running this patch-set on actual devices for
> > months and would love to provide them to the community for further
> > testing.  If bugs are found, then there's more evidence to bring to
> > the C standards committee.  Otherwise we're shutting down feature
> > development for the sake of potential bugs in a C standard we're not
> > even using.
> 
> So the problem is that its very very hard (and painful) to find these
> bugs. Getting the tools people to comment on these specific
> optimizations would really help lots.

It would be good to get something similar to LKMM into KTSAN, for
example.  There would probably be a few differences due to efficiency
concerns, but closer is better than less close.  ;-)

							Thanx, Paul

