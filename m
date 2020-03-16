Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731254AbgCPOJ6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 10:09:58 -0400
Date: Mon, 16 Mar 2020 15:07:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] x86: Enable support for ZSTD-compressed kernel
Message-ID: <20200316140745.GB4041840@kroah.com>
References: <20200316135025.7579-1-oss@malat.biz>
 <20200316135025.7579-2-oss@malat.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316135025.7579-2-oss@malat.biz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Malat <oss@malat.biz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, terrelln@fb.com, clm@fb.com, keescook@chromium.org

On Mon, Mar 16, 2020 at 02:50:25PM +0100, Petr Malat wrote:
> Signed-off-by: Petr Malat <oss@malat.biz>
> ---
>  arch/x86/Kconfig                  | 1 +
>  arch/x86/boot/compressed/Makefile | 5 ++++-
>  arch/x86/boot/compressed/misc.c   | 4 ++++
>  arch/x86/include/asm/boot.h       | 4 ++--
>  4 files changed, 11 insertions(+), 3 deletions(-)

I know I don't take patches without any changelog text, maybe other
maintainers are more lax...
