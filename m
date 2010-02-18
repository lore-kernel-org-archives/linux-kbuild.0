Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:48863 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1755106Ab0BRC1S (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 17 Feb 2010 21:27:18 -0500
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Wed, 17 Feb 2010 18:27:15 -0800
Message-ID: <4B7CA583.5020002@xenotime.net>
Date: Wed, 17 Feb 2010 18:27:15 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
MIME-Version: 1.0
Subject: makefiles: obj vs. objtree
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Can someone clarify the difference(s) in these variables, please?

Documentation/kbuild.txt says about objtree:

$(objtree) is the directory where output files are saved.
The output directory is often set using "O=..." on the commandline.


Documentation/makefiles.txt says about obj:

    $(obj)
	$(obj) is a relative path which points to the directory
	where the target is saved. Always use $(obj) when
	referring to generated files.


These appear to be the same to me, but let me be more specific:

In some cases (or places), Documentation/DocBook/Makefile uses
$(obj) and other cases/places, it uses $(objtree).
Does it have these correct, or should some of them be fixed?

thanks,
-- 
~Randy
