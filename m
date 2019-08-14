Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:52503 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfHNKye (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 06:54:34 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] docs: two fixes for Kbuild document after the ReST conversion
Date: Wed, 14 Aug 2019 19:53:58 +0900
Message-Id: <20190814105400.1339-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

The ReST conversion was merged in the previous merge window.
Iron out some issues.



Masahiro Yamada (2):
  docs: kbuild: fix invalid ReST syntax
  docs: kbuild: remove cc-ldoption from document again

 Documentation/kbuild/makefiles.rst | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

-- 
2.17.1
