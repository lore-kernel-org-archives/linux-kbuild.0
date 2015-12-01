Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52173 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751704AbbLAQnv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 1 Dec 2015 11:43:51 -0500
Subject: Re: [PATCH v2 1/2] scripts: Add a recorduidiv program
References: <1448488264-23400-1-git-send-email-sboyd@codeaurora.org>
 <1448488264-23400-2-git-send-email-sboyd@codeaurora.org>
 <20151125234711.GT8644@n2100.arm.linux.org.uk> <565C6714.802@suse.com>
 <20151130153208.GR8644@n2100.arm.linux.org.uk> <565C6DE9.2020302@suse.com>
 <565DC5A9.2010305@suse.cz> <20151201161944.GX8644@n2100.arm.linux.org.uk>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <565DCE43.7010904@suse.cz>
Date: Tue, 1 Dec 2015 17:43:47 +0100
MIME-Version: 1.0
In-Reply-To: <20151201161944.GX8644@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-kbuild@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>

On 2015-12-01 17:19, Russell King - ARM Linux wrote:
> On Tue, Dec 01, 2015 at 05:07:05PM +0100, Michal Marek wrote:
>> So, both recordmcount and the new recordudiv program are idempotent.
>> They check if the to-be-added section is already present and do nothing.
> 
> They hardly "do nothing", as the (eg) recordmcount plasters the build
> log with warnings.  A solution to that would be to make recordmcount
> silent if the section is already present.

Right, there is a warning. The recorduidiv program exits silently.


>> So the result is correct even with CCACHE_HARDLINK, just the
>> intermediate file might be incorrect. If this still is considered an
>> issue, I suggest clearing CCACHE_HARDLINK when using any of these
>> postprocessors, so as not to penalize other use cases.
> 
> Another solution would be to have the top level make file unset the
> CCACHE_HARDLINK environment variable if any of the options which enable
> in-place editing of object files is enabled.

This is what I meant, sorry for not being clear.


> Looking at the ccache
> code, the environment variable has to be deleted from the environment
> to turn off the option - and I'm not sure whether make can delete
> environment variables.  It certainly can override them, but I see
> nothing in the info pages which suggests that environment variables
> can be deleted by a makefile.

unexport CCACHE_HARDLINK

will do the trick.

Michal
