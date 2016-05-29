Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp484.redcondor.net ([208.80.204.84]:33562 "EHLO
	smtp484.redcondor.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964772AbcE2QyJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 29 May 2016 12:54:09 -0400
Received: from astoria.ccjclearline.com ([64.235.106.9])
          by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
          via TCP (outbound) with ESMTPS id 20160529165406945_0484
          for <linux-kbuild@vger.kernel.org>;
          Sun, 29 May 2016 16:54:06 +0000
Received: from [99.240.204.5] (port=46114 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1b7408-000098-32
	for linux-kbuild@vger.kernel.org; Sun, 29 May 2016 12:55:44 -0400
Date: Sun, 29 May 2016 12:53:26 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: is there any reason to *explicitly* include a UAPI header file?
Message-ID: <alpine.LFD.2.20.1605291246080.31954@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


  i'm well aware of the header file search path defined in the
top-level Makefile:

  # Use USERINCLUDE when you must reference the UAPI directories only.
  USERINCLUDE    := \
                -I$(srctree)/arch/$(hdr-arch)/include/uapi \
                -Iarch/$(hdr-arch)/include/generated/uapi \
                -I$(srctree)/include/uapi \
                -Iinclude/generated/uapi \
                -include $(srctree)/include/linux/kconfig.h

  # Use LINUXINCLUDE when you must reference the include/ directory.
  # Needed to be compatible with the O= option
  LINUXINCLUDE    := \
                -I$(srctree)/arch/$(hdr-arch)/include \
                -Iarch/$(hdr-arch)/include/generated/uapi \
                -Iarch/$(hdr-arch)/include/generated \
                $(if $(KBUILD_SRC), -I$(srctree)/include) \
                -Iinclude \
                $(USERINCLUDE)

so given that "kernel" header files will be found before "user" header
files of the same name, is there any defense to doing something like
this in include/linux/netdevice.h:

  #include <uapi/linux/netdevice.h>
  #include <uapi/linux/if_bonding.h>
  #include <uapi/linux/pkt_cls.h>

why would someone, in kernel code, explicitly include a header file in
uapi/?

  it would seem that there are two possibilities. if there is only one
version of that file in uapi/, it'll be found eventually, and if there
is a version of that file in, say, include/linux/, then it's the one
that should be included, because one assumes that version would
include the one under uapi/, no?

  thoughts? am i just massively misunderstanding something?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

