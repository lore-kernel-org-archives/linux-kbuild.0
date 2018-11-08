Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cmta20.telus.net ([209.171.16.93]:39902 "EHLO cmta20.telus.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbeKHOnw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Nov 2018 09:43:52 -0500
From: "Doug Smythies" <dsmythies@telus.net>
References: <000001d47513$354f12b0$9fed3810$@net> JsqygbFYE7nW7Jsr3gxoS6
In-Reply-To: JsqygbFYE7nW7Jsr3gxoS6
Subject: RE: [RESEND] kernel version build number in .deb to low by 1. [REGRESSION][BISECTED]
Date: Wed, 7 Nov 2018 21:10:05 -0800
Message-ID: <000801d47721$52627f80$f7277e80$@net>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-ca
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Masahiro Yamada' <yamada.masahiro@socionext.com>
Cc: 'Riku Voipio' <riku.voipio@linaro.org>, 'Linux Kbuild mailing list' <linux-kbuild@vger.kernel.org>, Doug Smythies <dsmythies@telus.net>

On 2018.11.05 20:20 Masahiro Yamada wrote:

...[snip]...

> Sorry for the delay.
>
> I just sent a fix-up.
>
> https://patchwork.kernel.org/patch/10669601/

Thank you. I tried your patch and it has fixed the issue.

... Doug
