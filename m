Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:44520 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbfFCRdk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 13:33:40 -0400
Date: Mon, 3 Jun 2019 19:33:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are
 self-contained
Message-ID: <20190603173328.GA11045@ravnborg.org>
References: <20190516194818.29230-1-jani.nikula@intel.com>
 <20190524174011.GA23737@ravnborg.org>
 <CAK7LNARY_L3Oyi7hhCZXVwNRAsf6ceSarTNDrzdfXQGj1tDFJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARY_L3Oyi7hhCZXVwNRAsf6ceSarTNDrzdfXQGj1tDFJw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Michal Marek <michal.lkml@markovi.net>

Hi Masahiro/Jani.

> 
> Following the obj-y pattern,
> I want to make header-test-y relative to $(obj).

I also considered this and agree this is better.

Otherwise we end up with a spaghetti of dependencies across the tree.

What I made just fit the purpose I had that day,
which is no excuse for bad design.

> I prefer this:
> 
> quiet_cmd_header_test = HDRTEST $@
>       cmd_header_test = echo "\#include \"$*.h\"" > $@
> 
> $(obj)/%.header_test.c:
>         $(call cmd,header_test)

Even better - good.

We call it HDRTEST - so why not just go for that name:

    hdrtest-y += headerfile.h

??

The current proposal with "header-test-y" hurts the eye a little with
two '-', and all other variables uses only one '-' as is today.
(generic-y, obj-y etc).

This is bikeshedding but is was itcing me a little.

	Sam
