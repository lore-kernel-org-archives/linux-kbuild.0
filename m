Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:24511 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752681AbeGFIun (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 04:50:43 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: kconfig usage in automatic kernel test
Message-ID: <a2a39cac-79fc-22d9-e1d0-b94787526794@cn.fujitsu.com>
Date: Fri, 6 Jul 2018 16:49:25 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Masahiro-san,

  I am writing some utility for internal kdump test with latest kernel,
my purpose is to test the new introduced kernel feature. For automatical
test, I see several config target could help, like olddefconfig, all*config.

But for my purpose, I don't find a good way. For example, olddefconfig
will let the now config item has default value, while some feature may
default to "N"; allyesconfig will slow the compilation notably.
But "all*config" has KCONFIG_ALLCONFIG help to customizing some config
item, that is a good utility, but seems it can't be used in olddefconfig.

All these things let me have 2 questions:

1. What would you suggest for my purpose?

2. allyesconfig, allmodconfig, randconfig seems useful for test kbuild,
but what's the purpose of allnoconfig, alldefconfig? In others words,
when people would need allnoconfig, alldefconfig?
-- 
Sincerely,
Cao jin


