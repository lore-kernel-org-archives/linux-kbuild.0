Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx4.wp.pl ([212.77.101.12]:55417 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750953AbeAVVw7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jan 2018 16:52:59 -0500
Date: Mon, 22 Jan 2018 13:46:07 -0800
From: Jakub Kicinski <kubakici@wp.pl>
Subject: Mutli-directory module Makefiles
Message-ID: <20180122134607.00d77101@cakuba.netronome.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

Hi!

in drivers/net/ethernet/netronome/nfp there is a module which is built
from C sources in 4 directories.  What is the best way to handle that?

Currently we just add all the objects in one Makefile:

nfp-objs := \
	    nfpcore/nfp6000_pcie.o \
	    nfpcore/nfp_cppcore.o \
etc.

However, this makes it impossible to build a single object in subdirs:

$ make drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.o
scripts/Makefile.build:45: drivers/net/ethernet/netronome/nfp/nfpcore/Makefile: No such file or directory
make[2]: *** No rule to make target 'drivers/net/ethernet/netronome/nfp/nfpcore/Makefile'. Stop.

Documentation/kbuild/modules.txt also contains an unclear remark that
this is not recommended (or is it about the use of $(src)?):

--- 4.3 Several Subdirectories
	...
	To build the module complex.ko, we then need the following
	kbuild file:

		--> filename: Kbuild
		obj-m := complex.o
		complex-y := src/complex_main.o
		complex-y += src/hal/hardwareif.o

		ccflags-y := -I$(src)/include
		ccflags-y += -I$(src)/src/hal/include

	As you can see, kbuild knows how to handle object files located
	in other directories. The trick is to specify the directory
	relative to the kbuild file's location. **That being said, this
	is NOT recommended practice.**

Making the include optional would work:

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
@@ -42,7 +42,7 @@ save-cflags := $(CFLAGS)
 # The filename Kbuild has precedence over Makefile
 kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
 kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
-include $(kbuild-file)
+-include $(kbuild-file)
 
 # If the save-* variables changed error out
 ifeq ($(KBUILD_NOPEDANTIC),)

Or we could create empty Makefiles in subdirectories...  Is there a
better way of handling this?  Which is preferred?
