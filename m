Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:53606 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbfGQRXG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 13:23:06 -0400
MIME-Version: 1.0
References: <20190717160626.26293-1-seth.forshee@canonical.com>
In-Reply-To: <20190717160626.26293-1-seth.forshee@canonical.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jul 2019 02:22:02 +0900
Message-ID: <CAK7LNASPqp6eK_3bx2PPQ6nUyh=7RBhABNxNY0Yw7vqdn=Ej1g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add -fcf-protection=none when using retpoline flags
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Josh Poimboeuf <jpoimboe@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jul 18, 2019 at 1:07 AM Seth Forshee <seth.forshee@canonical.com> wrote:
>
> The gcc -fcf-protection=branch option is not compatible with
> -mindirect-branch=thunk-extern. The latter is used when
> CONFIG_RETPOLINE is selected, and this will fail to build with
> a gcc which has -fcf-protection=branch enabled by default. Adding
> -fcf-protection=none when building with retpoline enabled
> prevents such build failures.
>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>

Applied to linux-kbuild. Thanks.

-- 
Best Regards
Masahiro Yamada
