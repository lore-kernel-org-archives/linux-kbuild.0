Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:55989 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751136Ab0CPTYg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Mar 2010 15:24:36 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Tue, 16 Mar 2010 12:24:35 -0700
Message-ID: <4B9FDAF3.9010804@xenotime.net>
Date: Tue, 16 Mar 2010 12:24:35 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com>
In-Reply-To: <4B9FD5D1.8040203@example.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-kbuild@vger.kernel.org

On 03/16/10 12:02, Piotr Hosowicz wrote:
> Hello,
> 
> I own quite strong PC, 4 core Pentium. I recently started to build my
> kernel frequently, whenever I see a new patch on kernel.org I build
> again. Bothers me that I do it only for doing it. Maybe it could be of
> some help to the community? And if so, what would be more appreciated -
> linux-next patched kernel or gitN patched kernel? And how should I
> configure the kernel for this purpose? I am afraid of putting all the
> options on, yesterday I tried to put everything on as a module plus I
> tinkered with some other options that seemed innocent. The kernel was
> built but could not boot, saying that there was a problem with the root
> device, it could not recoginze /dev/sda2, which is my correct root
> device. I did not investigate much and reverted to working kernel.
> 
> Thanks in advance for your remarks.

Many linux-next builds are done daily: see
  http://kisskb.ellerman.id.au/kisskb/branch/9/

and then I do 25 x86_32 randconfigs and 25 x64_64 randconfigs
daily and fix most build errors that I find in them.
(I am also using a quad-core PC with a cron job that finds the
next day's linux-next, downloads it, and does 50 builds.)

You are welcome to do the same or test mainline (with daily
builds) and/or Andrew Morton's mmotm patchset.

However, boot testing is probably even more helpful, such as you
have already tried.  The /dev/sda2 root problem is probably just a
configuration problem.  Would you like to try to diagnose it?

-- 
~Randy
