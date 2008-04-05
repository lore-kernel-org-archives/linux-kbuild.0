Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:57531 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753929AbYDEX7k (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 5 Apr 2008 19:59:40 -0400
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com ([72.140.150.221] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1JiIIK-0002QV-LJ
	for linux-kbuild@vger.kernel.org; Sat, 05 Apr 2008 19:59:36 -0400
Date: Sat, 5 Apr 2008 19:59:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: "if CONFIG" versus "depends on CONFIG"
Message-ID: <alpine.LFD.1.00.0804051956270.17908@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  is there any inherent difference between having a config entry
contain

  depends on FUBAR

as opposed to having that config option wrapped inside

  if FUBAR
  ...
  endif

i ask since the Kconfig file drivers/usb/serial/Kconfig wraps almost
the entire file in

  if USB_SERIAL
  ...
  endif

and yet still defines the majority of config entries as depending on
USB_SERIAL, which seems redundant.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
