Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:6789 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750856AbbKBNvn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Nov 2015 08:51:43 -0500
From: Thiago Macieira <thiago.macieira@intel.com>
Subject: Re: linux-next: Tree for Nov 1 (xconfig problem)
Date: Mon, 02 Nov 2015 08:51:40 -0500
Message-ID: <2030804.WKiRYyHexJ@tjmaciei-mobl4>
In-Reply-To: <56376784.3030804@suse.cz>
References: <20151102035340.17310681@canb.auug.org.au> <5636D465.4060104@infradead.org> <56376784.3030804@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Boris Barbulovski <bbarbulovski@gmail.com>

On Monday 02 November 2015 14:39:16 Michal Marek wrote:
> On 2015-11-02 04:11, Randy Dunlap wrote:
> > On 11/01/15 08:53, Stephen Rothwell wrote:
> >> Hi all,
> >> 
> >> I start again a day early, and this is how you all repay me? ;-)
> > 
> >> Changes since 20151022:
> > on x86_64:
> > 
> > 'make xconfig' dies a quick death when I try to use it:
> > 
> > linux-next-20151101> ASSERT: "!isEmpty()" in file
> > /usr/include/QtCore/qlist.h, line 282
> Added Boris and Thiago to Cc.
> 
> Are you using Qt4 or Qt5? An

Given the line number, it's a Qt 4.

Randy, we need a backtrace. The problem is on the function that called 
first(). Can you make sure the crash generates a core dump, then get the bt 
from that?

-- 
Thiago Macieira - thiago.macieira (AT) intel.com
  Software Architect - Intel Open Source Technology Center

