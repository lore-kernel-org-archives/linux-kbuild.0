Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34538 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgBPTzq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 14:55:46 -0500
Date: Sun, 16 Feb 2020 12:55:43 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: remove cc-option switch from -Wframe-larger-than=
Message-ID: <20200216195543.GA54314@ubuntu-m2-xlarge-x86>
References: <20200216151936.23778-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200216151936.23778-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, clang-built-linux@googlegroups.com

On Mon, Feb 17, 2020 at 12:19:36AM +0900, Masahiro Yamada wrote:
> This CONFIG option was added by commit 35bb5b1e0e84 ("Add option to
> enable -Wframe-larger-than= on gcc 4.4"). At that time, the cc-option
> check was needed.
> 
> According to Documentation/process/changes.rst, the current minimal
> supported version of GCC is 4.6, so you can assume GCC supports it.
> Clang supports it as well.
> 
> Remove the cc-option switch and redundant comments.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
