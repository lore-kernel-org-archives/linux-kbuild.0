Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp-out0.tiscali.nl ([195.241.79.175]:38201 "EHLO
	smtp-out0.tiscali.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751757Ab1JKMwc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 11 Oct 2011 08:52:32 -0400
Message-ID: <1318337539.1643.6.camel@t41.thuisdomein>
Subject: Re: Kconfig: single-config-entry choice groups
From: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 11 Oct 2011 14:52:19 +0200
In-Reply-To: <4E9436CB.9050604@suse.cz>
References: <1318276961.18122.30.camel@x61.thuisdomein>
	 <4E9436CB.9050604@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Tue, 2011-10-11 at 14:30 +0200, Michal Marek wrote:
> My guess is that this is simply bitrot. Can you share the list of these
> single-entry choice groups?

Sure. Note that I composed this list by simply manually inspecting every
choice group in the tree (thinking about a smarter way to do this would
have taken me much longer than that). I marked all these groups with
'XXX' in some temporary branch in my local repository. This makes these
Kconfig files invalid, of course. Grepping for 'choice XXX' now gives
me:

arch/arm/mach-imx/Kconfig:161:choice XXX
arch/arm/mach-imx/Kconfig:211:choice XXX
arch/arm/mach-imx/Kconfig:256:choice XXX
arch/arm/mach-imx/Kconfig:575:choice XXX
arch/arm/mach-mx5/Kconfig:102:choice XXX
arch/arm/mach-mx5/Kconfig:130:choice XXX
arch/arm/mach-tegra/Kconfig:5:choice XXX
arch/arm/plat-omap/Kconfig:210:choice XXX
arch/arm/plat-tcc/Kconfig:5:choice XXX
arch/avr32/Kconfig:168:choice XXX
arch/blackfin/mach-bf538/boards/Kconfig:1:choice XXX
arch/cris/arch-v32/Kconfig:102:choice XXX
arch/microblaze/platform/Kconfig.platform:8:choice XXX
arch/mips/bcm63xx/boards/Kconfig:1:choice XXX
arch/mips/jz4740/Kconfig:1:choice XXX
arch/openrisc/Kconfig:72:choice XXX
arch/sh/boards/mach-sdk7780/Kconfig:3:choice XXX
arch/sh/cchips/Kconfig:6:choice XXX
drivers/mtd/maps/Kconfig:90:choice XXX

I'm not sure whether this list is (correct and) complete. 


Paul Bolle

