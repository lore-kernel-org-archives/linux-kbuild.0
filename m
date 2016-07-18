Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:55278 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750837AbcGRMxG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 08:53:06 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: running "make dtbs" for test builds
Date: Mon, 18 Jul 2016 14:52:32 +0200
Message-ID: <1725840.UfqkDuJ4HB@wuerfel>
In-Reply-To: <20160718124122.GA30497@wfg-t540p.sh.intel.com>
References: <8924490.SntxSU2FOC@wuerfel> <20160718124122.GA30497@wfg-t540p.sh.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Fengguang Wu <lkp@intel.com>, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On Monday, July 18, 2016 8:41:22 PM CEST Fengguang Wu wrote:
> Hi Arnd,
> 
> On Mon, Jul 18, 2016 at 02:01:17PM +0200, Arnd Bergmann wrote:
> >Hi Fengguang,
> >
> >I've recently run into a number of cases in which I pulled a branch that
> >was building fine with "make vmlinux", but that failed for "make dtbs",
> >and I wonder if this is something that could be checked by the kbuild
> >test robot so we catch it earlier.
> 
> We initially run "make" without vmlinux, however during bisect more
> specific make targets will be used to speed it up. To do that it's
> necessary to know the regex patterns of "make dtbs" error messages,
> so that they can be correctly bisected.
> 
> Can you give some "make dtbs" error messages or patterns?
> 

A typical error looks like

Error: arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts:252.1-18 Label or path usb_power_supply not found
FATAL ERROR: Syntax error parsing input tree
scripts/Makefile.lib:312: recipe for target 'arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dtb' failed
make[3]: *** [arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dtb] Error 1

There should be almost 100% correlation between seeing "arch/${ARCH}/boot/dts/"
in stderr and having a problem in the "make dtbs" stage.

	Arnd
