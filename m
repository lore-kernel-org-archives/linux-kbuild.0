Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:15116 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832AbbKZFcr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Nov 2015 00:32:47 -0500
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_8df8u5bGmd+dPFg4imPItA)"
Date: Thu, 26 Nov 2015 00:32:45 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v2 2/2] ARM: Replace calls to __aeabi_{u}idiv with
 udiv/sdiv instructions
In-reply-to: <yw1xziy1o62j.fsf@unicorn.mansr.com>
Message-id: <alpine.LFD.2.20.1511252259090.22569@knanqh.ubzr>
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
 <1448488264-23400-3-git-send-email-sboyd@codeaurora.org>
 <alpine.LFD.2.20.1511251733570.22569@knanqh.ubzr>
 <yw1x8u5lpqqz.fsf@unicorn.mansr.com>
 <alpine.LFD.2.20.1511251931050.22569@knanqh.ubzr>
 <yw1x4mg9posf.fsf@unicorn.mansr.com>
 <20151126012859.GX8644@n2100.arm.linux.org.uk>
 <yw1xziy1o62j.fsf@unicorn.mansr.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?ISO-8859-15?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_8df8u5bGmd+dPFg4imPItA)
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Thu, 26 Nov 2015, Måns Rullgård wrote:

> Russell King - ARM Linux <linux@arm.linux.org.uk> writes:
> 
> > On Thu, Nov 26, 2015 at 12:50:08AM +0000, Måns Rullgård wrote:
> >> If not calling the function saves an I-cache miss, the benefit can be
> >> substantial.  No, I have no proof of this being a problem, but it's
> >> something that could happen.
> >
> > That's a simplistic view of modern CPUs.
> >
> > As I've already said, modern CPUs which have branch prediction, but
> > they also have speculative instruction fetching and speculative data
> > prefetching - which the CPUs which have idiv support will have.
> >
> > With such features, the branch predictor is able to learn that the
> > branch will be taken, and because of the speculative instruction
> > fetching, it can bring the cache line in so that it has the
> > instructions it needs with minimal or, if working correctly,
> > without stalling the CPU pipeline.
> 
> It doesn't matter how many fancy features the CPU has.  Executing more
> branches and using more cache lines puts additional pressure on those
> resources, reducing overall performance.  Besides, the performance
> counters readily show that the prediction is nothing near as perfect as
> you seem to believe.

OK... Let's try to come up with actual numbers.

We know that letting gcc emit idiv by itself is the ultimate solution. 
And it is free of maintenance on our side besides passing the 
appropriate argument to gcc of course. So this is worth doing.

For the case where you have a set of target machines in your kernel that 
may or may not have idiv, then the first step should be to patch 
__aeabi_uidiv and __aeabi_idiv.  This is a pretty small and simple 
change that might turn out to be more than good enough. It is necessary 
anyway as the full patching solution does not cover all cases.

Then, IMHO, it would be a good idea to get performance numbers to 
compare that first step and the full patching solution. Of course the 
full patching will yield better performance. It has to. But if the 
difference is not significant enough, then it might not be worth 
introducing the implied complexity into mainline.  And it is not because 
the approach is bad. In fact I think this is a very cool hack. But it 
comes with a cost in maintenance and that cost has to be justified.

Just to have an idea, I produced the attached micro benchmark. I tested 
on a TC2 forced to a single Cortex-A15 core and I got those results:

Testing INLINE_DIV ...

real    0m7.182s
user    0m7.170s
sys     0m0.000s

Testing PATCHED_DIV ...

real    0m7.181s
user    0m7.170s
sys     0m0.000s

Testing OUTOFLINE_DIV ...

real    0m7.181s
user    0m7.170s
sys     0m0.005s

Testing LIBGCC_DIV ...

real    0m18.659s
user    0m18.635s
sys     0m0.000s

As you can see, whether the div is inline or out-of-line, whether 
arguments are moved into r0-r1 or not, makes no difference at all on a 
Cortex-A15.

Now forcing it onto a Cortex-A7 core:

Testing INLINE_DIV ...

real    0m8.917s
user    0m8.895s
sys     0m0.005s

Testing PATCHED_DIV ...

real    0m11.666s
user    0m11.645s
sys     0m0.000s

Testing OUTOFLINE_DIV ...

real    0m13.065s
user    0m13.025s
sys     0m0.000s

Testing LIBGCC_DIV ...

real    0m51.815s
user    0m51.750s
sys     0m0.005s

So on A cortex-A7 the various overheads become visible. How significant 
is it in practice with normal kernel usage? I don't know.


Nicolas

--Boundary_(ID_8df8u5bGmd+dPFg4imPItA)
Content-id: <alpine.LFD.2.20.1511260032450.22569@knanqh.ubzr>
Content-type: text/plain; CHARSET=US-ASCII; name=go
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=go
Content-description: 

#!/bin/sh
set -e
for test in INLINE_DIV PATCHED_DIV OUTOFLINE_DIV LIBGCC_DIV; do
  gcc -o divtest_$test divtest.S -D$test
  echo "Testing $test ..."
  time ./divtest_$test
  echo
  rm -f divtest_$test
done


--Boundary_(ID_8df8u5bGmd+dPFg4imPItA)
Content-id: <alpine.LFD.2.20.1511260032451.22569@knanqh.ubzr>
Content-type: text/plain; CHARSET=US-ASCII; name=divtest.S
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=divtest.S
Content-description: 

	.arm
	.arch_extension idiv

	.globl main
main:

	stmfd	sp!, {r4, r5, lr}

	mov	r4, #17
1:	mov	r5, #1

2:
#if defined(INLINE_DIV)

	udiv	r0, r4, r5

#elif defined(OUTOFLINE_DIV)

	mov	r0, r4
	mov	r1, r5
	bl	my_div

#elif defined(PATCHED_DIV)

	mov	r0, r4
	mov	r1, r5
	udiv	r0, r0, r1

#elif defined(LIBGCC_DIV)

	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_uidiv

#else
#error "define INLINE_DIV, OUTOFLINE_DIV or LIBGCC_DIV"
#endif

	add	r5, r5, #1
	cmp	r4, r5
	bhs	2b
	adds	r4, r4, r4, lsl #1
	bpl	1b

	mov	r0, #0
	ldmfd	sp!, {r4, r5, pc}

	.space 1024

my_div:

	udiv	r0, r0, r1
	bx	lr



--Boundary_(ID_8df8u5bGmd+dPFg4imPItA)--
