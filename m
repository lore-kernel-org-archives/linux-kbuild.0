Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgFZUWe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:22:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B4DC03E97B
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:22:34 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id z5so5413075pgb.6
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:22:34 -0700 (PDT)
Date: Fri, 26 Jun 2020 13:22:32 -0700
From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 2/2] kbuild: remove cc-option test of -ffreestanding
Message-ID: <202006261322.16A9F14@keescook>
References: <20200626185913.92890-1-masahiroy@kernel.org>
 <20200626185913.92890-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626185913.92890-2-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, x86@kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jun 27, 2020 at 03:59:13AM +0900, Masahiro Yamada wrote:
> Some Makefiles already pass -ffreestanding unconditionally.
> For example, arch/arm64/lib/Makefile, arch/x86/purgatory/Makefile.
> No problem report so far about hard-coding this option. So, we can
> assume all supported compilers know -ffreestanding.
> 
> I confirmed GCC 4.8 and Clang manuals document this option.
> 
> Get rid of cc-option from -ffreestanding.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
