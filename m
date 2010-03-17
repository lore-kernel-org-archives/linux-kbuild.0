Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:34276 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751951Ab0CQQDh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Mar 2010 12:03:37 -0400
Message-ID: <4BA0FD53.2000400@example.com>
Date: Wed, 17 Mar 2010 17:03:31 +0100
From: Piotr Hosowicz <piotr@hosowicz.com>
Reply-To: piotr@hosowicz.com
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com> <4B9FDAF3.9010804@xenotime.net> <4BA04B59.6090804@example.com> <4BA0F031.2070104@xenotime.net> <4BA0F8DE.1050006@example.com> <4BA0FB35.8090207@xenotime.net>
In-Reply-To: <4BA0FB35.8090207@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

Randy Dunlap wrote:

> OK, are you using lilo or grub?

I am using GRUB.

> Whatever boot loader it is, please
> show us a working boot loader config entry and the failing boot loader
> config entry.

This is the working one, one of working ones:

title		Debian GNU/Linux, kernel 2.6.34-rc1-nx-20100317-next-20100317+
root		(hd0,0)
kernel		/vmlinuz-2.6.34-rc1-nx-20100317-next-20100317+ root=/dev/sda2 ro 
quiet
initrd		/initrd.img-2.6.34-rc1-nx-20100317-next-20100317+


This is the failing one:

title		Debian GNU/Linux, kernel 2.6.34-rc1-nxa-20100315-next-20100315+
root		(hd0,0)
kernel		/vmlinuz-2.6.34-rc1-nxa-20100315-next-20100315+ root=/dev/sda2 
ro quiet
initrd		/initrd.img-2.6.34-rc1-nxa-20100315-next-20100315+

> The first thing that I would try is enabling CONFIG_DEVTMPFS and
> CONFIG_DEVTMPFS_MOUNT, rebuild, reboot...

Ok, thanks, I'll try.

-- 
Jest jedna korzy¶æ z posiadania TV - jak dobrze
rozregulujesz odbiornik, trafisz na promieniowanie
mikrofalowe z pocz±tków Wszech¶wiata.
NP:  -
