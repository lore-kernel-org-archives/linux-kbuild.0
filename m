Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:48376 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752167AbYLQXs6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Dec 2008 18:48:58 -0500
Date: Wed, 17 Dec 2008 15:48:32 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: GIT head doesn't seem to want to build on 32bit..
Message-Id: <20081217154832.f29539af.randy.dunlap@oracle.com>
In-Reply-To: <20081217113029.GB5027@uranus.ravnborg.org>
References: <20081216172859.5bc030b6@lxorguk.ukuu.org.uk>
	<alpine.LFD.2.00.0812160946410.14014@localhost.localdomain>
	<20081216181133.2342b49e@lxorguk.ukuu.org.uk>
	<20081216183817.GA25108@uranus.ravnborg.org>
	<20081217100727.5cf6248c@lxorguk.ukuu.org.uk>
	<20081217113029.GB5027@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, 17 Dec 2008 12:30:29 +0100 Sam Ravnborg wrote:

> On Wed, Dec 17, 2008 at 10:07:27AM +0000, Alan Cox wrote:
> > 
> > > Smells like a kbuild issue.
> > > Please copy me and linux-kbuild@vger.kernel.org on any findings.
> > > 
> > > [My 64 bit toolchain is br0ken atm so I could not try to reproduce]
> > 
> > Yes I do indeed need to build x86_64 first, then make distclean or
> > mrproper and then 32bit build fails
> 
> I will fix my 64 bit build soonish.
> In the meantime could someone do:
> 
> 1) git clean -dxf
> 2) Make a 64 bit x86 build.

without using O=dir, correct?

> 3) make distclean
> 4) git ls-files -o
> 
> And post the output of 4)
> Something is left that causes us to fail and I wonder what it is.
> 
> [I'm afraid it is not this simple but I hope this can tell us what it is]

Afraid not; git ls-files -o only listed the build output file for me.  Sorry.

---
~Randy
