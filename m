Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729716AbgDWQsT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 12:48:19 -0400
Date: Thu, 23 Apr 2020 09:48:16 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2 1/4] kbuild: use $(CC_VERSION_TEXT) to evaluate
 CC_IS_GCC and CC_IS_CLANG
Message-ID: <20200423164816.GA12996@ubuntu-s3-xlarge-x86>
References: <20200423142354.312088-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423142354.312088-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Thu, Apr 23, 2020 at 11:23:51PM +0900, Masahiro Yamada wrote:
> The result of '$(CC) --version | head -n 1' is already computed by the
> top Makefile, and stored in the environment variable, CC_VERSION_TEXT.
> 
> 'echo' is probably less expensive than the two commands $(CC) and
> 'head' although this optimization is not noticeable level.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
