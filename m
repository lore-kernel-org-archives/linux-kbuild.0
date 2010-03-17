Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:51154 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751035Ab0CQPyj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Mar 2010 11:54:39 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 17 Mar 2010 08:54:29 -0700
Message-ID: <4BA0FB35.8090207@xenotime.net>
Date: Wed, 17 Mar 2010 08:54:29 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com> <4B9FDAF3.9010804@xenotime.net> <4BA04B59.6090804@example.com> <4BA0F031.2070104@xenotime.net> <4BA0F8DE.1050006@example.com>
In-Reply-To: <4BA0F8DE.1050006@example.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-kbuild@vger.kernel.org

On 03/17/10 08:44, Piotr Hosowicz wrote:
> Randy Dunlap wrote:
> 
>>>> However, boot testing is probably even more helpful, such as you
>>>> have already tried.  The /dev/sda2 root problem is probably just a
>>>> configuration problem.  Would you like to try to diagnose it?
>>> Previously I wrote that I do not have the config - I forgot that I had
>>> built DEB package, so the config is there, I even have the source
>>> package, so I think we can diagnose it. Shall I send you the .config
>>> file off-list (there is some size limit as far as I know).
>>
>> The size limit shouldn't stop a kernel config file.
>> Just send it, please.
> 
> Ok, please find it attached.

OK, are you using lilo or grub?  Whatever boot loader it is, please
show us a working boot loader config entry and the failing boot loader
config entry.

The first thing that I would try is enabling CONFIG_DEVTMPFS and
CONFIG_DEVTMPFS_MOUNT, rebuild, reboot...

-- 
~Randy
