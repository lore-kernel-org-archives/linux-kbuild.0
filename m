Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36077 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751639AbcF0Sup (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Jun 2016 14:50:45 -0400
Date: Mon, 27 Jun 2016 20:50:29 +0200
From: Rabin Vincent <rabin@rab.in>
Subject: Faster incremental builds with Ninja
Message-ID: <20160627185029.GA26878@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Ninja is a small build system with a focus on speed.  More details at
https://ninja-build.org/.

I made an experimental Ninja build file generator for the kernel.  The
purpose was to see how much we could decrease compile times (especially
to detect errors) for single file changes.  Results on my machine and
x86 defconfig:

| Change                    | make -j8 | make -j8 objectname | ninja  |
| --------------------------| -------- | ------------------- | ------ |
| No changes                |  2.254s  |       0.731s        | 0.065s |
| One change, compile error |  1.225s  |       0.765s        | 0.077s |
| One change, full link     |  5.915s  |       NA            | 4.482s |

The link time unsuprisingly dominates when performing small changes, but
as can be seen the time until the start of compilation (and thus the
time until any compile errors are detected) is several times smaller
with ninja.

These numbers were measured with the benchmark.sh included in the
repository.

  https://github.com/rabinv/kninja

I'm not posting the code as patches here since it's basically a hack.
It parses make's --print-data-base output and requires a full build to
have been performed with make before it can generate the ninja build
files.  Configuration changes and various files with special generation
rules are not handled.

Perhaps it is useful for "personal use" or as inspiration for
optimizations to Kbuild.
