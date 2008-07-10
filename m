Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:51109 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753222AbYGJTnm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Jul 2008 15:43:42 -0400
Date: Thu, 10 Jul 2008 21:44:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Integrating relocatable kernel build with kernel build
Message-ID: <20080710194429.GA17255@uranus.ravnborg.org>
References: <4875040A.7020306@in.ibm.com> <20080709202740.GA2655@uranus.ravnborg.org> <4876184E.7040705@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4876184E.7040705@in.ibm.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mohan Kumar M <mohan@in.ibm.com>
Cc: linux-kbuild@vger.kernel.org

> >
> >>Another feature I am looking is to generate the "relocatable vmlinux" 
> >>image in the top directory of kernel source and the intermediate vmlinux 
> >>file either in arch/powerpc/kernel or arch/powerpc/boot.
> >We no longer build arch specific targets in the top-level directory
> >of the kernel src. We print out where to locate the build file.
> >
> 
> Still need to build the final "relocatable vmlinux" image in the top
> level directory of kernel source (either as vmlinux or vmlinux.reloc).

As I said above this is NOT how we do it today. So you need to fix the
tools that assume this.

	Sam
