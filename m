Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:34119 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726243AbfBKMDr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 07:03:47 -0500
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: debian packaging refinements
Date: Mon, 11 Feb 2019 13:03:33 +0100
Message-Id: <1549886616-12609-1-git-send-email-info@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: michal.lkml@markovi.net, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org

Hi folks,

here're some small patches for making mkdebian a bit more flexible, so it
can be used eg. with an given debian/rules file.

I'm using this along w/ local (adding debian/rules and .config) in order
to build the kernel via usual debian toolchains (git-buildpackage,
git-buildpackage, ...) in a canonical way.

Didn't post the patch for debian/rules yet, as it's likely not suited for
mainline yet. (I can post it, if you wish).


--mtx
