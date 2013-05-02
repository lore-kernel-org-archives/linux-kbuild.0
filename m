Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.vapor.com ([83.220.149.2]:49704 "EHLO nitrogen.vapor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757067Ab3EBPmI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 May 2013 11:42:08 -0400
Date: Thu, 2 May 2013 16:44:03 +0200
From: Ian Kumlien <pomac@vapor.com>
Subject: Silent failure when missing bc
Message-ID: <20130502144403.GE6335@pomac.netswarm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: hpa@zytor.com, mmarek@suse.cz

Hi, 

A dependency on bc was added at some point during the 3.9 development.

My machines runs a git forest which contains both stable and Torvalds
mainline. So any kernel version is only a:
	git fetch --all && git checkout <tag> away

When switching from v3.8.5 to v3.9-rc7 i ran in to a odd thing.

It seemed to build fine, make install and modules_install was all fine
as well but rebooting revealed that 3.8.5 had been installed again
instead.

Doing make clean and rebuilding revealed that I was missing bc ;)

I have tried to find exactly where it's run since then, i have found the
cmd_bc section but not found what triggers it... Due to lack of time and
energy, I hearby report this bug!

This is about as far as i got:
kernel/Makefile:135:quiet_cmd_bc  = BC      $@
kernel/Makefile:136:      cmd_bc  = bc -q $(filter-out FORCE,$^) > $@

Is there any detaled information and or instructions on kbuild btw?

