Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:53059 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752417Ab2LWCjy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 22 Dec 2012 21:39:54 -0500
Received: by mail-ob0-f171.google.com with SMTP id dn14so5783860obc.2
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Dec 2012 18:39:54 -0800 (PST)
MIME-Version: 1.0
From: Sunil Beta Baskar <betasam@gmail.com>
Date: Sun, 23 Dec 2012 07:45:43 +0530
Message-ID: <CAK2BWAp__KOnFPzgeynu+Zxb3kvjuEDTa5dPFzTECmqedp1S2g@mail.gmail.com>
Subject: [BUG] Build whitespaces Ignored
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Here is the source path for the Kernel
/home/betasam/Downloads/New Folder/linux-2.6.32.60

(Notice the " " or New\ Folder in-between.)

betasam@nadia ~/Downloads/New Folder/linux-2.6.32.60 $ make i386_defconfig
Makefile:302: warning: overriding commands for target
`/home/betasam/Downloads/New'
Makefile:104: warning: ignoring old commands for target
`/home/betasam/Downloads/New'
Makefile:303: /home/betasam/Downloads/New: No such file or directory
Makefile:303: Folder/linux-2.6.32.60/scripts/Kbuild.include: No such
file or directory
Makefile:446: /home/betasam/Downloads/New: No such file or directory
Makefile:446: Folder/linux-2.6.32.60/arch/x86/Makefile: No such file
or directory
make: *** No rule to make target
`Folder/linux-2.6.32.60/arch/x86/Makefile'.  Stop.


We had a linux kernel build workshop at Pune University, Pune India
and at least three hit this bug.

Is there a fix already that hasn't been backported or should we be
submitting a patch that fixes issues when whitespaces are observed in
the /path/to/kernel/src/

Please advise,
Sunil Beta Baskar
