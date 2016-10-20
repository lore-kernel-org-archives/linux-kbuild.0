Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nbfkord-smmo02.seg.att.com ([209.65.160.78]:32620 "EHLO
        nbfkord-smmo02.seg.att.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1758550AbcJTPAo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Oct 2016 11:00:44 -0400
Subject: Re: [PATCH 1/4] kconfig: introduce the "imply" keyword
References: <1476920573-14384-1-git-send-email-nicolas.pitre@linaro.org>
 <1476920573-14384-2-git-send-email-nicolas.pitre@linaro.org>
From: Edward Cree <ecree@solarflare.com>
Message-ID: <44f95579-6c35-7592-08e3-d8dbb13026b2@solarflare.com>
Date: Thu, 20 Oct 2016 15:52:04 +0100
MIME-Version: 1.0
In-Reply-To: <1476920573-14384-2-git-send-email-nicolas.pitre@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, John Stultz <john.stultz@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Yann E MORIN <yann.morin.1998@free.fr>
Cc: Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 20/10/16 00:42, Nicolas Pitre wrote:
> diff --git a/Documentation/kbuild/kconfig-language.txt b/Documentation/kbuild/kconfig-language.txt
> index 069fcb3eef..c96127f648 100644
> --- a/Documentation/kbuild/kconfig-language.txt
> +++ b/Documentation/kbuild/kconfig-language.txt
> @@ -113,6 +113,33 @@ applicable everywhere (see syntax).
>       That will limit the usefulness but on the other hand avoid
>       the illegal configurations all over.
>
> +- weak reverse dependencies: "imply" <symbol> ["if" <expr>]
> +  This is similar to "select" as it enforces a lower limit on another
> +  symbol except that the "implied" config symbol's value may still be
> +  set to n from a direct dependency or with a visible prompt.
> +  Given the following example:
> +
> +  config FOO
> +     tristate
> +     imply BAZ
> +
> +  config BAZ
> +     tristate
> +     depends on BAr
> +
> +  The following values are possible:
> +
> +     FOO             BAR             BAR's default   choice for BAZ
Should the third column not be "BAZ's default"?
> +     --------------- --------------- --------------- --------------
> +     n               y               n               N/m/y
> +     m               y               m               M/y/n
> +     y               y               y               Y/n
> +     y               n               *               N
Also, I don't think having any FOO=y should preclude BAZ=m.  Suppose both
FOO and FOO2 imply BAZ, FOO=y and FOO2=m.  Then if BAZ-features are only
desired for driver FOO2, BAz=m makes sense.
There is also the case of drivers with the ability to detect at runtime
whether BAZ is present, rather than making the decision at build time, but
I'm not sure how common that is.

-Ed
The information contained in this message is confidential and is intended for the addressee(s) only. If you have received this message in error, please notify the sender immediately and delete the message. Unless you are an addressee (or authorized to receive for an addressee), you may not use, copy or disclose to anyone this message or any information contained in this message. The unauthorized use, disclosure, copying or alteration of this message is strictly prohibited.
