Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from unicorn.mansr.com ([81.2.72.234]:43505 "EHLO unicorn.mansr.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751728AbbKZAuM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Nov 2015 19:50:12 -0500
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH v2 2/2] ARM: Replace calls to __aeabi_{u}idiv with udiv/sdiv instructions
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
	<1448488264-23400-3-git-send-email-sboyd@codeaurora.org>
	<alpine.LFD.2.20.1511251733570.22569@knanqh.ubzr>
	<yw1x8u5lpqqz.fsf@unicorn.mansr.com>
	<alpine.LFD.2.20.1511251931050.22569@knanqh.ubzr>
Date: Thu, 26 Nov 2015 00:50:08 +0000
In-Reply-To: <alpine.LFD.2.20.1511251931050.22569@knanqh.ubzr> (Nicolas
	Pitre's message of "Wed, 25 Nov 2015 19:44:50 -0500 (EST)")
Message-ID: <yw1x4mg9posf.fsf@unicorn.mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Nicolas Pitre <nico@fluxnic.net> writes:

> On Thu, 26 Nov 2015, Måns Rullgård wrote:
>
>> Nicolas Pitre <nico@fluxnic.net> writes:
>> 
>> > 3) In fact I was wondering if the overhead of the branch and back is 
>> >    really significant compared to the non trivial cost of a idiv 
>> >    instruction and all the complex infrastructure required to patch 
>> >    those branches directly, and consequently if the performance 
>> >    difference is actually worth it versus simply doing (2) alone.
>> 
>> Depending on the operands, the div instruction can take as few as 3
>> cycles on a Cortex-A7.
>
> Even the current software based implementation can produce a result with 
> about 5 simple ALU instructions depending on the operands.
>
> The average cycle count is more important than the easy-way-out case. 
> And then how significant the two branches around it are compared to idiv 
> alone from direct patching of every call to it.

If not calling the function saves an I-cache miss, the benefit can be
substantial.  No, I have no proof of this being a problem, but it's
something that could happen.

Of course, none of this is going to be as good as letting the compiler
generate div instructions directly.

-- 
Måns Rullgård
mans@mansr.com
