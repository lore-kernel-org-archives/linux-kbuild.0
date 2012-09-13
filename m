Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:63682 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079Ab2IMTxp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 13 Sep 2012 15:53:45 -0400
Received: by obbuo13 with SMTP id uo13so5143777obb.19
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Sep 2012 12:53:44 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 13 Sep 2012 12:53:44 -0700
Message-ID: <CAO7V0xnj6CLixdDs5LvLiCphvGhj_aZC88-YaoE+BVt-Qu1Rkg@mail.gmail.com>
Subject: =?UTF-8?B?S0JVSUxEX01PRE5BTUU9S0JVSUxEX1NUUigp4oCP?=
From: Paolo Piacentini <paolopiace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Please bear with me as I'm new to kbuild. I'm compiling a driver for
the kernel 2.6.18

The command 'make' reads the Makefile(s) and builds the .*.o.cmd files
from the driver source code.

I see this string in the .*.o.cmd file as gcc parameter:

-D"KBUILD_MODNAME=KBUILD_STR(dma_module)"

My problem is that dma_module is a name that does neither exist in any
source file of the driver nor in any Makefile.

Question: how does 'make' detects/writes that name, dma_module ?

Also, I cannot find any documentation for kbuild in this kernel
version. Any hint about where I can find it?

Thanks a lot and Regards
