Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.225]:37137 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755153AbZHUJTh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Aug 2009 05:19:37 -0400
Date: Fri, 21 Aug 2009 17:21:49 +0800
From: Amerigo Wang <xiyou.wangcong@gmail.com>
Subject: Re: [PATCH 00/14] kconfig: streamline distro configs for testers
Message-ID: <20090821092149.GA5102@cr0.nay.redhat.com>
References: <20090819025634.987354707@goodmis.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090819025634.987354707@goodmis.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, Theodore Tso <tytso@mit.edu>, Arjan van de Ven <arjan@infradead.org>, Greg KH <greg@kroah.com>, "Luis R. Rodriguez" <mcgrof@gmail.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>, Alan Jenkins <sourcejedi.lkml@googlemail.com>, Andi Kleen <andi@firstfloor.org>

On Tue, Aug 18, 2009 at 10:56:34PM -0400, Steven Rostedt wrote:
>Here's my rebase of the prior push of streamline-config.pl.
>
>What this patch series does, is add my streamline-config.pl as a make
>option for users. What streamline-config.pl does is to look at the
>modules loaded in the system (lsmod) and then scans all the Makefiles
>and Kconfigs in the current directory tree to find what configs need
>to be set for the modules that are loaded.
>
>It then looks at the .config (if .config is not found, it looks
>in /boot, /proc/config.gz, vmlinux, configs.ko for .configs that it
>may be able to use). This script will remove all options set as =m that
>does not need to be set in order to build the modules found by lsmod.
>
>NOTE: This does not touch any =y option. If you do make allyesconfig
>and then run this, it will have not effect anything. Nor does this enable
>any thing that is not set. Although we may change this in the future.
>
>This patch series provides:
>
>  make localmodconfig
>
>which will look for a .config to streamline. Then it will run silentoldconfig
>to clean up any missing options.
>
>  make localyesconfig
>
>will remove all =m that is not needed to build the modules provided
>by lsmod, and then convert the rest to =y. Note, once you do this, no more
>changes will be made by these scripts.
>
>This is idea to help testers. Since a lot of people download a kernel
>from kernel.org and then uses the distro config to configure it. This can
>take hours to build. Now all a tester needs to do, is to download the
>kernel from kernel.org and run "make localmodconfig". This will disable
>most of the modules that are set in distro kernels and speed up the
>build time by magnitudes!

Awesome!!

If I understand this correctly, this is what many people desired to
have to configure kernel automatically.

I am just a little bit confused by the names "streamline" and
"localXXconfig", how about "autoconfig" ?

Thanks!
