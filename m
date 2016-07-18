Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:8056 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751432AbcGRNAq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 09:00:46 -0400
Date: Mon, 18 Jul 2016 21:00:39 +0800
From: Fengguang Wu <lkp@intel.com>
Subject: Re: running "make dtbs" for test builds
Message-ID: <20160718130039.GA31368@wfg-t540p.sh.intel.com>
References: <8924490.SntxSU2FOC@wuerfel>
 <20160718124122.GA30497@wfg-t540p.sh.intel.com>
 <1725840.UfqkDuJ4HB@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1725840.UfqkDuJ4HB@wuerfel>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Jul 18, 2016 at 02:52:32PM +0200, Arnd Bergmann wrote:
>On Monday, July 18, 2016 8:41:22 PM CEST Fengguang Wu wrote:
>> Hi Arnd,
>>
>> On Mon, Jul 18, 2016 at 02:01:17PM +0200, Arnd Bergmann wrote:
>> >Hi Fengguang,
>> >
>> >I've recently run into a number of cases in which I pulled a branch that
>> >was building fine with "make vmlinux", but that failed for "make dtbs",
>> >and I wonder if this is something that could be checked by the kbuild
>> >test robot so we catch it earlier.
>>
>> We initially run "make" without vmlinux, however during bisect more
>> specific make targets will be used to speed it up. To do that it's
>> necessary to know the regex patterns of "make dtbs" error messages,
>> so that they can be correctly bisected.
>>
>> Can you give some "make dtbs" error messages or patterns?
>>
>
>A typical error looks like
>
>Error: arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dts:252.1-18 Label or path usb_power_supply not found
>FATAL ERROR: Syntax error parsing input tree
>scripts/Makefile.lib:312: recipe for target 'arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dtb' failed
>make[3]: *** [arch/arm/boot/dts/sun7i-a20-bananapi-m1-plus.dtb] Error 1
>
>There should be almost 100% correlation between seeing "arch/${ARCH}/boot/dts/"
>in stderr and having a problem in the "make dtbs" stage.

Got it, thank you for the tips!

Regards,
Fengguang

