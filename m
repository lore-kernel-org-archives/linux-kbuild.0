Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:36134 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751237AbYFDVta (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Jun 2008 17:49:30 -0400
Date: Wed, 4 Jun 2008 23:50:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Simplify vmlinux link
Message-ID: <20080604215012.GD13032@uranus.ravnborg.org>
References: <20080604214514.GA13032@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080604214514.GA13032@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Wed, Jun 04, 2008 at 11:45:14PM +0200, Sam Ravnborg wrote:
> Following two patches simplifies the foo used to link
> vmlinux to a level where it is maintainable again.
> 
> The patches remove the KALLSYMS_EXTRA_PASS stuff and
> move the vmlinux link stuff to a small shell script.
> 
> This need some testing as I have not even been able
> to boot test this as my dev box is down.
> So help and feedback is really appreciated.
> 
> Full patch below - I will post sepearate patches as follow-up.
> 
> Patches will be pushed out to kbuild-next only when I get
> some positive reponse that it boots.

This breaks um build btw.
The 2/2 patch contains an attempt to fix it but I could not
manage to tech ld how to find -lunit - despite that it worked with gcc.

	Sam
