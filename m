Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:59391 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750815Ab0KASCR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Nov 2010 14:02:17 -0400
Date: Mon, 1 Nov 2010 10:46:18 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: config help
Message-Id: <20101101104618.319b5482.randy.dunlap@oracle.com>
In-Reply-To: <AANLkTikTLGett2Tinn9+x6Srd5Hre9zKHLb+g8+KJCym@mail.gmail.com>
References: <3B997B64E0C94A689C4C5FDBD09AF912@PC200810081817>
	<20101029100707.2a9afc5c.randy.dunlap@oracle.com>
	<942B93F2162249F3B4CE745DAF6FD9E1@PC200810081817>
	<4CCEEB74.9010809@oracle.com>
	<AANLkTikTLGett2Tinn9+x6Srd5Hre9zKHLb+g8+KJCym@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Yihe Chen <yihect@juliantec.info>, linux kbuild list <linux-kbuild@vger.kernel.org>

On Mon, 1 Nov 2010 13:41:33 -0400 Arnaud Lacombe wrote:

> Hi,
> 
> On Mon, Nov 1, 2010 at 12:31 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> > Anyway, in 2.6.35, scripts/kconfig/Makefile is fairly clear on those
> > short option strings:
> >
> > -o      oldconfig
> > -s      silentoldconfig
> > -r      randconfig
> > -y      allyesconfig
> > -n      allnoconfig
> > -m      allmodconfig
> > -d      defconfig
> > -D filename     use filename as default configuration
> >
> This is no longer the case for 2.6.36. That part of `conf' has been
> moved to long options. It points to the toplev README for more info
> (which are not preset), but I don't think these low level options
> description belong there.
> 
> I've got some patches in the area, that should not be long.

Hi,
Did you read the part that you snipped:

<quote>
What kernel version are you looking at?  Something before 2.6.36 ?
I ask that because in 2.6.36 and later, the config command line tool only
uses long option strings (like --oldconfig), not short option strings
(like -o).
</quote>


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
