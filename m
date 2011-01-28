Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:36189 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755062Ab1A1IpJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Jan 2011 03:45:09 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glkd-linux-kbuild@m.gmane.org>)
	id 1Pijx2-0004ND-Ev
	for linux-kbuild@vger.kernel.org; Fri, 28 Jan 2011 09:45:04 +0100
Received: from 60.247.97.98 ([60.247.97.98])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2011 09:45:04 +0100
Received: from xiyou.wangcong by 60.247.97.98 with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2011 09:45:04 +0100
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: Re: [Patch] make installkernel configurable from command line (was
 Re: how to avoid that install.sh goes mad, if I am not root?)
Date: Fri, 28 Jan 2011 07:58:07 +0000 (UTC)
Message-ID: <ihtsue$921$2@dough.gmane.org>
References: <4D388A08.1010004@afaics.de>
	<19768.44428.482148.361069@pilspetsen.it.uu.se>
	<ihbvd1$jbj$3@dough.gmane.org> <4D3A03CA.2060507@afaics.de>
	<20110124102159.GD5510@cr0.nay.redhat.com>
	<19773.26066.137666.718852@pilspetsen.it.uu.se>
	<20110125054800.GC13618@cr0.nay.redhat.com>
	<19775.61731.753606.576942@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On Wed, 26 Jan 2011 11:02:11 +0100, Mikael Pettersson wrote:
> 
> Tested.  This works as far as not overriding root's ~/bin/installkernel
> if it exists, but it fails to give precedence to an explicit
> command-line INSTALLKERNEL=... over the built-in fallbacks.  I don't see
> an easy way to fix that without first consolidating all archs'
> INSTALLKERNEL handling into the top-level Makefile.


Yes, exactly, I can expect this.

> 
> Not using make install and just invoking your own install script
> directly works, so I'm not sure this is worth the trouble (unless you
> can unify all archs' INSTALLKERNEL handling as a side-effect / cleanup).

Agreed, I will have a try.

Thanks!

