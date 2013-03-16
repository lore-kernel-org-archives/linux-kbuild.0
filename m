Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:50397 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751134Ab3CPEyd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Mar 2013 00:54:33 -0400
Message-ID: <5143FB1F.9010509@infradead.org>
Date: Fri, 15 Mar 2013 21:54:55 -0700
From: Randy Dunlap <rdunlap@infradead.org>
MIME-Version: 1.0
Subject: Re: PROBLEM: CONFIG_DEFAULT_MESSAGE_LOGLEVEL option seems not to
 work
References: <20130315225636.2baf75ae@gmail.com>
In-Reply-To: <20130315225636.2baf75ae@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?B?TWFub2xvIETDrWF6?= <diaz.manolo@gmail.com>
Cc: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 03/15/13 14:56, Manolo Díaz wrote:
> Hi,
> 
> It seems that the kernel loglevel is set to 7 ignoring the
> CONFIG_DEFAULT_MESSAGE_LOGLEVEL option (set to 4 in my config file)
> 
> The /proc/sys/kernel/printk output is 
> 
> 7	4	1	7
> 
> Passing the boot parameter "loglevel=4" or echoing "4 4 1 7"
> to /proc/sys/kernel/printk solves my problem and then this proc file
> contains
> 
> 4	4	1	7
> 
> as expected.
> 
> kernel version:
> Linux version 3.8.3 (root@alcyone) (gcc version 4.7.2 (Debian 4.7.2-5)
> ) #2 SMP Fri Mar 15 08:23:50 CET 2013
> 
> config file is gziped and attached.


Hi,

CONFIG_DEFAULT_MESSAGE_LOGLEVEL modifies the second field (value) in /proc/sys/kernel/printk,
not the first value.  OTOH, the "loglevel" kernel parameter modifies the first value in
that /proc file, not the second value.

Does that clarify/help?

-- 
~Randy
