Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38363 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752151AbdDIJmB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Apr 2017 05:42:01 -0400
Received: by mail-wm0-f43.google.com with SMTP id t189so18335890wmt.1
        for <linux-kbuild@vger.kernel.org>; Sun, 09 Apr 2017 02:42:01 -0700 (PDT)
Received: from localhost.localdomain (se167-2-88-172-169-60.fbx.proxad.net. [88.172.169.60])
        by smtp.gmail.com with ESMTPSA id 94sm12904753wrp.34.2017.04.09.02.41.59
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Apr 2017 02:41:59 -0700 (PDT)
From: Vincent Legoll <vincent.legoll@gmail.com>
Subject: [PATCH RFC] menuconfigification work
Date: Sun,  9 Apr 2017 11:41:51 +0200
Message-Id: <20170409094152.22268-1-vincent.legoll@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


Hello,

This is a RFC, for making some menus in Kconfig into menuconfigs, so that it is
easier to disable a whole tree of options without even entering the menu.

The rationale is that the people that build their own kernels may want to
disable unused things.

I tried with one of the easy ones (or so I think) PPS.

Did I do it properly ?

I had to change some "if PPS" into "depends", and even add one that was implicit
before, to PPS_GENERATOR_PARPORT.

Is this kind of work wanted ?
Is this acceptable for mainline ?

If yes, I intend to find other candidates and do proper patch submissions, with
the relevant maintainers also included in the review.

Please advise
Thanks
