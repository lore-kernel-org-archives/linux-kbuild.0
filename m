Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:49703
	"EHLO sunset.davemloft.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S966100Ab0GPUPF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 16 Jul 2010 16:15:05 -0400
Date: Fri, 16 Jul 2010 13:15:21 -0700 (PDT)
Message-Id: <20100716.131521.55876531.davem@davemloft.net>
Subject: Re: I did a git pull and a plus appeared
From: David Miller <davem@davemloft.net>
In-Reply-To: <4C40BAD1.8090908@garzik.org>
References: <20100716121802.65fdfa24@lembas.zaitcev.lan>
	<4C40BAD1.8090908@garzik.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: jeff@garzik.org
Cc: zaitcev@redhat.com, linux-kbuild@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org, linux-kernel@vger.kernel.org

From: Jeff Garzik <jeff@garzik.org>
Date: Fri, 16 Jul 2010 16:02:25 -0400

> On 07/16/2010 02:18 PM, Pete Zaitcev wrote:
>> How do I get rid of the plus? I have (had for a long time):
>>
>> [zaitcev@niphredil linux-2.6-tip]$ grep LOCAL .config
>> CONFIG_LOCALVERSION="-tip"
>> # CONFIG_LOCALVERSION_AUTO is not set
>> CONFIG_X86_LOCAL_APIC=y
>> [zaitcev@niphredil linux-2.6-tip]$
> 
> Is the '+' listed at the top of the toplevel Makefile?

It's being put there by Kbuild, this has been discussed quite a bit
over the past few weeks I think.

The "+" comes from scripts/setlocalversion

