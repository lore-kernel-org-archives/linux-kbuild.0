Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from barikada.upol.cz ([158.194.242.200]:40772 "EHLO
	barikada.upol.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759094AbYEBKf0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 May 2008 06:35:26 -0400
Received: from flower (flower.upol.cz [158.194.64.22])
	by barikada.upol.cz (Spam Firewall) with ESMTP id 205A412415E
	for <linux-kbuild@vger.kernel.org>; Fri,  2 May 2008 12:35:12 +0200 (CEST)
Received: from flower (flower.upol.cz [158.194.64.22]) by barikada.upol.cz with ESMTP id JDMRvNene69xNJot for <linux-kbuild@vger.kernel.org>; Fri, 02 May 2008 12:35:12 +0200 (CEST)
Received: from olecom by flower with local (Exim 4.63)
	(envelope-from <olecom@flower.upol.cz>)
	id 1Jrsw8-0000xl-IR
	for linux-kbuild@vger.kernel.org; Fri, 02 May 2008 12:56:20 +0200
Date: Fri, 2 May 2008 12:56:20 +0200
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not digestible by gas
Message-ID: <20080502105620.GW24008@flower.upol.cz>
References: <20080501163453.GF29330@cs181133002.pp.htv.fi> <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net> <20080501165333.GG29330@cs181133002.pp.htv.fi> <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net> <20080501191714.GM29330@cs181133002.pp.htv.fi> <20080501213952.GA8281@uranus.ravnborg.org> <20080501220747.GV29330@cs181133002.pp.htv.fi> <52649.81.193.128.196.1209689622.squirrel@galactus.symlabs.net> <8499950a0805011848h713606e3mda5dd2aed31dfa91@mail.gmail.com> <20080502060813.GB19090@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080502060813.GB19090@uranus.ravnborg.org>
From: Oleg Verych <olecom@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Sam Ravnborg (kbuild list)" <linux-kbuild@vger.kernel.org>

Sam Ravnborg @ Fri, May 02, 2008 at 08:08:13AM +0200:
> On Fri, May 02, 2008 at 02:48:58AM +0100, Oleg Verych wrote:
> > Sam, please, tell to those guys, that shell must be `bash`, as Roman wanted.
> 
> No - we want to be portable across as many setups as possible.
> So forcing us to use bash is in the long run not a good solutions.
> 
> We should go for the least common denominator - busy-box could be the one.

,-- Message-ID: <Pine.LNX.4.64.0702082335150.14457@scrub.home> --
|It would make casual kbuild hacking only even more difficult, as one has
|to check it works with the various shells.
`--

So, time goes on, and random busybox user can solve all kbuild problems
with scripting. Alright.

For the record, i still doing my own way:

klibc + `[d]ash` + `minised` (|| GNU `sed` if something will be too stupid).
____
