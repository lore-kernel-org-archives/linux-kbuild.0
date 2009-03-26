Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from yx-out-2324.google.com ([74.125.44.30]:5533 "EHLO
	yx-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751034AbZCZHfq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 26 Mar 2009 03:35:46 -0400
Received: by yx-out-2324.google.com with SMTP id 31so387829yxl.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2009 00:35:44 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 26 Mar 2009 17:27:33 +1000
Message-ID: <1d3f23370903260027m3dc821bbse2bc0461bd421616@mail.gmail.com>
Subject: Building into out-of-tree subdirectories
From: John Williams <john.williams@petalogix.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Simek <michal.simek@petalogix.com>

Hi,

I'm looking at a way to build and link out-of-tree subdirectories into
the normal kbuild process.  Allow me to explain why and how:

In the MicroBlaze arch (currently seeking mainline merge on LKML) we
hold platform-specific board setup code in this structure

arch/microblaze/platform/my_board
 *  Makefile
           obj-y += setup.o
 *  setup.c
 * ...

Then we have arch/microblaze/platform/Makefile
dir-$(CONFIG_PLATFORM_MY_BOARD) += my_board
dir-$(CONFIG_PLATFORM_MY_OTHER_BOARD) += my_other_board

Finally, arch/microblaze/platform/Kconfig.platform has an option
submenu allowing to select specific boards, which chooses one of the
available CONFIG_PLATFORM_* configs.

So far so good.

The problem with this is to add a new platform we must edit both the
platform/Makefile and platform/Kconfig.platform.

So, I am experimenting with a different approach:

In Kconfig.platform:

+config CUSTOM_PLATFORM
+       bool "Build custom platform directory"
+       default n
+       help
+         Select this option if you want to build a custom platform directory
+         rather than one of the standard platforms in the kernel
+
+config CUSTOM_PLATFORM_PATH
+       string "Path to custom platform directory"
+       depends on CUSTOM_PLATFORM
+       help
+         Enter the path (absolute or relative) to the custom platform directory
+         you wish to build

Then, platform/Makefile becomes

+
+ifeq ($(CONFIG_CUSTOM_PLATFORM),y)
+subdir-y += $(CONFIG_CUSTOM_PLATFORM_PATH)/
+else
obj-$(CONFIG_PLATFORM_MY_BOARD) += my_board/
obj-$(CONFIG_PLATFORM_MY_OTHER_BOARD) += my_other_board/
+endif

This allows new boards to be added simply by creating a subdir in
platforms/, and naming it in your .config.  It's much more data driven
than hacking every new platform into the Makefile and Kconfig system.

Now, in the goal of distributing pristine kernel trees that can still
target non-standard boards, it would be really cool if we could
actually build custom platform dirs that live *outside* the kernel
tree, thusly:

CONFIG_CUSTOM_PLATFORM_PATH=/tmp/my_platform

But, because Kbuild inserts $(obj) in front of the .o target, we get
errors from trying to build things like

/path/to/kernel/tree/arch/microblaze/platform//tmp/my_platform

Note the double directory slash in the middle, and putting our nice
absolute path at the end of a relpath.  Breakage ensues.

Now I can hack past this by specifying an insane relative path to the
out of tree platform dir:

CONFIG_CUSTOM_PLATFORM_PATH=../../../../../../tmp/my_platform

This actually works but that's pretty unfriendly.

So here's the question - is it (a) difficult or (b) unreasonable to
tweak kbuild so that it detects absolute paths in $(obj-y) and
$(subdir-y) definitions, and in that case doesn't prepend $(obj) to
the path, but just goes straight there?

Possible objections are clear - this could be abused to build and link
proprietary code into the kernel without actually modifying the tree.
In response to this I would say

1. If GPL non-compliance is your game, you'll just throw non-GPL code
into your local tree and build it anyway, and not share your code, and
2. It can be done already to build of tree modules - the differences
here is we are planning to statically link into the kernel.

Any comments?

If you're still reading here, then thanks, and please cc: me on
replies as I'm not subscribed to kbuild yet.

Cheers,

John
