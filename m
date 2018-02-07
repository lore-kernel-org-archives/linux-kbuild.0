Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53862 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932112AbeBGAXd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Feb 2018 19:23:33 -0500
MIME-Version: 1.0
In-Reply-To: <1517960811-21674-1-git-send-email-psodagud@codeaurora.org>
References: <CAK7LNAQ1d5t5-UHsF1ZJ9tNLpGgbMGnDoHdht9=wNy5kLDVyxw@mail.gmail.com>
 <1517960811-21674-1-git-send-email-psodagud@codeaurora.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 7 Feb 2018 09:22:41 +0900
Message-ID: <CAK7LNASzk0awa4L6F_h9Lbyf7i0VbCkZ_O6Uuk64N_65N4e-5g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: clang: disable unused variable warnings only when constant
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, segher@kernel.crashing.org, Greg Hackmann <ghackmann@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-07 8:46 GMT+09:00 Prasad Sodagudi <psodagud@codeaurora.org>:
> Currently, GCC disables -Wunused-const-variable, but not
> -Wunused-variable, so warns unused variables if they are
> non-constant.
>
> While, Clang does not warn unused variables at all regardless of
> the const qualifier because -Wno-unused-const-variable is implied
> by the stronger option -Wno-unused-variable.
>
> Disable -Wunused-const-variable instead of -Wunused-variable so that
> GCC and Clang work in the same way.
>
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to linux-kbuild/kbuild.   Thanks!


-- 
Best Regards
Masahiro Yamada
