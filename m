Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:57317 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755858AbYE0Snq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 27 May 2008 14:43:46 -0400
Date: Tue, 27 May 2008 20:44:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: 'make arch/x86/' fails
Message-ID: <20080527184426.GA6235@uranus.ravnborg.org>
References: <19f34abd0805271114o70f62d6gdf2f37109364a86@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19f34abd0805271114o70f62d6gdf2f37109364a86@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Tue, May 27, 2008 at 08:14:31PM +0200, Vegard Nossum wrote:
> Hi,
> 
> I don't know if this is a regression or what (I've observed it for a
> while), but now I thought I'd let you know about it:
> 
> $ make arch/x86/
>   CHK     include/linux/version.h
>   CHK     include/linux/utsrelease.h
>   CC      kernel/bounds.s
>   GEN     include/linux/bounds.h
>   CC      arch/x86/kernel/asm-offsets.s
>   GEN     include/asm-x86/asm-offsets.h
>   CALL    scripts/checksyscalls.sh
> [...]/linux-2.6/arch/x86/Makefile:37: *** Recursive variable
> `KBUILD_CFLAGS' references itself (eventually).  Stop.
> make: *** [arch/x86/] Error 2

This is unfortunately what you should expect
because the directory arch/x86/ is special as it does
not contain a regular Kbuild file but instead contains
a badly named arch configuration file (Makefile).

> 
> Are there any work-arounds or easy fixes for this? Thanks.
For each directory in arch/x86/* do make arch/x86/{directory}

	Sam
