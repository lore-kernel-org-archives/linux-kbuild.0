Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:54809 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751237AbbKBTXy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Nov 2015 14:23:54 -0500
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: Re: linux-next: Tree for Nov 1 (xconfig problem)
Date: Mon, 02 Nov 2015 14:23:50 -0500
Message-ID: <1738577.5l9eGhcZuP@tjmaciei-mobl4>
In-Reply-To: <5637AFE0.6060001@infradead.org>
References: <20151102035340.17310681@canb.auug.org.au> <1734407.lgNIi16vzN@tjmaciei-mobl4> <5637AFE0.6060001@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Boris Barbulovski <bbarbulovski@gmail.com>

On Monday 02 November 2015 10:48:00 Randy Dunlap wrote:
> Hi,
> What does this patch apply to?
> I can't apply it cleanly to to 4.3 or linux-next of yesterday or today.

Hmm... interesting, it doesn't apply on linux-next. The reason for that is 
that the code on linux-next is different from the one on the tip of the branch 
that I sent to Michal. The difference explains the crash too and why I thought 
it was impossible.

Michal, looks like you missed applying patch #28 "Add current selection 
check." from the original series. It's one of three commits that don't start 
with "Port xconfig to Qt5", so I guess it was  missed. It's the only commit 
missing (you applied 38 and the series had 39).

http://www.spinics.net/lists/linux-kbuild/msg11665.html
-- 
Thiago Macieira - thiago.macieira (AT) intel.com
  Software Architect - Intel Open Source Technology Center

