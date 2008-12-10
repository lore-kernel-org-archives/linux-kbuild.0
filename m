Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:52486 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755782AbYLJTsj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Dec 2008 14:48:39 -0500
Date: Wed, 10 Dec 2008 14:48:35 -0500 (EST)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Better way to force a rebuild
Message-ID: <alpine.DEB.1.10.0812101443550.11805@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Cc: zippel@linux-m68k.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>


Hi,

In include/linux/kernel.h I currently have the following lines at the 
bottom of the file:

/* Rebuild everything on CONFIG_FTRACE_MCOUNT_RECORD */
#ifdef CONFIG_FTRACE_MCOUNT_RECORD
# define REBUILD_DUE_TO_FTRACE_MCOUNT_RECORD
#endif


This is only there to force a rebuild of all files when 
CONFIG_FTRACE_MCOUNT_RECORD is modified. Since the modification of that 
config causes the build to act different, we need to rebuild all C 
objects. I added the #ifdef in kernel.h as a hack to force the rebuild by 
the config dependencies used in kbuild.

My question is, is there a better way to force a full rebuild on a 
modification of a config?

Thanks,

-- Steve

