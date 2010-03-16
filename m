Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:49341 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752103Ab0CPTmz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Mar 2010 15:42:55 -0400
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Tue, 16 Mar 2010 12:42:54 -0700
Message-ID: <4B9FDF3E.30303@xenotime.net>
Date: Tue, 16 Mar 2010 12:42:54 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: Re: Maybe my frequent kernel building could be of some help to the
 community? And how to build?
References: <4B9FD5D1.8040203@example.com> <4B9FDAF3.9010804@xenotime.net> <4B9FDCED.2060705@example.com>
In-Reply-To: <4B9FDCED.2060705@example.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-kbuild@vger.kernel.org

On 03/16/10 12:33, Piotr Hosowicz wrote:
> Randy Dunlap wrote:
> 
>> You are welcome to do the same or test mainline (with daily
>> builds) and/or Andrew Morton's mmotm patchset.
> 
> Saying "mainline" you mean the *gitN patch from kernel.org? I think I
> could do it. What is the ultimate source of the mmotm patch?

Yes, daily mainline is either by daily *gitN patches or by using a linux-2.6.git
tree that you update at least once per day.

mmotm is announced on linux-kernel mailing list.  It is available as a tarball
of patches against mainline, e.g.:

mmotm-2010-0311-1313 ... applies to: 2.6.34-rc1

or in a git tree (somewhat delayed):

The mm-of-the-moment snapshot 2010-03-11-13-13 has been uploaded to

   http://userweb.kernel.org/~akpm/mmotm/

and will soon be available at

   git://zen-kernel.org/kernel/mmotm.git

See http://userweb.kernel.org/~akpm/mmotm/mmotm-readme.txt for more info.



>> However, boot testing is probably even more helpful, such as you
>> have already tried.  The /dev/sda2 root problem is probably just a
>> configuration problem.  Would you like to try to diagnose it?
> 
> I uninstalled that kernel and now I don't have that config.


-- 
~Randy
