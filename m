Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gw0-f46.google.com ([74.125.83.46]:52448 "EHLO
	mail-gw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759181Ab0GPUCh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jul 2010 16:02:37 -0400
Message-ID: <4C40BAD1.8090908@garzik.org>
Date: Fri, 16 Jul 2010 16:02:25 -0400
From: Jeff Garzik <jeff@garzik.org>
MIME-Version: 1.0
Subject: Re: I did a git pull and a plus appeared
References: <20100716121802.65fdfa24@lembas.zaitcev.lan>
In-Reply-To: <20100716121802.65fdfa24@lembas.zaitcev.lan>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pete Zaitcev <zaitcev@redhat.com>
Cc: linux-kbuild@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org, linux-kernel@vger.kernel.org

On 07/16/2010 02:18 PM, Pete Zaitcev wrote:
> Dear All:
>
> I have a tree that existed for a few years (a clone of Linus' tree).
> Today I did a git pull in it, and a plus appeared in the built version.
> E.g. after "make modules_install":
>
> [root@niphredil linux-2.6-tip]# ls /lib/modules/
> 2.6.33.1-19.fc13.x86_64  2.6.34-rc6-tip                    2.6.35-rc1-tip
> 2.6.34-43.fc14.x86_64    2.6.35-0.36.rc4.git5.fc14.x86_64  2.6.35-rc5-tip+
> [root@niphredil linux-2.6-tip]#
>
> How do I get rid of the plus? I have (had for a long time):
>
> [zaitcev@niphredil linux-2.6-tip]$ grep LOCAL .config
> CONFIG_LOCALVERSION="-tip"
> # CONFIG_LOCALVERSION_AUTO is not set
> CONFIG_X86_LOCAL_APIC=y
> [zaitcev@niphredil linux-2.6-tip]$

Is the '+' listed at the top of the toplevel Makefile?

	Jeff



