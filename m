Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:37847 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965537AbcCPJFU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Mar 2016 05:05:20 -0400
Date: Wed, 16 Mar 2016 09:04:49 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: dtbs_install recursing on subdirs-y and dtbs-subdir leading to
 race?
Message-ID: <20160316090449.GW19428@n2100.arm.linux.org.uk>
References: <1458118474.28250.54.camel@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1458118474.28250.54.camel@debian.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ian Campbell <ijc@debian.org>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Robert Richter <rrichter@cavium.com>, Ben Hutchings <ben@decadent.org.uk>, linux-arm-kernel@lists.infradead.org, debian-kernel <debian-kernel@lists.debian.org>

On Wed, Mar 16, 2016 at 08:54:34AM +0000, Ian Campbell wrote:
> Where it appears that multiple instance of __dtbs_install_prep have
> been running in parallel at least the apm and arm subdirectories of
> arch/arm64/boot/dts, with both of them then racing in the 
>     $(Q)if [ -d $(INSTALL_DTBS_PATH) ]; then mv $(INSTALL_DTBS_PATH) $(INSTALL_DTBS_PATH).old; fi
> rule since apparently $(INSTALL_DTBS_PATH) existed during the "-d"
> check but had gone by the time of the move.

I've already sent a patch several times to remove this line, I believe
it's finally queued for this merge window.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
