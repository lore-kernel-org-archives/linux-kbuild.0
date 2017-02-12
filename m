Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail5.fer.hr ([161.53.72.235]:6043 "EHLO mail.fer.hr"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751275AbdBLVRz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Feb 2017 16:17:55 -0500
Received: by mail-wr0-f175.google.com with SMTP id i10so139417918wrb.0
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Feb 2017 13:12:18 -0800
 (PST)
MIME-Version: 1.0
From: Juraj <juraj.orsulic@fer.hr>
Date: Sun, 12 Feb 2017 22:11:37 +0100
Message-ID: <CAEPqvoxvQHL=9bfTxE+GtOY225rYaeP5p3_7bNQoj4YG_kL=cQ@mail.gmail.com>
Subject: deb-pkg target invokes clean
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello.

I noticed that the deb-pkg target in scripts/package/Makefile invokes
make clean. Is this really necessary? I disabled it so I could rebuild
.deb packages faster after making small changes to the kernel source.

Juraj
