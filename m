Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34133 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752652AbbKBUmp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Nov 2015 15:42:45 -0500
Subject: Re: linux-next: Tree for Nov 1 (xconfig problem)
References: <20151102035340.17310681@canb.auug.org.au>
 <1734407.lgNIi16vzN@tjmaciei-mobl4> <5637AFE0.6060001@infradead.org>
 <1738577.5l9eGhcZuP@tjmaciei-mobl4>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <5637CAC1.6030509@suse.cz>
Date: Mon, 2 Nov 2015 21:42:41 +0100
MIME-Version: 1.0
In-Reply-To: <1738577.5l9eGhcZuP@tjmaciei-mobl4>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thiago Macieira <thiago.macieira@intel.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Boris Barbulovski <bbarbulovski@gmail.com>

Dne 2.11.2015 v 20:23 Thiago Macieira napsal(a):
> On Monday 02 November 2015 10:48:00 Randy Dunlap wrote:
>> Hi,
>> What does this patch apply to?
>> I can't apply it cleanly to to 4.3 or linux-next of yesterday or today.
> 
> Hmm... interesting, it doesn't apply on linux-next. The reason for that is 
> that the code on linux-next is different from the one on the tip of the branch 
> that I sent to Michal. The difference explains the crash too and why I thought 
> it was impossible.
> 
> Michal, looks like you missed applying patch #28 "Add current selection 
> check." from the original series. It's one of three commits that don't start 
> with "Port xconfig to Qt5", so I guess it was  missed. It's the only commit 
> missing (you applied 38 and the series had 39).
> 
> http://www.spinics.net/lists/linux-kbuild/msg11665.html

Damn, I guess I forgot to select this patch in mutt and the rest applied
without conflicts :-/. Thanks for spotting it, I will add the missing patch.

Michal

