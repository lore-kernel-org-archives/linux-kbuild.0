Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34110 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfIDDIl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 23:08:41 -0400
Subject: Re: [PATCH 2/3] kbuild, arc: add
 CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3 for ARC
References: <20190820170941.26193-1-yamada.masahiro@socionext.com>
 <20190820170941.26193-2-yamada.masahiro@socionext.com>
 <ed251c63-10e0-bd8a-1a9b-be9ade5cad3f@gmail.com>
 <CAK7LNARd1KFq=GRYQUr16KaiiRzh4ARX5eOpcRcUrZSVgHdhJA@mail.gmail.com>
From: Vineet Gupta <vineetg76@gmail.com>
Message-ID: <c9ff7cad-d3bb-1367-e7c1-0d22fd542903@gmail.com>
Date: Tue, 3 Sep 2019 20:08:45 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNARd1KFq=GRYQUr16KaiiRzh4ARX5eOpcRcUrZSVgHdhJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>

On 9/3/19 8:08 AM, Masahiro Yamada wrote:
>> So if you could please split out the Wmaybe-uninitialized change
> I could not understand your request.
>
> I added 'imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED'
> for CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3.
>
> I cannot split it out. Otherwise, you will see false-positive
> maybe-uninitialized warnings.

Sorry I must have overlooked this part. So no issues now !

Thx,
-Vineet
