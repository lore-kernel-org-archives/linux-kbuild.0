Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from srvh07.vc-server.de ([83.125.112.170]:39556 "EHLO
	srvh07.vc-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758264AbZIGADM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Sep 2009 20:03:12 -0400
Received: from p4fde92fe.dip0.t-ipconnect.de ([79.222.146.254] helo=foo.net)
	by srvh07.vc-server.de with esmtpa (Exim 4.69)
	(envelope-from <dh@triple-media.com>)
	id 1MkRJq-0007b3-Dp
	for linux-kbuild@vger.kernel.org; Mon, 07 Sep 2009 01:38:50 +0200
Date: Mon, 7 Sep 2009 01:38:53 +0200
From: Dennis Heuer <dh@triple-media.com>
Subject: arch/i386/boot/bzImage once a link and once a binary
Message-Id: <20090907013853.4f7800fc.dh@triple-media.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

hello

am not shure if this is a failure.

the first time i compiled 2.6.31-rc9 i naively copied
arch/i386/boot/bzImage to /boot and, after the obligatory restart, got
a grub boot-time error 16: filesystem inconsistent. this was a shock!
however, the fallback-kernel did boot fine. i checked the
config but couldn't find anything problematic. so i tried to
just re-compile linux and to copy the new bzImage over the previous
one but, luckily, cp refused to copy through a link(!). this is why i
recognized that the first bzImage was created as a link to 
 ../../x86/boot/bzImage. however, the second time there was a
regular binary at same place. am now not shure if x86 is the right
folder for grabbing bzImage for intel architectures or if there is some
real error in the compilation scripts.

regards,
dennis heuer
