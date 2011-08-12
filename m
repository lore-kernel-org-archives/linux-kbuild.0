Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251]:11567 "EHLO
	wolverine02.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752478Ab1HLRqZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Aug 2011 13:46:25 -0400
Message-ID: <4E4566F0.4020001@codeaurora.org>
Date: Fri, 12 Aug 2011 10:46:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
Subject: Relinking zImage when nothing changes
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: linux-kbuild@vger.kernel.org, Peter Foley <pefoley2@verizon.net>

I was hoping with the recent patch e78e8f2 (kernel: prevent unnecessary
rebuilding due to config_data.gz, 2011-07-05) compiling ARM linux a
second time would amount to no more linking. This doesn't seem to be the
case though. Doing a make V=2 I see that lib1funcs.S is shipped and thus
we have to recompile it although nothing actually changed. This in turn
requires us to relink the compressed vmlinux and then recreate the zImage.

  Kernel: arch/arm/boot/Image is ready
  SHIPPED arch/arm/boot/compressed/lib1funcs.S - due to missing .cmd file
  AS      arch/arm/boot/compressed/lib1funcs.o - due to: arch/arm/boot/compressed/lib1funcs.S
  LD      arch/arm/boot/compressed/vmlinux - due to: arch/arm/boot/compressed/lib1funcs.o
  OBJCOPY arch/arm/boot/zImage - due to: arch/arm/boot/compressed/vmlinux
  Kernel: arch/arm/boot/zImage is ready


Is there any way to avoid this? Perhaps the shipped command could become
a bit wiser?

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

