Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:44590 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752448Ab0CRPkR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Mar 2010 11:40:17 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2010 08:40:13 -0700
Date: Thu, 18 Mar 2010 08:40:12 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
Message-Id: <20100318084012.0cca4b6a.rdunlap@xenotime.net>
In-Reply-To: <4B9FDAF3.9010804@xenotime.net>
References: <4B9FD5D1.8040203@example.com>
	<4B9FDAF3.9010804@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: piotr@hosowicz.com, linux-kbuild@vger.kernel.org

On Tue, 16 Mar 2010 12:24:35 -0700 Randy Dunlap wrote:

> On 03/16/10 12:02, Piotr Hosowicz wrote:
> > Hello,
> > 
> > I own quite strong PC, 4 core Pentium. I recently started to build my
> > kernel frequently, whenever I see a new patch on kernel.org I build
> > again. Bothers me that I do it only for doing it. Maybe it could be of
> > some help to the community? And if so, what would be more appreciated -
> > linux-next patched kernel or gitN patched kernel? And how should I
> > configure the kernel for this purpose? I am afraid of putting all the
> > options on, yesterday I tried to put everything on as a module plus I
> > tinkered with some other options that seemed innocent. The kernel was
> > built but could not boot, saying that there was a problem with the root
> > device, it could not recoginze /dev/sda2, which is my correct root
> > device. I did not investigate much and reverted to working kernel.
> > 
> > Thanks in advance for your remarks.
> 
> Many linux-next builds are done daily: see
>   http://kisskb.ellerman.id.au/kisskb/branch/9/
> 
> and then I do 25 x86_32 randconfigs and 25 x64_64 randconfigs
> daily and fix most build errors that I find in them.
> (I am also using a quad-core PC with a cron job that finds the
> next day's linux-next, downloads it, and does 50 builds.)
> 
> You are welcome to do the same or test mainline (with daily
> builds) and/or Andrew Morton's mmotm patchset.


One thing that you could do that no one focuses on is building
with some kconfig symbols disabled (ones that are typically enabled),
such as CONFIG_SMP=n, CONFIG_SYSFS=n, CONFIG_PROC_FS=n, CONFIG_PM=n,
CONFIG_PCI=n, CONFIG_BLOCK=n, CONFIG_NET=n, CONFIG_INET=n (but latter
with CONFIG_NET=y), CONFIG_HOTPLUG=n.  Not all of these at the same time,
just various/random combinations of them.


---
~Randy
