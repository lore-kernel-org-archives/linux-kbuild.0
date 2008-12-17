Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from earthlight.etchedpixels.co.uk ([81.2.110.250]:36359 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753616AbYLQKH0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Dec 2008 05:07:26 -0500
Date: Wed, 17 Dec 2008 10:07:27 +0000
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: GIT head doesn't seem to want to build on 32bit..
Message-ID: <20081217100727.5cf6248c@lxorguk.ukuu.org.uk>
In-Reply-To: <20081216183817.GA25108@uranus.ravnborg.org>
References: <20081216172859.5bc030b6@lxorguk.ukuu.org.uk>
	<alpine.LFD.2.00.0812160946410.14014@localhost.localdomain>
	<20081216181133.2342b49e@lxorguk.ukuu.org.uk>
	<20081216183817.GA25108@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org


> Smells like a kbuild issue.
> Please copy me and linux-kbuild@vger.kernel.org on any findings.
> 
> [My 64 bit toolchain is br0ken atm so I could not try to reproduce]

Yes I do indeed need to build x86_64 first, then make distclean or
mrproper and then 32bit build fails


Alan
