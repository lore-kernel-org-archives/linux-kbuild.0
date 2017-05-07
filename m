Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:41288 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750935AbdEGWwA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 18:52:00 -0400
MIME-Version: 1.0
In-Reply-To: <1493860497-26311-1-git-send-email-yamada.masahiro@socionext.com>
References: <1493860497-26311-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 8 May 2017 07:51:43 +0900
Message-ID: <CAK7LNAShG7ZUbo=h5UyS90vXQ10ZFTpeRp3Xw7UKFLKhUe9zuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: dtbinst: remove unnecessary __dtbs_install_prep target
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, Russell King <rmk+kernel@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-05-04 10:14 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Since commit 5399eb9b3908 ("dtbsinstall: don't move target directory
> out of the way"), the target __dtbs_install_prep is invoked just for
> creating the install directory, but all the necessary directories
> are automatically created by:
>    cmd_dtb_install = mkdir -p $(2); cp $< $(2)
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
