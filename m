Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60767 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751745AbcF0UKT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jun 2016 16:10:19 -0400
Subject: Re: Regression in "kbuild: fix if_change and friends to consider
 argument order"
References: <1465263518.3885.9.camel@intel.com> <5756960E.5020706@suse.com>
 <57569ACC.8050503@suse.cz>
 <CAK7LNARPUqD9BY5p-=M49KkQM7+j0bVFBX2On_rqdJjRs=zeTQ@mail.gmail.com>
 <5756A675.3080003@suse.cz>
 <CAK7LNAS4228scb3Ep1MT_FZhHS_+ckJCJZSDT-TN9hcvJ7Wq0A@mail.gmail.com>
 <1465308627.3885.61.camel@intel.com> <20160607215237.GA13237@sepie.suse.cz>
 <1465428562.3885.75.camel@intel.com>
 <2d0fa5b3-eb47-60af-9c92-49c31ae0fe86@leemhuis.info>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57718823.9030009@suse.com>
Date: Mon, 27 Jun 2016 22:10:11 +0200
MIME-Version: 1.0
In-Reply-To: <2d0fa5b3-eb47-60af-9c92-49c31ae0fe86@leemhuis.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>, "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>

Dne 26.6.2016 v 12:43 Thorsten Leemhuis napsal(a):
> On 09.06.2016 01:29, Zanoni, Paulo R wrote:
>> Em Ter, 2016-06-07 às 23:52 +0200, Michal Marek escreveu:
>>> On Tue, Jun 07, 2016 at 02:10:28PM +0000, Zanoni, Paulo R wrote:
>>> From b36fad65d61fffe4b662d4bfb1ed673c455a36a2 Mon Sep 17 00:00:00
>>> 2001
>>> From: Michal Marek <mmarek@suse.com>
>>> Date: Tue, 7 Jun 2016 11:57:02 +0200
>>> Subject: [PATCH] kbuild: Initialize exported variables
>>>
>>> The NOSTDINC_FLAGS variable is exported, so it needs to be cleared to
>>> avoid duplicating its content when running make from within make
>>> (e.g.
>>> in the packaging targets). This became an issue after commit
>>> 9c8fa9bc08f6 ("kbuild: fix if_change and friends to consider argument
>>> order"), which no longer ignores the duplicate options. As Paulo
>>> Zanoni
>>> points out, the LDFLAGS_vmlinux variable has the same problem.
>>>
>>> Reported-by: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
>>> Fixes: 9c8fa9bc08f6 ("kbuild: fix if_change and friends to consider
>>> argument order")
>>> Signed-off-by: Michal Marek <mmarek@suse.com>
>> Works for me.
>> Tested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> 
> Michal, what's the status here? This made it on my 4.7 regressions
> report due to the "regression" keyword in the subject.

I forgot to send it to Linus, fixed now. Thanks for the reminder.

Michal

