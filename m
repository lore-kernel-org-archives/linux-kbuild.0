Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from po-out-1718.google.com ([72.14.252.158]:56292 "EHLO
	po-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754542AbYAZKkw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 26 Jan 2008 05:40:52 -0500
Received: by po-out-1718.google.com with SMTP id c31so1766107poi.1
        for <linux-kbuild@vger.kernel.org>; Sat, 26 Jan 2008 02:40:51 -0800 (PST)
Date: Sat, 26 Jan 2008 18:38:45 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: The latest linus tree can't build
Message-ID: <20080126103845.GF20935@hacking>
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org


Hi, Sam!

When I built the latest linus tree, I got this error:

...
  CC      sound/oss/msnd.o
make[2]: *** No rule to make target `/etc/sound/msndperm.bin', needed by `sound/oss/msndperm.c'.  Stop.
make[1]: *** [sound/oss] Error 2
make: *** [sound] Error 2

My .config is just the one I sent to you in another thread.
Need me to resend it?

Regards.


