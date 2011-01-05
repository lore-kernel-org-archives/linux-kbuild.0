Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from iolanthe.rowland.org ([192.131.102.54]:36826 "HELO
	iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751097Ab1AEQxe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Jan 2011 11:53:34 -0500
Date: Wed, 5 Jan 2011 11:53:33 -0500 (EST)
From: Alan Stern <stern@rowland.harvard.edu>
Subject: kbuild system regression (final '/' in directory names)
Message-ID: <Pine.LNX.4.44L0.1101051146560.2094-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Up until the last kernel version or so, I could do something like:

	make M=drivers/usb/misc/

and the kbuild system would automatically do the right thing by
removing the final '/'.  Now it does not do so, and instead it ends up
unnecessarily compiling bogus files like

  CC [M]  drivers/usb/misc//usbtest.o

These final slashes are added by bash's tab-completion mechanism; it 
would be most convenient not to have to remove them manually.

Has this problem been mentioned before?

Alan Stern

