Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:62790 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751750Ab0LTNJq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Dec 2010 08:09:46 -0500
Received: by wwa36 with SMTP id 36so2915003wwa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Dec 2010 05:09:45 -0800 (PST)
MIME-Version: 1.0
Reply-To: debarshi.ray@gmail.com
Date: Mon, 20 Dec 2010 15:09:44 +0200
Message-ID: <AANLkTimwYddyfERRMkk8GfopJZXLwoVuMr2cLojC9Ma4@mail.gmail.com>
Subject: Headers not found even with EXTRA_CFLAGS
From: Debarshi Ray <debarshi.ray@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

I am trying to build a set of drivers present in the s2-liplianin [1]
tree against Ubuntu's 2.6.35 so that I can use the drivers separately.
So I put the s2-liplianin tree in the ~/s2-liplianin directory and
did:
make -C /lib/modules/$(uname -r)/build M=$(pwd)/linux/drivers/media
CONFIG_DVB_MANTIS=m modules

The build fails for those Makefiles which use EXTRA_CFLAGS to add some
include paths. eg., linux/drivers/media/video/Makefile has:
EXTRA_CFLAGS += -Idrivers/media/dvb/dvb-core
EXTRA_CFLAGS += -Idrivers/media/dvb/frontends
EXTRA_CFLAGS += -Idrivers/media/common/tuners

Here is what I get when the build fails:
/home/fs/dray/s2-liplianin/linux/drivers/media/video/tuner-core.c:25:20:
error: mt20xx.h: No such file or directory
/home/fs/dray/s2-liplianin/linux/drivers/media/video/tuner-core.c:26:21:
error: tda8290.h: No such file or directory
/home/fs/dray/s2-liplianin/linux/drivers/media/video/tuner-core.c:27:21:
error: tea5761.h: No such file or directory

All those files are present in those include paths added to EXTRA_CFLAGS above.

I can see the s2-liplianin tree, like the other Mercurial trees of the
LinuxTV folks, do not look the usual Git trees from kernel.org. Is
that the reason for this problem?

Any suggestions on how to debug this?

Thanks,
Debarshi

[1] http://mercurial.intuxication.org/hg/s2-liplianin

-- 
The camera is to the brush what Java is to assembly.
   -- Sougata Santra
