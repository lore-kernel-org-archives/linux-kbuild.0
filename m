Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49309 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754883AbbLAQHK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Dec 2015 11:07:10 -0500
Subject: Re: [PATCH v2 1/2] scripts: Add a recorduidiv program
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
 <1448488264-23400-2-git-send-email-sboyd@codeaurora.org>
 <20151125234711.GT8644@n2100.arm.linux.org.uk> <565C6714.802@suse.com>
 <20151130153208.GR8644@n2100.arm.linux.org.uk> <565C6DE9.2020302@suse.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <565DC5A9.2010305@suse.cz>
Date: Tue, 1 Dec 2015 17:07:05 +0100
MIME-Version: 1.0
In-Reply-To: <565C6DE9.2020302@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kbuild@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>

On 2015-11-30 16:40, Michal Marek wrote:
> On 2015-11-30 16:32, Russell King - ARM Linux wrote:
>> On Mon, Nov 30, 2015 at 04:11:16PM +0100, Michal Marek wrote:
>>> On 2015-11-26 00:47, Russell King - ARM Linux wrote:
>>>> Do we have any resolution on these programs which modify the object
>>>> files in-place, rather than breaking any hard-links which may be
>>>> present (eg, as a result of using ccache in hard-link mode) ?
>>>
>>> Good point, but I do not think anybody is using CCACHE_HARDLINK with the
>>> kernel.
>>
>> That's wrong then, because I've been using it for a very long time with
>> my nightly builds. :)  Therefore, there is somebody!
> 
> OK.

So, both recordmcount and the new recordudiv program are idempotent.
They check if the to-be-added section is already present and do nothing.
So the result is correct even with CCACHE_HARDLINK, just the
intermediate file might be incorrect. If this still is considered an
issue, I suggest clearing CCACHE_HARDLINK when using any of these
postprocessors, so as not to penalize other use cases.

The perl recordmcount does not modify the file in place.

Michal
