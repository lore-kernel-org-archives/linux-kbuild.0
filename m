Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:40872 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752985Ab0C2UiN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Mar 2010 16:38:13 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Mon, 29 Mar 2010 13:38:10 -0700
Date: Mon, 29 Mar 2010 13:38:09 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: Is root kernel parameter expected to be the first one or
 something?
Message-Id: <20100329133809.af969338.rdunlap@xenotime.net>
In-Reply-To: <4BB10A9D.7000506@example.com>
References: <4B9FD5D1.8040203@example.com>
	<4B9FDAF3.9010804@xenotime.net>
	<4BB10A9D.7000506@example.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-kbuild@vger.kernel.org

On Mon, 29 Mar 2010 22:16:29 +0200 Piotr Hosowicz wrote:

> Hello,
> 
> Today I had built a new next kernel with these parameters. I did not get 
> what I expected

I don't think I understand your question.
What did you expect?


> aapi205:/usr/src/linux# cat /proc/cmdline
> vga=791 root=/dev/sda2 ro quiet
> 
> CONFIG_CMDLINE_BOOL=y
> CONFIG_CMDLINE="vga=791"
> # CONFIG_CMDLINE_OVERRIDE is not set
> 
> Is the order important for kernel parameters?

Not that I can see or know of.

> -- 
> NB: 2.6.34-rc2-next-20100329+


---
~Randy
