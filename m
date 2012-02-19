Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail01.solnet.ch ([212.101.4.135]:59637 "EHLO mail01.solnet.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755115Ab2BSVmE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Feb 2012 16:42:04 -0500
Received: from mail01.solnet.ch (localhost.solnet.ch [127.0.0.1])
	by mail01.solnet.ch (Postfix) with ESMTP id 5574FFFFE0
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Feb 2012 21:32:33 +0000 (UTC)
Received: from mail01.solnet.ch ([127.0.0.1])
	by mail01.solnet.ch (mail01.solnet.ch [127.0.0.1]) (SolNet-Check, port 10024)
	with LMTP id KOxUDu3KGOBR for <linux-kbuild@vger.kernel.org>;
	Sun, 19 Feb 2012 21:32:33 +0000 (UTC)
Received: from x201.openelec.tv (65-60-239-77-pool.cable.fcom.ch [77.239.60.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail01.solnet.ch (Postfix) with ESMTPSA id 0A9FFFFFA9
	for <linux-kbuild@vger.kernel.org>; Sun, 19 Feb 2012 21:32:33 +0000 (UTC)
Message-ID: <4F416A6E.3020403@openelec.tv>
Date: Sun, 19 Feb 2012 22:32:30 +0100
From: Stephan Raue <mailinglists@openelec.tv>
MIME-Version: 1.0
Subject: [BUG] make headers_install install system headers instead the ones
 from kernel source
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi all,

"make headers_install INSTALL_HDR_PATH=<dest> ARCH=<arch>" should copy 
the headers from kernel source to <dest> (the toolchain) but it copys 
the headers from my system here.
i have tested this command now with kernel 2.6.39 to 3.3-rc4 its same on 
every tested kernel version.

i have compared the filesize, for example /usr/include/linux/types.h 
with <dest>/include/linux/types.h and <kernel_src>/include/linux/types.h 
and the destination file is the same as the one in /usr/include.

I think its a big problem, because many embe

