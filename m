Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40217 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbfHAGR3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Aug 2019 02:17:29 -0400
Subject: Re: [PATCH v4] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <20190730181146.6507-1-efremov@linux.com>
 <CAK7LNASW87=sWqEdPChiwxzS3Wwmtr7kO_=XLToLHYO6mDjotw@mail.gmail.com>
 <CAK7LNARrA7dKWaqqtbNUS2yOJfkign4CNvcn_bp2BLyvVAj2FQ@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Message-ID: <ad31b3a8-f662-ef14-148b-347f3671e7d3@linux.com>
Date: Thu, 1 Aug 2019 09:17:25 +0300
MIME-Version: 1.0
In-Reply-To: <CAK7LNARrA7dKWaqqtbNUS2yOJfkign4CNvcn_bp2BLyvVAj2FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 01.08.2019 05:20, Masahiro Yamada wrote:
> 
> The build time impact is very limited.
> I guess this measurement is unnecessary in the commit log.
> 

Thank you for your observations! It was not easy for me to guess to do
it this way because of my limited knowledge about kbuild && modpost
work. In v5 I've only updated commit log: measurements removed, "The
build time impact is very limited and is almost at the unnoticeable
level (< 1 sec)" added instead. Fell free to edit it if you want.

Denis
