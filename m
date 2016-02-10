Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:32943 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294AbcBJNFD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Feb 2016 08:05:03 -0500
Received: by mail-ig0-f182.google.com with SMTP id y8so13922208igp.0
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2016 05:05:03 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 10 Feb 2016 14:05:02 +0100
Message-ID: <CAJfOKBzNkER8y_iUnMftaNB0n3vvZU+qTNDEdPXJ=Ehto=H_-w@mail.gmail.com>
Subject: Need to know how to force compileand link dtb for obj-m targets
From: Franck Jullien <franck.jullien@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

For experimenting purpose, I need to compile and link a devicetree to a module.

I can't figure out how the %.dtb rule in Makefile.lib is called when
the target is obj-y but not when it is obj-m.
I'd like to do something like obj-m += test_module.o test.dtb.o.

Thanks in advance for your help.

Franck
