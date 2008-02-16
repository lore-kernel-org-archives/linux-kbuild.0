Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:40318 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769AbYBPVz7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Feb 2008 16:55:59 -0500
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com ([72.140.150.221] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JQV0p-0007gd-5Y
	for linux-kbuild@vger.kernel.org; Sat, 16 Feb 2008 16:55:59 -0500
Date: Sat, 16 Feb 2008 16:55:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: "aflags-y" versus "asflags-y"??
Message-ID: <alpine.LFD.1.00.0802161653320.4271@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  i'm confused ... try both of the following:

  $ grep -r aflags- *
  $ grep -r asflags- *

so which one is the standard?  and for added entertainment,

  $ grep -r extra-aflags-x *

that seems just wrong.

rday
--


========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
