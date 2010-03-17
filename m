Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:34845 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1755076Ab0CQRx0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Mar 2010 13:53:26 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 17 Mar 2010 10:53:24 -0700
Message-ID: <4BA11714.3080706@xenotime.net>
Date: Wed, 17 Mar 2010 10:53:24 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com> <4B9FDAF3.9010804@xenotime.net> <4BA04B59.6090804@example.com> <4BA0F031.2070104@xenotime.net> <4BA0F8DE.1050006@example.com> <4BA0FB35.8090207@xenotime.net> <4BA11627.6020308@example.com>
In-Reply-To: <4BA11627.6020308@example.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-kbuild@vger.kernel.org

On 03/17/10 10:49, Piotr Hosowicz wrote:
> Randy Dunlap wrote:
> 
>> The first thing that I would try is enabling CONFIG_DEVTMPFS and
>> CONFIG_DEVTMPFS_MOUNT, rebuild, reboot...
> 
> I've rebuilt and it boots fine. Just after booting the kernel it had to
> think for a while and I was afraid that it won't boot at all. But it
> booted.

Good.

> BTW What is this message during building about? Should I worry?
> 
> WARNING: modpost: Found 106 section mismatch(es).
> To see full details build your kernel with:
> 'make CONFIG_DEBUG_SECTION_MISMATCH=y'

"Worry" is probably too strong of a word there.  Any section mismatch
is a potential kernel Oops, but most of them don't cause problems.
If you do get an Oops or BUG or other problem, please post it to the
linux-kernel mailing list.

-- 
~Randy
