Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from unicorn.mansr.com ([81.2.72.234]:44022 "EHLO unicorn.mansr.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734AbbKZCT5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Nov 2015 21:19:57 -0500
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH v2 2/2] ARM: Replace calls to __aeabi_{u}idiv with udiv/sdiv instructions
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
	<1448488264-23400-3-git-send-email-sboyd@codeaurora.org>
	<alpine.LFD.2.20.1511251733570.22569@knanqh.ubzr>
	<yw1x8u5lpqqz.fsf@unicorn.mansr.com>
	<alpine.LFD.2.20.1511251931050.22569@knanqh.ubzr>
	<yw1x4mg9posf.fsf@unicorn.mansr.com>
	<20151126012859.GX8644@n2100.arm.linux.org.uk>
Date: Thu, 26 Nov 2015 02:19:48 +0000
In-Reply-To: <20151126012859.GX8644@n2100.arm.linux.org.uk> (Russell King's
	message of "Thu, 26 Nov 2015 01:28:59 +0000")
Message-ID: <yw1xziy1o62j.fsf@unicorn.mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Nicolas Pitre <nico@fluxnic.net>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Russell King - ARM Linux <linux@arm.linux.org.uk> writes:

> On Thu, Nov 26, 2015 at 12:50:08AM +0000, Måns Rullgård wrote:
>> If not calling the function saves an I-cache miss, the benefit can be
>> substantial.  No, I have no proof of this being a problem, but it's
>> something that could happen.
>
> That's a simplistic view of modern CPUs.
>
> As I've already said, modern CPUs which have branch prediction, but
> they also have speculative instruction fetching and speculative data
> prefetching - which the CPUs which have idiv support will have.
>
> With such features, the branch predictor is able to learn that the
> branch will be taken, and because of the speculative instruction
> fetching, it can bring the cache line in so that it has the
> instructions it needs with minimal or, if working correctly,
> without stalling the CPU pipeline.

It doesn't matter how many fancy features the CPU has.  Executing more
branches and using more cache lines puts additional pressure on those
resources, reducing overall performance.  Besides, the performance
counters readily show that the prediction is nothing near as perfect as
you seem to believe.

-- 
Måns Rullgård
mans@mansr.com
