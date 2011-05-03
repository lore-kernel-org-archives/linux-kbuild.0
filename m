Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:40677 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962Ab1ECWAc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 May 2011 18:00:32 -0400
From: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Subject: Re: [PATCH] Make it possible to override INSTALL_HDR_PATH
Date: Wed, 4 May 2011 00:00:29 +0200
References: <20110503214612.GA26479@dev1756.snc6.facebook.com>
In-Reply-To: <20110503214612.GA26479@dev1756.snc6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201105040000.29351.yann.morin.1998@anciens.enib.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arun Sharma <asharma@fb.com>

Arun, All,

On Tuesday 03 May 2011 23:46:12 Arun Sharma wrote:
> diff --git a/Makefile b/Makefile
> index cb715df..ec68886 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1009,7 +1009,7 @@ firmware_install: FORCE
>  # Kernel headers
>  
>  #Default location for installed headers
> -export INSTALL_HDR_PATH = $(objtree)/usr
> +export INSTALL_HDR_PATH ?= $(objtree)/usr
>  
>  hdr-inst := -rR -f $(srctree)/scripts/Makefile.headersinst obj
>  

Already works for me here in 2.6.38.5:
  $ head -n 5 Makefile
  VERSION = 2
  PATCHLEVEL = 6
  SUBLEVEL = 38
  EXTRAVERSION = .5
  NAME = Flesh-Eating Bats with Fangs
  $ rm -rf FOO
  $ mkdir FOO
  $ make INSTALL_HDR_PATH=$(pwd)/FOO ARCH=x86 headers_install
  $ ls -l FOO
  total 4
  drwxr-xr-x 12 ymorin users 4096 2011-05-03 23:57 include
  $ cat FOO/include/linux/version.h
  #define LINUX_VERSION_CODE 132646
  #define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))
  $ make --version | head -n 1
  GNU Make 3.81

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
