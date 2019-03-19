Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:34404 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726703AbfCSImG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Mar 2019 04:42:06 -0400
From: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH v2] kbuild: add workaround for Debian make-kpkg
References: <1552036419-924-1-git-send-email-yamada.masahiro@socionext.com>
        <mvm7ecwqz87.fsf@suse.de>
        <CAK7LNARKGYm0fO1BR83RdCWtxNj4dWBAVAw-JHXxCrRON986kw@mail.gmail.com>
Date: Tue, 19 Mar 2019 09:42:04 +0100
In-Reply-To: <CAK7LNARKGYm0fO1BR83RdCWtxNj4dWBAVAw-JHXxCrRON986kw@mail.gmail.com>
        (Masahiro Yamada's message of "Tue, 19 Mar 2019 13:09:43 +0900")
Message-ID: <mvmo967ntlv.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Manoj Srivastava <srivasta@debian.org>, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Manoj Srivastava <manoj.srivastava.1962@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mär 19 2019, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> How about this patch?
> https://patchwork.kernel.org/patch/10858809/

Thanks, this makes it work again.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
