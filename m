Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:53421 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757360Ab3GEPgW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jul 2013 11:36:22 -0400
Received: by mail-we0-f175.google.com with SMTP id t59so2065822wes.20
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jul 2013 08:36:21 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
Date: Fri, 5 Jul 2013 17:36:21 +0200
Message-ID: <CA+icZUX=sOdR5J3rM0YLw350jWJxS7+R_Bb0WkHb7Q4Ekbc6Zg@mail.gmail.com>
Subject: $(call cc-option) in combination with KBUILD_*FLAGS
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <mmarek@suse.cz>

Hi,

in which case(s) do you have to set a comma or not?

586:KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \

...versus...

597:KBUILD_CFLAGS += $(call cc-option, -fno-stack-protector)

[ Makefile (next-20130704) ]

$ grep -nr KBUILD_CFLAGS Makefile | grep "call cc-option"
586:KBUILD_CFLAGS += $(call cc-option,-fno-reorder-blocks,) \
592:KBUILD_CFLAGS += $(call cc-option,-Wframe-larger-than=${CONFIG_FRAME_WARN})
597:KBUILD_CFLAGS += $(call cc-option, -fno-stack-protector)
623:KBUILD_CFLAGS       += $(call cc-option, -femit-struct-debug-baseonly) \
643:KBUILD_CFLAGS += $(call cc-option, -fno-inline-functions-called-once)
651:KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
657:KBUILD_CFLAGS       += $(call cc-option,-fno-strict-overflow)
660:KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)

Thanks in advance.

Regards,
- Sedat -

P.S.: Noticed while fighting through the LLVMLinux x86_64 (arch) patches.
