Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.suse.de ([195.135.220.2]:50621 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753079AbYBTSME (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Feb 2008 13:12:04 -0500
From: Andi Kleen <ak@suse.de>
Subject: rebuilding object files from asm files
Date: Wed, 20 Feb 2008 19:12:00 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200802201912.00091.ak@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org


Here's a small kbuild quirk I noticed on 2.6.25rc2. I tried to rebuild
the obj file of a assembler file (.S) with make path/to/file.o.

Normally when I do this for .o file only its dependencies and 
and the object file are built as I expect.

But with an assembler file (like arch/x86/kernel/head_64.o) kbuild
starts to rebuild everything. 

-Andi

