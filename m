Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.235]:2370 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753572AbYFMUyL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jun 2008 16:54:11 -0400
Received: by rv-out-0506.google.com with SMTP id k40so2723024rvb.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Jun 2008 13:54:11 -0700 (PDT)
Message-ID: <8499950a0806131354u7d2431b2n2df50b7b6c98f18d@mail.gmail.com>
Date: Fri, 13 Jun 2008 21:54:11 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: Not as much ccache win as I expected
In-Reply-To: <4852C51D.30206@am.sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4852C51D.30206@am.sony.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tim Bird <tim.bird@am.sony.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org

Tim Bird @ Fri, 13 Jun 2008 12:06:05 -0700:

> I'm running an automated test which does numerous compiles
> of the Linux kernel.  One of the things I do is create a localversion
> file at the root of the kernel source tree with a unique identifier
> that I use later on in testing.

And what kinds of source/kconfig changes are made for every build?
(any versions, e.g. localversion, .version, aren't important, they are for
modules ko and vmlinux, afaik)

[...]
> Is there anything else obvious which is prevents ccache from
> working well with a kernel build (that is, anything else that
> would, for otherwise identical C files with a similar build,
> cause a difference?)

kbuild is `ccache` on itself. Every *.o.cmd is kind of info `ccache`
hashes (except things like stderr, gcc version) to check repeated
rebuilds. Also kconfig<->kbuild link via header magic may confuse
general-purpose `ccache`.

For rebuilds of the same codebase, it's better to use separate
kbuild object output directories.

> Any tips would be appreciated.

Just my handwaving, but test with couple core config symbols
toggling, shows only one `ccache` hit.

olecom@flower:/mnt/zdev0/blinux$ CCACHE_DIR=_ccache/ ccache -s
cache directory                     _ccache/
cache hit                           1133
cache miss                          1141
called for link                       28
not a C/C++ file                      64
no input file                        282
files in cache                      2282
cache size                          15.7 Mbytes
max cache size                     976.6 Mbytes
olecom@flower:/mnt/zdev0/blinux$ make menuconfig # toggle
olecom@flower:/mnt/zdev0/blinux$ diff -u1 .config.old .config
--- .config.old 2008-06-13 22:52:37.000000000 +0200
+++ .config     2008-06-13 23:01:07.000000000 +0200
@@ -3,3 +3,3 @@
 # Linux kernel version: 2.6.24
-# Fri Jun 13 22:52:37 2008
+# Fri Jun 13 23:01:07 2008
 #
@@ -67,3 +67,4 @@
 CONFIG_POSIX_MQUEUE=y
-# CONFIG_BSD_PROCESS_ACCT is not set
+CONFIG_BSD_PROCESS_ACCT=y
+CONFIG_BSD_PROCESS_ACCT_V3=y
 # CONFIG_TASKSTATS is not set
olecom@flower:/mnt/zdev0/blinux$
olecom@flower:/mnt/zdev0/blinux$ CCACHE_DIR=_ccache/ ccache -s
cache directory                     _ccache/
cache hit                           1134
cache miss                          1879
called for link                       33
not a C/C++ file                      79
no input file                        401
files in cache                      3758
cache size                          28.1 Mbytes
max cache size                     976.6 Mbytes
olecom@flower:/mnt/zdev0/blinux$

-- 
sed 'sed && sh + olecom = love'  <<  ''
-o--=O`C
 #oo'L O
<___=E M
