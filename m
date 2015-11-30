Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44683 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752297AbbK3Pk2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Nov 2015 10:40:28 -0500
Subject: Re: [PATCH v2 1/2] scripts: Add a recorduidiv program
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
 <1448488264-23400-2-git-send-email-sboyd@codeaurora.org>
 <20151125234711.GT8644@n2100.arm.linux.org.uk> <565C6714.802@suse.com>
 <20151130153208.GR8644@n2100.arm.linux.org.uk>
From: Michal Marek <mmarek@suse.com>
Message-ID: <565C6DE9.2020302@suse.com>
Date: Mon, 30 Nov 2015 16:40:25 +0100
MIME-Version: 1.0
In-Reply-To: <20151130153208.GR8644@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kbuild@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>

On 2015-11-30 16:32, Russell King - ARM Linux wrote:
> On Mon, Nov 30, 2015 at 04:11:16PM +0100, Michal Marek wrote:
>> On 2015-11-26 00:47, Russell King - ARM Linux wrote:
>>> On Wed, Nov 25, 2015 at 01:51:03PM -0800, Stephen Boyd wrote:
>>>> The ARM compiler inserts calls to __aeabi_uidiv() and
>>>> __aeabi_idiv() when it needs to perform division on signed and
>>>> unsigned integers. If a processor has support for the udiv and
>>>> sdiv division instructions the calls to these support routines
>>>> can be replaced with those instructions. Therefore, record the
>>>> location of calls to these library functions into two sections
>>>> (one for udiv and one for sdiv) similar to how we trace calls to
>>>> mcount. When the kernel boots up it will check to see if the
>>>> processor supports the instructions and then patch the call sites
>>>> with the instruction.
>>>
>>> Do we have any resolution on these programs which modify the object
>>> files in-place, rather than breaking any hard-links which may be
>>> present (eg, as a result of using ccache in hard-link mode) ?
>>
>> Good point, but I do not think anybody is using CCACHE_HARDLINK with the
>> kernel.
> 
> That's wrong then, because I've been using it for a very long time with
> my nightly builds. :)  Therefore, there is somebody!

OK.


>> As the manpage says, it is going to confuse make, so the time
>> saved by ccache would be offset by make trying to recompile all *.c
>> files each time.
> 
> From what I've noticed, it makes a big difference when running nightly
> builds.  My nightly builds use O= and always build into an empty target
> tree, so there are no old objects back-dated to confuse make.
> 
> Even if there were, make would spot that the object is older than the
> source, and try to re-make the target again, at which point ccache
> would re-hardlink the object after looking up the hashed preprocessed
> source.

That's what I meant. If you do a second make in a freshly built tree, it
will recompile all the files again. It will all be cache hits, but each
of the will be lot slower than comparing two timestamps. But in
throwaway build trees you do not care, I haven't considered that...

Michal
