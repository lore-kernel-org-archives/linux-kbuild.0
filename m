Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34652 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgDDECo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Apr 2020 00:02:44 -0400
Date: Fri, 3 Apr 2020 21:02:41 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
Message-ID: <20200404040241.GA41628@ubuntu-m2-xlarge-x86>
References: <202004020117.6E434C035@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202004020117.6E434C035@keescook>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Thu, Apr 02, 2020 at 01:18:37AM -0700, Kees Cook wrote:
> When doing Clang builds of the kernel, it is possible to link with
> either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> discover this from a running kernel. Add the "$LD -v" output to
> /proc/version.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

With this patch + Masahiro's fold in:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
