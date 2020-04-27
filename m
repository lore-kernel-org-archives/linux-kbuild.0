Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726084AbgD0CKx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Apr 2020 22:10:53 -0400
Date: Sun, 26 Apr 2020 19:10:50 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild: remove unused AS assignment
Message-ID: <20200427021050.GA27787@ubuntu-s3-xlarge-x86>
References: <20200427003019.2401592-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427003019.2401592-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, Nathan Huckleberry <nhuck15@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org

On Mon, Apr 27, 2020 at 09:30:19AM +0900, Masahiro Yamada wrote:
> $(AS) is not used anywhere, hence commit aa824e0c962b ("kbuild: remove
> AS variable") killed it.
> 
> Remove the left-over code in arch/{arm,arm64}/Makefile.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
