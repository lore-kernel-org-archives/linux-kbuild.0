Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f190.google.com ([209.85.221.190]:37095 "EHLO
	mail-qy0-f190.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758559AbZE0KAs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 27 May 2009 06:00:48 -0400
Received: by qyk28 with SMTP id 28so4234020qyk.33
        for <linux-kbuild@vger.kernel.org>; Wed, 27 May 2009 03:00:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243324987-17840-1-git-send-email-crq@hera.kernel.org>
References: <1243324987-17840-1-git-send-email-crq@hera.kernel.org>
Date: Wed, 27 May 2009 18:00:46 +0800
Message-ID: <91b13c310905270300i7591ac44yd2f4877a13391c37@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: remove extra ifdef/endif of top Makefile
From: Cheng Renquan <crquan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cheng Renquan <crq@hera.kernel.org>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Andrew Morton <akpm@linux-foundation.org>

A better description:

The GNU make's origin function know undefined variable well,
so the outer ifdef/endif conditional checking is unneeded.

From `info make` documentation, origin will return

  `undefined'
     if VARIABLE was never defined.
  `command line'
     if VARIABLE was defined on the command line.
   ...

Therefore, $(origin V) will get a value anyway, killing ifdef/endif is
viable and safe.

Furthermore, I've checked the minimal requirements from
Documentation/Changes is GNU make 3.79.1, and that version of GNU make
has support of origin function well already, so now it's safe to kill
the outer conditional checking, without upgrading the minimal
requirements.

Signed-off-by: Cheng Renquan <crq@kernel.org>

> ---
>  Makefile |   26 +++++++++-----------------
>  1 files changed, 9 insertions(+), 17 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9b2b58c..3798f26 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -35,10 +35,8 @@ MAKEFLAGS += -rR --no-print-directory
>  # To put more focus on warnings, be less verbose as default
>  # Use 'make V=1' to see the full commands
>
> -ifdef V
> -  ifeq ("$(origin V)", "command line")
> -    KBUILD_VERBOSE = $(V)
> -  endif
> +ifeq ("$(origin V)", "command line")
> +  KBUILD_VERBOSE = $(V)
>  endif
>  ifndef KBUILD_VERBOSE
>   KBUILD_VERBOSE = 0
> @@ -54,10 +52,8 @@ endif
>  # See the file "Documentation/sparse.txt" for more details, including
>  # where to get the "sparse" utility.
>
> -ifdef C
> -  ifeq ("$(origin C)", "command line")
> -    KBUILD_CHECKSRC = $(C)
> -  endif
> +ifeq ("$(origin C)", "command line")
> +  KBUILD_CHECKSRC = $(C)
>  endif
>  ifndef KBUILD_CHECKSRC
>   KBUILD_CHECKSRC = 0
> @@ -69,12 +65,10 @@ endif
>  ifdef SUBDIRS
>   KBUILD_EXTMOD ?= $(SUBDIRS)
>  endif
> -ifdef M
> -  ifeq ("$(origin M)", "command line")
> -    KBUILD_EXTMOD := $(M)
> -  endif
> -endif
>
> +ifeq ("$(origin M)", "command line")
> +  KBUILD_EXTMOD := $(M)
> +endif
>
>  # kbuild supports saving output files in a separate directory.
>  # To locate output files in a separate directory two syntaxes are supported.
> @@ -98,10 +92,8 @@ ifeq ($(KBUILD_SRC),)
>
>  # OK, Make called in directory where kernel src resides
>  # Do we want to locate output files in a separate directory?
> -ifdef O
> -  ifeq ("$(origin O)", "command line")
> -    KBUILD_OUTPUT := $(O)
> -  endif
> +ifeq ("$(origin O)", "command line")
> +  KBUILD_OUTPUT := $(O)
>  endif
>
>  # That's our default target when none is given on the command line
