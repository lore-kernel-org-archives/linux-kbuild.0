Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41801 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752246AbbKBSsD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Nov 2015 13:48:03 -0500
Subject: Re: linux-next: Tree for Nov 1 (xconfig problem)
References: <20151102035340.17310681@canb.auug.org.au>
 <2030804.WKiRYyHexJ@tjmaciei-mobl4> <563792D1.2040301@infradead.org>
 <1734407.lgNIi16vzN@tjmaciei-mobl4>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5637AFE0.6060001@infradead.org>
Date: Mon, 2 Nov 2015 10:48:00 -0800
MIME-Version: 1.0
In-Reply-To: <1734407.lgNIi16vzN@tjmaciei-mobl4>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thiago Macieira <thiago.macieira@intel.com>
Cc: Michal Marek <mmarek@suse.cz>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Boris Barbulovski <bbarbulovski@gmail.com>

On 11/02/15 08:58, Thiago Macieira wrote:
> On Monday 02 November 2015 08:44:01 Randy Dunlap wrote:
>>> Randy, we need a backtrace. The problem is on the function that called
>>> first(). Can you make sure the crash generates a core dump, then get the
>>> bt
>>> from that?
>>
>> ASSERT: "!isEmpty()" in file /usr/include/QtCore/qlist.h, line 282
>> ../scripts/kconfig/Makefile:22: recipe for target 'xconfig' failed
>> make[2]: *** [xconfig] Aborted (core dumped)
> [cut]
>> #4  0x00007f858c3eec44 in qFatal(char const*, ...) ()
>>     at /usr/lib64/libQtCore.so.4
>> #5  0x00007f858c3eec8a in  () at /usr/lib64/libQtCore.so.4
>> #6  0x00000000004206cc in ConfigList::updateSelection() ()
> 
> Thanks, Randy.
> 
> This seems to be it:
> 
>         if (selectedItems().count() == 0)
>                 return;
> 
>         ConfigItem* item = (ConfigItem*)selectedItems().first();
> 
> Which means this shouldn't be happening. I don't know how the list could be 
> non-empty in one call and empty in the next.  It's wasteful to call 
> selectedItems() twice (it's not a cheap function), but it shouldn't cause this 
> issue.
> 
> We can easily just cache the result and this is what the attached patch does, 
> but given that this error makes no sense to me, I cannot guarantee that you 
> don't have another problem elsewhere.
> 
> Boris, do you have another idea?
> 

Hi,
What does this patch apply to?
I can't apply it cleanly to to 4.3 or linux-next of yesterday or today.

thanks,

-- 
~Randy
