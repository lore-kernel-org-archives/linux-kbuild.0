Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from benson.default.arb33.uk0.bigv.io ([46.43.0.16]:44371 "EHLO
	benson.default.arb33.uk0.bigv.io" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965067AbcCPJNH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 05:13:07 -0400
Message-ID: <1458119588.28250.61.camel@debian.org>
Subject: Re: dtbs_install recursing on subdirs-y and dtbs-subdir leading to
 race?
From: Ian Campbell <ijc@debian.org>
Date: Wed, 16 Mar 2016 09:13:08 +0000
In-Reply-To: <20160316090449.GW19428@n2100.arm.linux.org.uk>
References: <1458118474.28250.54.camel@debian.org>
	 <20160316090449.GW19428@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Robert Richter <rrichter@cavium.com>, Ben Hutchings <ben@decadent.org.uk>, linux-arm-kernel@lists.infradead.org, debian-kernel <debian-kernel@lists.debian.org>

On Wed, 2016-03-16 at 09:04 +0000, Russell King - ARM Linux wrote:
> On Wed, Mar 16, 2016 at 08:54:34AM +0000, Ian Campbell wrote:
> > Where it appears that multiple instance of __dtbs_install_prep have
> > been running in parallel at least the apm and arm subdirectories of
> > arch/arm64/boot/dts, with both of them then racing in the 
> >     $(Q)if [ -d $(INSTALL_DTBS_PATH) ]; then mv
> $(INSTALL_DTBS_PATH) $(INSTALL_DTBS_PATH).old; fi
> > rule since apparently $(INSTALL_DTBS_PATH) existed during the "-d"
> > check but had gone by the time of the move.
> 
> I've already sent a patch several times to remove this line, I believe
> it's finally queued for this merge window.

Yes, as I said further down in my mail:

    I understand that the mv bit of the rule in question is likely to be
    removed quite soon[1] but I think the underlying race / extra recursion
    still exits and might have other implications.

(where [1] was a link to your patch).

I still think it is unexpected (or at least unintended) that this rune
is run in all subdirectories.

Ian.
