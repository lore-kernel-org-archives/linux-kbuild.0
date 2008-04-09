Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns.firmix.at ([62.141.48.66]:1415 "EHLO ns.firmix.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752582AbYDIQDo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Apr 2008 12:03:44 -0400
Received: from ns.firmix.at (localhost [127.0.0.1])
	by ns.firmix.at (8.14.1/8.14.1) with ESMTP id m39FECJD025228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-kbuild@vger.kernel.org>; Wed, 9 Apr 2008 17:14:12 +0200
Received: (from defang@localhost)
	by ns.firmix.at (8.14.1/8.14.1/Submit) id m39FEBsJ025224
	for <linux-kbuild@vger.kernel.org>; Wed, 9 Apr 2008 17:14:11 +0200
Subject: Re: coloring stdout && stderr, small kbuild example
From: Bernd Petrovitsch <bernd@firmix.at>
In-Reply-To: <E1Jjbol-0002zS-4P@flower>
References: <E1Jjbol-0002zS-4P@flower>
Content-Type: text/plain
Date: Wed, 09 Apr 2008 17:14:00 +0200
Message-Id: <1207754040.6860.7.camel@tara.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Oleg Verych <olecom@flower.upol.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kbuild devel list <linux-kbuild@vger.kernel.org>

On Mit, 2008-04-09 at 17:02 +0200, Oleg Verych wrote:
> Those boring never-ending builds...
> 
> Can some dualCPU power be spent, if building is interactive (i.e. sent to
> terminal), to have them a bit colored?
> 
> My last rant about "colored printk()" led away from kernel developers
> and their solutions. But now, let me share something.

I don't know if it's of any use for you but there is already
*) color-make - http://bre.klaki.net/programs/colormake/ - and
*) color-gcc - http://schlueters.de/colorgcc.html -
out there.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


