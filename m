Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from einhorn.in-berlin.de ([192.109.42.8]:33205 "EHLO
	einhorn.in-berlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590Ab2JNR5d (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 14 Oct 2012 13:57:33 -0400
Date: Sun, 14 Oct 2012 19:57:28 +0200
From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: new "Cputime accounting" kconfig prompt not "make oldconfig"
 friendly
Message-ID: <20121014195728.2746c32b@stein>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Hi Frederic,

commit fdf9c356502a "cputime: Make finegrained irqtime accounting
generally available" introduced a new kconfig prompt.  From the diff
I can see that you also added help texts for two new options (and an
old option already had its own help text).  But alas "make oldconfig"
is unable to show these texts.

    $ make oldconfig
    [...]
    * Restart config...
    *
    *
    * CPU/Task time and stats accounting
    *
    Cputime accounting
    > 1. Simple tick based cputime accounting (TICK_CPU_ACCOUNTING) (NEW)
      2. Fine granularity task level IRQ time accounting (IRQ_TIME_ACCOUNTING)
    choice[1-2]: ?
    
    There is no help available for this option.

I wonder if make oldconfig could be made smarter about presenting
help for choice prompts.  As a complication, this particular
prompt's set of items differs from architecture to architecture.
-- 
Stefan Richter
-=====-===-- =-=- -===-
http://arcgraph.de/sr/
