Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:39302 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756728AbYBPVVa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Feb 2008 16:21:30 -0500
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com ([72.140.150.221] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JQUTX-0006FW-Kv
	for linux-kbuild@vger.kernel.org; Sat, 16 Feb 2008 16:21:35 -0500
Date: Sat, 16 Feb 2008 16:21:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: ccflags-y versus EXTRA_CFLAGS??
Message-ID: <alpine.LFD.1.00.0802161615400.3910@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  IIRC, there are a number of deprecated variables and preferred
forms, along the lines of:

  ccflags-y -> EXTRA_CFLAGS
  asflags-y -> EXTRA_AFLAGS

etc, etc.  what are the rules these days?  thanks.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
