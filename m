Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from basicbox7.server-home.net ([195.137.212.29]:60539 "EHLO
	basicbox7.server-home.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752233AbcFZKxG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 26 Jun 2016 06:53:06 -0400
Subject: Re: Regression in "kbuild: fix if_change and friends to consider
 argument order"
References: <1465263518.3885.9.camel@intel.com> <5756960E.5020706@suse.com>
 <57569ACC.8050503@suse.cz>
 <CAK7LNARPUqD9BY5p-=M49KkQM7+j0bVFBX2On_rqdJjRs=zeTQ@mail.gmail.com>
 <5756A675.3080003@suse.cz>
 <CAK7LNAS4228scb3Ep1MT_FZhHS_+ckJCJZSDT-TN9hcvJ7Wq0A@mail.gmail.com>
 <1465308627.3885.61.camel@intel.com> <20160607215237.GA13237@sepie.suse.cz>
 <1465428562.3885.75.camel@intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Message-ID: <2d0fa5b3-eb47-60af-9c92-49c31ae0fe86@leemhuis.info>
Date: Sun, 26 Jun 2016 12:43:23 +0200
MIME-Version: 1.0
In-Reply-To: <1465428562.3885.75.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, "mmarek@suse.com" <mmarek@suse.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>

On 09.06.2016 01:29, Zanoni, Paulo R wrote:
> Em Ter, 2016-06-07 às 23:52 +0200, Michal Marek escreveu:
>> On Tue, Jun 07, 2016 at 02:10:28PM +0000, Zanoni, Paulo R wrote:
>> From b36fad65d61fffe4b662d4bfb1ed673c455a36a2 Mon Sep 17 00:00:00
>> 2001
>> From: Michal Marek <mmarek@suse.com>
>> Date: Tue, 7 Jun 2016 11:57:02 +0200
>> Subject: [PATCH] kbuild: Initialize exported variables
>>
>> The NOSTDINC_FLAGS variable is exported, so it needs to be cleared to
>> avoid duplicating its content when running make from within make
>> (e.g.
>> in the packaging targets). This became an issue after commit
>> 9c8fa9bc08f6 ("kbuild: fix if_change and friends to consider argument
>> order"), which no longer ignores the duplicate options. As Paulo
>> Zanoni
>> points out, the LDFLAGS_vmlinux variable has the same problem.
>>
>> Reported-by: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
>> Fixes: 9c8fa9bc08f6 ("kbuild: fix if_change and friends to consider
>> argument order")
>> Signed-off-by: Michal Marek <mmarek@suse.com>
> Works for me.
> Tested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>

Michal, what's the status here? This made it on my 4.7 regressions
report due to the "regression" keyword in the subject. Is this an older
regression or something that will get fixed post 4.7? It's not fixed in
mainline afaics, but maybe I missed something.

Sincerely, your regression tracker for Linux 4.7 (http://bit.ly/28JRmJo)
 Thorsten
