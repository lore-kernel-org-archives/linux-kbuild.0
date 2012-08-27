Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:39386 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754482Ab2H0Uey (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Aug 2012 16:34:54 -0400
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com ([174.115.5.73]:42588 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1T65Cy-0005rd-QN
	for linux-kbuild@vger.kernel.org; Mon, 27 Aug 2012 15:42:49 -0400
Date: Mon, 27 Aug 2012 15:42:42 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: is there any value in exporting <linux/irqnr.h> to userspace?
Message-ID: <alpine.DEB.2.02.1208271539040.10687@oneiric>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


  given that irqnr.h is completely wrapped in a __KERNEL__ test, it
ends up in userspace with no actual content, and the only header file
that includes it is random.h.  so would it not make sense to drop that
#include from random.h, then drop irqnr.h from being exported?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
