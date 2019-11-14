Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f49.google.com ([209.85.128.49]:35194 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfKNGCo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 01:02:44 -0500
Received: by mail-wm1-f49.google.com with SMTP id 8so4507637wmo.0
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Nov 2019 22:02:42 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Date: Thu, 14 Nov 2019 11:32:36 +0530
Subject: KBUILD_IMAGE-reg
Message-ID: <20191114060236.GA13066@oxygen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

Hi All,

I see that we have moved from directly using KBUILD_IMAGE to "make image_name"
to decide the image to be included in the final deb package. Long ago when
I remember we could override KBUILD_IMAGE in the environment to include
the image of our choice in the deb pkg.

Is this possible now by any other means? Because there are times when I
would like to include vmlinux instead of vmlinuz and just wondering how
one could go about accomplishing that.

Thanks,
Vijai Kumar K
