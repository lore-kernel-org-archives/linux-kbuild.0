Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:48193 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750706Ab2KEWnl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 5 Nov 2012 17:43:41 -0500
Received: by mail-wg0-f44.google.com with SMTP id dr13so4282184wgb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Nov 2012 14:43:40 -0800 (PST)
Message-ID: <50984118.2070204@gmail.com>
Date: Mon, 05 Nov 2012 22:43:36 +0000
From: Richard H Lee <ricardohenrylee@gmail.com>
MIME-Version: 1.0
Subject: Building linux headers in an non-linux environment
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I'm trying to install linux headers for cygwin using crostool-ng.

ct-ng basically invokes the line:

make -C /home/richard/scratch/x86linux/.build/src/linux-3.5 
O=/home/richard/scratch/x86linux/.build/i386-unknown-linux-gnu/build/build-kernel-headers 
ARCH=x86 
INSTALL_HDR_PATH=/home/richard/x-tools/i386-unknown-linux-gnu/i386-unknown-linux-gnu/sysroot/usr 
V=1 headers_install

and it seems to have checked out v3.5 of the linux kernel.

The problem is that making the headers seems to require an existing set 
of headers already installed. The required headers seem to be in the 
include/ and arch/[target]/ directories.

What is the "correct" way to get the Makefile to use the source tree as 
the source for the linux headers?


In the top-level Makefile, I can see the following variable

 >LINUXINCLUDE    := -I$(srctree)/arch/$(hdr-arch)/include \
 >                   -Iarch/$(hdr-arch)/include/generated -Iinclude \
 >                   $(if $(KBUILD_SRC), -I$(srctree)/include) \
 >                   -include $(srctree)/include/linux/kconfig.h

but I'm not sure how to get this variable picked up. And I don't exactly 
know what to do with KBUILD_SRC.


Richard
