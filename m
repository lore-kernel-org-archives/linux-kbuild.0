Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:55054 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932588AbcBCDbx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Feb 2016 22:31:53 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 4376820251
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Feb 2016 03:31:52 +0000 (UTC)
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B344F20260
	for <linux-kbuild@vger.kernel.org>; Wed,  3 Feb 2016 03:31:50 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id ba1so12366331obb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Feb 2016 19:31:50 -0800 (PST)
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 2 Feb 2016 19:31:30 -0800
Message-ID: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
Subject: Adding Xen to the kbuild bot?
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fengguang Wu <fengguang.wu@intel.com>, LKP <lkp@01.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>

Hi all-

Would it make sense to add some basic Xen PV testing to the kbuild bot?

qemu can boot Xen like this:

qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage
kernelarg otherkernelarg=value" -append 'xenarg other_xen_arg'

This should work with any kernel image for x86 or x86_64 with CONFIG_XEN=y.

Linux has never been been able to do virtio under Xen, which will
screw up your scripts, but I'm cautiously optimistic that virtio will
work as expected on a Xen guest starting with Linux 4.6.  If you want
to play around, it should work in this tree:

https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git/log/?h=virtio_dma

I'm hoping to get that queued up for real in the next couple of days.

--Andy
