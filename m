Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ezexch.ezchip.com ([212.179.42.101]:27456 "EHLO
	ezexch.ezchip.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757330Ab2JLN3B convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Oct 2012 09:29:01 -0400
From: Noam Camus <noamc@ezchip.com>
Date: Fri, 12 Oct 2012 15:22:54 +0200
Subject: Makefile race betwwen jobs
Message-ID: <264C179F799EF24AB26D5319053335E80CC30499A3@ezexch.ezchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

Hello

I encountered a race between targets scripts_basic and asm-generic (due -j2 make flag).

It happens when source tree is distcleaned (mrproper).

First job:
	running target asm-generic to generate all wrappers in architecure include/generated.
Second job:
	trying to compile empty.c since it is under target "always" which is dependency for __build.

The error is because empty.o depends on some headers from arch/<arch>/include/generated/asm/.

This race is rare and can be very annoying.

My naive patch for root Makefile is:
 # Basic helpers built in scripts/
 PHONY += scripts_basic
-scripts_basic:
+scripts_basic: asm-generic
        $(Q)$(MAKE) $(build)=scripts/basic
        $(Q)rm -f .tmp_quiet_recordmcount

Noam Camus