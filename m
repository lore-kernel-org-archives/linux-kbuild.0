Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout.selfhost.de ([82.98.82.25]:41288 "EHLO
        outgoing.selfhost.de" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726068AbfDHGEh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Apr 2019 02:04:37 -0400
Subject: Re: 5.0.7 regression: .config file not found
References: <38a457e5-ed95-f71b-3f31-fb54ba1b4da7@afaics.de>
 <CAK7LNATyKv3oMF7fnGr9+itBLgXEG+YGe=nAbckPz4=R=QjTWg@mail.gmail.com>
From: Harald Dunkel <harri@afaics.de>
Message-ID: <c00b3055-e08f-fa0f-e1c7-9172fc7e2138@afaics.de>
Date: Mon, 8 Apr 2019 08:04:33 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNATyKv3oMF7fnGr9+itBLgXEG+YGe=nAbckPz4=R=QjTWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Dear Masahiro-san,

On 4/7/19 6:32 AM, Masahiro Yamada wrote:
> 
> I think the problem will be fixed
> by back-porting the following commit:
> 
> commit 175209cce23d6b0669ed5366add2517e26cd75cd
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>

Seems to work. Thanx very much for your fix.

I wonder if this could be included in the 5.0 branch?


Regards
Harri
