Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([217.72.192.78]:61722 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755952AbcKBRjC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 13:39:02 -0400
Subject: Re: scripts/basic/fixdep: Complete error handling in print_cmdline()
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <d4bd9a09-d413-a073-c2d5-67933d425b87@users.sourceforge.net>
 <CA+r1ZhhoPy4mNwEtLVMqpXqotKuWmUf-D50=XWpWghzdtzTfEQ@mail.gmail.com>
 <CAK7LNASYQCokO7bL72gs6zLrMNx_Sos1So87=bGMCTX_4gowGw@mail.gmail.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <3e08ed31-b8bf-cba0-67f8-0a66d0cdeeb4@users.sourceforge.net>
Date: Wed, 2 Nov 2016 18:38:33 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNASYQCokO7bL72gs6zLrMNx_Sos1So87=bGMCTX_4gowGw@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jim Davis <jim.epost@gmail.com>, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> +       if (printf("cmd_%s := %s\n\n", target, cmdline) < 10) {
>>
>> Rather than scatter fragile magic numbers, like 10, throughout the
>> code, if you're hell-bent on checking for printf errors you could
>> write a little wrapper function that hid the magic number and bundled
>> up the errno stuff.
> 
> 
> BTW, how the magic number "10" was calculated?

Does the passed format string indicate how many characters should be
printed at least?

Regards,
Markus
