Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef005-v.nifty.com ([210.131.4.242]:50305 "EHLO
        condef005-v.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754875AbcKBPmg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 11:42:36 -0400
MIME-Version: 1.0
In-Reply-To: <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net> <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 3 Nov 2016 00:35:32 +0900
Message-ID: <CAK7LNASYQCokO7bL72gs6zLrMNx_Sos1So87=bGMCTX_4gowGw@mail.gmail.com>
Subject: Re: [PATCH 09/10] scripts/basic/fixdep: Complete error handling in print_cmdline()
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2016-10-29 8:42 GMT+09:00 Jim Davis <jim.epost@gmail.com>:
> On Fri, Oct 28, 2016 at 1:40 AM, SF Markus Elfring
> <elfring@users.sourceforge.net> wrote:
>
>> +       if (printf("cmd_%s := %s\n\n", target, cmdline) < 10) {
>
> Rather than scatter fragile magic numbers, like 10, throughout the
> code, if you're hell-bent on checking for printf errors you could
> write a little wrapper function that hid the magic number and bundled
> up the errno stuff.


BTW, how the magic number "10" was calculated?




-- 
Best Regards
Masahiro Yamada
