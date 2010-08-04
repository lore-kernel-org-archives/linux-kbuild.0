Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:42446 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752288Ab0HDXpi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 4 Aug 2010 19:45:38 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 4 Aug 2010 16:45:31 -0700
Date: Wed, 4 Aug 2010 16:45:31 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [Bugme-new] [Bug 16510] New: LINUX_VERSION_CODE undefined in
 include/linux/version.h
Message-Id: <20100804164531.6232de6d.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

Please look at the messages in this kernel bugzilla.

include/linux/version.h is incompletely generated (using ksh).

---------------------------------------------------------------------------------

Begin forwarded message:

Date: Wed, 4 Aug 2010 07:13:43 GMT
From: bugzilla-daemon@bugzilla.kernel.org
To: bugme-new@lists.osdl.org
Subject: [Bugme-new] [Bug 16510] New: LINUX_VERSION_CODE undefined in include/linux/version.h


https://bugzilla.kernel.org/show_bug.cgi?id=16510

           Summary: LINUX_VERSION_CODE undefined in
                    include/linux/version.h
           Product: Other
           Version: 2.5
    Kernel Version: 2.6.35
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Configuration
        AssignedTo: other_configuration@kernel-bugs.osdl.org
        ReportedBy: jd1008@gmail.com
        Regression: No


I had just run make oldconfig followed by make xconfig on linux-2.6.35.
During make, I got the following compilation error:

  CC      kernel/irq/autoprobe.o
kernel/power/snapshot.c: In function ‘init_header_complete’:
kernel/power/snapshot.c:1547: error: expected expression before ‘;’ token
kernel/power/snapshot.c: In function ‘check_image_kernel’:
kernel/power/snapshot.c:1553: error: expected expression before ‘)’ token
make[2]: *** [kernel/power/snapshot.o] Error 1
make[1]: *** [kernel/power] Error 2
make[1]: *** Waiting for unfinished jobs....

So, I looked at lines 1547  and  1553
and the problem was that LINUX_VERSION_CODE
was left undefined in include/linux/version.h

My .config file is attached.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
