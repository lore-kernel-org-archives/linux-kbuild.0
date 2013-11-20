Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:52926 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752228Ab3KTASJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Nov 2013 19:18:09 -0500
Message-ID: <528BFFBF.4050807@codeaurora.org>
Date: Tue, 19 Nov 2013 16:18:07 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: Have make TAGS not include structure members
References: <20131115093645.6dc03918@gandalf.local.home>	<CAMuHMdXSBSOkfd2MGbn=rpXQRZYw5TKLsR=3SoeSyrcD2CzunA@mail.gmail.com>	<20131119155907.11fbdecea0aa40764a3d927a@linux-foundation.org>	<20131119190426.27b010e4@gandalf.local.home>	<20131119160855.2527630f87d060801d9ee3bb@linux-foundation.org> <20131119191435.4dce1499@gandalf.local.home>
In-Reply-To: <20131119191435.4dce1499@gandalf.local.home>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>, Yang Bai <hamo.by@gmail.com>

On 11/19/13 16:14, Steven Rostedt wrote:
> On Tue, 19 Nov 2013 16:08:55 -0800
> Andrew Morton <akpm@linux-foundation.org> wrote:
>
>
>>> Do I hear any complaints about removing it just
>>> for emacs users?
>> Probably not, as only 0.0001% of them are reading this thread :(
> Then I'm guessing that the answer is to just do it for emacs users.
> That way, if anyone uses this feature, they will complain then :-)
>
> The worse we can do is to just revert it, as this isn't something like
> a user ABI or anything.

I didn't have exuberant-ctags installed so 'make tags' was building the
emacs tag file as 'tags' and vim was using it just fine. Please note
that you may be affecting vim users with this change if they haven't
installed exuberant-ctags.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation

