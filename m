Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wa4.bigfish.com ([216.32.181.113]:31638 "EHLO
	mail122-wa4-R.bigfish.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751011AbYFMT0w (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Jun 2008 15:26:52 -0400
Message-ID: <4852C51D.30206@am.sony.com>
Date: Fri, 13 Jun 2008 12:06:05 -0700
From: Tim Bird <tim.bird@am.sony.com>
MIME-Version: 1.0
Subject: Not as much ccache win as I expected
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-embedded <linux-embedded@vger.kernel.org>
Cc: linux-kbuild@vger.kernel.org

I'm running an automated test which does numerous compiles
of the Linux kernel.  One of the things I do is create a localversion
file at the root of the kernel source tree with a unique identifier
that I use later on in testing.

I started using ccache to improve the performance of my builds,
but found that the hit rate on the cache was not very good.
 $ ccache -s
cache directory                     /home/tbird/.ccache
cache hit                          74416
cache miss                         59400
called for link                    87252
compile failed                        21
not a C/C++ file                  143449
no input file                      49336
files in cache                     42844
cache size                           1.8 Gbytes
max cache size                       2.0 Gbytes

Thinking that the problem might be having a unique version for
every build (and that this change flowed to every file via the
version.h file), I tried building without this change.  I saw
an improvement, but not much.

Is there anything else obvious which is prevents ccache from
working well with a kernel build (that is, anything else that
would, for otherwise identical C files with a similar build,
cause a difference?)

Any tips would be appreciated.
 -- Tim

=============================
Tim Bird
Architecture Group Chair, CE Linux Forum
Senior Staff Engineer, Sony Corporation of America
=============================

