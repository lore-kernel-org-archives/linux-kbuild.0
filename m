Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:2249 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754232Ab2ISAUF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 18 Sep 2012 20:20:05 -0400
Subject: Do I have to rename file when a module changes dependency from 1
 file to 2 file?
From: Tim Chen <tim.c.chen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Sep 2012 17:19:57 -0700
Message-ID: <1348013997.9977.138.camel@schen9-DESK>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Currently I have a module foo that has only 1 file foo.c.  However, I
need to add another assembly file (bar.S) to the module and wonder what
is the best way to modify the Makefile without having to rename foo.c.

My original Makefile looks like:

obj-$(CONFIG_FOO) += foo.o

I have to rename foo.c to baz.c, then update the Makefile as below to
get things to work.

obj-$(CONFIG_FOO) += foo.o
foo-y := baz.o bar.S

However, is there a way to change the Makefile so I don't have to
rename foo.c?  That will reduce the size of the patch I have to
generate.  Any suggestions are greatly appreciated.

Tim

