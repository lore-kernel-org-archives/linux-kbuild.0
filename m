Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp04.smtpout.orange.fr ([80.12.242.126]:48249 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722Ab1JBLO3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 2 Oct 2011 07:14:29 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: kbuild/kconfig for non-Linux projects
Date: Sun, 2 Oct 2011 13:06:52 +0200
References: <4E882F41.6070603@Kriegisch.name> <4E88436E.3070309@Kriegisch.name>
In-Reply-To: <4E88436E.3070309@Kriegisch.name>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201110021306.53151.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Kriegisch <Alexander@kriegisch.name>
Cc: linux-kbuild@vger.kernel.org

Alexander, All,

On Sunday 02 October 2011 12:56:46 Alexander Kriegisch wrote:
> Okay, another developer in our project found the place where to 
> configure this (Arnaud, please correct us if this is wrong):
> 
> 
> --- scripts/kconfig/lkc.h
> +++ scripts/kconfig/lkc.h
> @@ -42,7 +42,7 @@
>   #define N_(text) (text)
> 
>   #ifndef CONFIG_
> -#define CONFIG_ "CONFIG_"
> +#define CONFIG_ ""
>   #endif
> 
>   #define TF_COMMAND	0x0001

The proper way to do it is to pass it to the compiler with the -D option:
    -DCONFIG_=\"\"

You should put it in your Makefile, in the proper CFLAGS (or CPPFLAGS).

If you change the code, you may have /merge/ issues later if you have to
resync again.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
