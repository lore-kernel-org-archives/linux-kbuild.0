Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbgD0IGG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 04:06:06 -0400
Date: Mon, 27 Apr 2020 09:06:00 +0100
From: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] kbuild: remove unused AS assignment
Message-ID: <20200427080600.GC11787@willie-the-truck>
References: <20200427003019.2401592-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427003019.2401592-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, Nathan Chancellor <natechancellor@gmail.com>, Nathan Huckleberry <nhuck15@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org

On Mon, Apr 27, 2020 at 09:30:19AM +0900, Masahiro Yamada wrote:
> $(AS) is not used anywhere, hence commit aa824e0c962b ("kbuild: remove
> AS variable") killed it.
> 
> Remove the left-over code in arch/{arm,arm64}/Makefile.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/arm/Makefile   | 2 --
>  arch/arm64/Makefile | 2 --
>  2 files changed, 4 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

(If you post the arm64 part as a separate patch, I can pick it up)

Will
