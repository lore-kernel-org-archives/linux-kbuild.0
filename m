Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.redfish-solutions.com ([66.232.79.143]:40952 "EHLO
        mail.redfish-solutions.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1760135AbcLVTr3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Dec 2016 14:47:29 -0500
From: Philip Prindeville <philipp@redfish-solutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Ambiguity in Documentation/kbuild/modules.txt
Message-Id: <40236E75-937E-4368-B694-BA5E80647251@redfish-solutions.com>
Date: Thu, 22 Dec 2016 12:32:37 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mfm@muteddisk.com, pjday@mindspring.com, sam@ravnborg.org, mmarek@suse.com
Cc: linux-kbuild@vger.kernel.org

Hi.

I had a question about the Kbuild machinery which isn’t answered in the documentation.  In the example in section 3, we have:

	8123_if.c
	8123_if.h
	8123_pci.c
	8123_bin.o_shipped	<= Binary blob


but what if we were dealing with someone who had written a 2.4 Makefile, and had named the files:

	8123.c                  <= problematic name
	8123_if.c
	8123_if.h
	8123_pci.c
	8123_bin.o_shipped

instead?

It seems to me that the line:

8123-y := 8123.o 8123_if.o 8123_pci.o 8123_bin.o

would be problematic (i.e. a circular dependency).  Yes, the person who developed the software I’m trying to Build should probably have named 8123.c as “8123_main.c” instead, but he didn’t... though arguably it’s an unnecessary restriction to not have a source file called $(module_name).c in the list of sources for $(module_name).ko ...

So how does one work around this issue?  A possible fix to the Kbuild machinery itself would involve linking the $(8123-y) object files into 8123_.o instead, and then using that to derive 8123.ko ...

Thanks,

-Philip

