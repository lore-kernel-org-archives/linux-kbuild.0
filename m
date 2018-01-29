Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:59615 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751833AbeA2X5Y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jan 2018 18:57:24 -0500
Date: Mon, 29 Jan 2018 17:57:09 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] kbuild: clang: Disable -Wunused-const-variable warnings
Message-ID: <20180129235708.GG21977@gate.crashing.org>
References: <fd6fdda6c0080e72598eabd2c88d7df6@codeaurora.org> <1517245680-3361-1-git-send-email-psodagud@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1517245680-3361-1-git-send-email-psodagud@codeaurora.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: gregkh@linuxfoundation.org, ghackmann@google.com, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Prasad,

On Mon, Jan 29, 2018 at 09:08:00AM -0800, Prasad Sodagudi wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -698,7 +698,6 @@ KBUILD_CFLAGS += $(stackp-flag)
>  
>  ifeq ($(cc-name),clang)
>  KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
>  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
> @@ -716,9 +715,9 @@ else
>  # These warnings generated too much noise in a regular build.
>  # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-but-set-variable)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  endif
>  
> +KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
>  ifdef CONFIG_FRAME_POINTER
>  KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  else

Ah, much more obvious now, thanks :-)


Segher
