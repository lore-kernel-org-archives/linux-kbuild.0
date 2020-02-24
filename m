Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:57134 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbgBXVUe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 16:20:34 -0500
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
References: <20200224174129.2664-1-ndesaulniers@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ab366833-3f9f-0311-3c06-d48b7dc9655f@infradead.org>
Date: Mon, 24 Feb 2020 13:20:30 -0800
MIME-Version: 1.0
In-Reply-To: <20200224174129.2664-1-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, corbet@lwn.net, masahiroy@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com

On 2/24/20 9:41 AM, Nick Desaulniers wrote:
> Added to kbuild documentation. Provides more official info on building
> kernels with Clang and LLVM than our wiki.
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Documentation/kbuild/index.rst |  1 +
>  Documentation/kbuild/llvm.rst  | 80 ++++++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/kbuild/llvm.rst
> 
> diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
> index 0f144fad99a6..3882bd5f7728 100644
> --- a/Documentation/kbuild/index.rst
> +++ b/Documentation/kbuild/index.rst
> @@ -19,6 +19,7 @@ Kernel Build System
>  
>      issues
>      reproducible-builds
> +    llvm
>  
>  .. only::  subproject and html
>  
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> new file mode 100644
> index 000000000000..68ae022aebc0
> --- /dev/null
> +++ b/Documentation/kbuild/llvm.rst
> @@ -0,0 +1,80 @@
> +==============================
> +Building Linux with Clang/LLVM
> +==============================
> +
> +This document covers how to build the Linux kernel with Clang and LLVM
> +utilities.
> +
> +About
> +-----
> +
> +The Linux kernel has always traditionally been compiled with GNU toolchains
> +such as GCC and binutils. On going work has allowed for `Clang

                             Ongoing

> +<https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
> +used as viable substitutes. Distributions such as `Android
> +<https://www.android.com/>`_, `ChromeOS
> +<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
> +<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
> +collection of toolchain components implemented in terms of C++ objects
> +<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
> +supports C and the GNU C extensions required by the kernel, and is pronounced
> +"klang," not "see-lang."


Thanks for the info.

-- 
~Randy
