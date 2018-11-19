Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:41214 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730797AbeKTHQP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Nov 2018 02:16:15 -0500
From: Randy Dunlap <rdunlap@infradead.org>
Subject: netfilter Kconfig question
Message-ID: <e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org>
Date: Mon, 19 Nov 2018 12:50:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Taehee Yoo <ap420073@gmail.com>

Hi Yamada-san,

There was recently a netfilter build error in linux-next for which
a patch was posted by Taehee Yoo.  The patch works (fixes the build
error) but I don't see how or why.

My build error report is here:
https://lore.kernel.org/lkml/fa7a7824-44df-c058-dba2-ec29c5028361@infradead.org/T/#u


Would you take a look at it and try to explain why the patch works?

The patch's email thread begins here:
https://www.spinics.net/lists/netfilter-devel/msg56985.html

Thanks.
-- 
~Randy
