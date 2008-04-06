Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:36004 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752292AbYDFTli (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Apr 2008 15:41:38 -0400
Received: from cpe001d60ad7267-cm001225dbafb6.cpe.net.cable.rogers.com ([99.236.100.208] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.68)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1Jiakg-0000ts-6Q
	for linux-kbuild@vger.kernel.org; Sun, 06 Apr 2008 15:42:06 -0400
Date: Sun, 6 Apr 2008 15:41:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: why "depends on FUBAR!=n"?
Message-ID: <alpine.LFD.1.00.0804061540050.19835@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild devel list <linux-kbuild@vger.kernel.org>


  i'm sure i'll regret asking this, but why are there a number of
Kconfig dependency directives of the form:

  depends on FUBAR!=n

how exactly does that differ from just

  depends on FUBAR

thanks.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
