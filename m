Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:40394 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753734Ab3JBVPH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Oct 2013 17:15:07 -0400
Date: Wed, 2 Oct 2013 22:14:50 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
Message-ID: <20131002211449.GB12758@n2100.arm.linux.org.uk>
References: <20120927082955.GR17667@game.jcrosoft.org> <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com> <52416F97.802@keymile.com> <20130924120152.GI11119@titan.lakedaemon.net> <20130924121939.GD12758@n2100.arm.linux.org.uk> <1380572483.31472.51.camel@sakura.staff.proxad.net> <20130930204223.GJ31178@titan.lakedaemon.net> <1380575265.23932.11.camel@sakura.staff.proxad.net> <alpine.LFD.2.03.1309302241400.6331@syhkavp.arg> <20131001104115.GA1384@sakura.staff.proxad.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131001104115.GA1384@sakura.staff.proxad.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Maxime Bizon <mbizon@freebox.fr>
Cc: Nicolas Pitre <nico@fluxnic.net>, Jason Cooper <jason@lakedaemon.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gerlando Falauto <gerlando.falauto@keymile.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, linux-arm-kernel@lists.infradead.org

On Tue, Oct 01, 2013 at 12:41:15PM +0200, Maxime Bizon wrote:
> But for devices in the field for which upgrading the booloader is not
> an option, neither is changing anything else in the boot process
> (anything before linux starts). The risk of bricking the device is
> just too high.

Well, how does the kernel get on to these devices in the field?  Is
it burned into the flash using some laser type device, or does it
involve running some kind of a script?

If it's running a script, then that script can be modified.  The script
can take the generic zImage, and it can identify what the target hardware
is, and it can pick the appropriate DT image to append to the kernel
and then create whatever format your target uboot wants (whether that
be the new format or the uImage format.)

I'm not sure why people think this is soo difficult.  I've had my build/
boot system doing that since OMAP4 went DT only.  I'm now using it on the
Cubox-i Carrier-1 board.  I'm doing it manually there - concatenating the
kernel and DTB and then using mkimage.

If you really must have all the DT blobs as part of the kernel and select
one at boot time, that's precisely where having the kind of solution
Nicolas is suggesting comes in.

We can't keep augmenting the kernel build system with every different
magic way to generate the final platform image - it's got to the point
where there are just _far_ too many different options and to keep
adding more and more is getting really stupid.

Remember too that the plan is to drop the DT files from the kernel
tarball and maintain them in a separate _external_ tree to the kernel.
This means that any "solution" we merge today which allows you to build
a "final platform image" out of a DT file plus the zImage will only
need to be removed again when that happens.  It's far better not to
encourage these lazy methods which will only end up causing us kernel
developers more pain in the future.
