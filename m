Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46355 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751944AbdHLDP6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Aug 2017 23:15:58 -0400
MIME-Version: 1.0
In-Reply-To: <1cb96165-34a1-7f8e-4211-e87af3cfb60a@infradead.org>
References: <20170810154251.GA23083@localhost.localdomain> <1cb96165-34a1-7f8e-4211-e87af3cfb60a@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 12 Aug 2017 12:15:11 +0900
Message-ID: <CAK7LNARwaZJv62LEqBv5BiGsV9r4TdeNZ41bWH2H-cXA6g7WzA@mail.gmail.com>
Subject: Re: make clean all broken with -j? + question regarding modpost
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Meyer <thomas@m3y3r.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi.

2017-08-11 3:28 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:

>> 2.) compile modpost with debug symbols, -g
>> how do I compile the modpost helper program with debug symbols? In what
>> makefile, kbuild file do I need to add the compiler flag?
>> Any help would be appreciated!


If you want to pass extra options to the build command of host-programs,
HOST_EXTRACFLAGS is supported.

For example,  HOST_EXTRACFLAGS=-g





-- 
Best Regards
Masahiro Yamada
