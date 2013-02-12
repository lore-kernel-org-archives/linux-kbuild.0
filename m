Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:52131 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760763Ab3BLA3c (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2013 19:29:32 -0500
Received: by mail-vc0-f169.google.com with SMTP id n10so4299132vcn.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2013 16:29:32 -0800 (PST)
MIME-Version: 1.0
From: Javier Domingo <javierdo1@gmail.com>
Date: Tue, 12 Feb 2013 01:29:11 +0100
Message-ID: <CALZVapk=-8t8BihTSoTJ=Fh3C9xBtDc9ETpmGpjNBrTYiJLF7g@mail.gmail.com>
Subject: Size of images in make-kpkg and make deb-pkg
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,

I don't know if this belongs here, but I just wanted to came across a
strange thing I am experiencing. I am currently working on v3.6, and I
have just discovered that generated kernel images have a totally
unrelated size.

When I compile with something like make-kpkg --initrd kernel_image
kernel_headers, the generated image is 7.7MB, and when I then run make
deb-pkg, the generated deb package is 33MB.

Other sizes are:
6.5M <-> 24M
38M <-> 484M (!!!)

Can anyone explain me this? I can't understand the difference, appart
from the obvious (that are different tools).

Thank you for your attention,

Javier Domingo
