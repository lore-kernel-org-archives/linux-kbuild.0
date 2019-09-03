Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38524 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfICFhk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 01:37:40 -0400
Date: Mon, 2 Sep 2019 22:37:35 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to
 KBUILD_EXTRA_WARN
Message-ID: <20190903053735.GA56603@archlinux-threadripper>
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <20190831162555.31887-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190831162555.31887-2-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Sep 01, 2019 at 01:25:55AM +0900, Masahiro Yamada wrote:
> KBUILD_ENABLE_EXTRA_GCC_CHECKS started as a switch to add extra warning
> options for GCC, but now it is a historical misnomer since we use it
> also for Clang, DTC, and even kernel-doc.
> 
> Rename it to more sensible, and shorter KBUILD_EXTRA_WARN.
> 
> For the backward compatibility, KBUILD_ENABLE_EXTRA_GCC_CHECKS is still
> supported (but not advertised in the documentation).
> 
> I also fixed up 'make help', and updated the documentation.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
