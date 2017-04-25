Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:60629 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1952001AbdDYVaK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Apr 2017 17:30:10 -0400
MIME-Version: 1.0
In-Reply-To: <20170424200458.74416-1-mka@chromium.org>
References: <20170424200458.74416-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 26 Apr 2017 06:30:04 +0900
Message-ID: <CAK7LNARJN444jouow3+j7uxpVeFJ+EmkcEmxW_U_Ne0NL+rdug@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: Add support to generate LLVM assembly files
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Behan Webster <behanw@converseincode.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

2017-04-25 5:04 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> Add rules to kbuild in order to generate LLVM assembly files with the .ll
> extension when using clang.
>
>   # from c code
>   make CC=3Dclang kernel/pid.ll
>
> From: Vin=C3=ADcius Tinti <viniciustinti@gmail.com>
> Signed-off-by: Vin=C3=ADcius Tinti <viniciustinti@gmail.com>
> Signed-off-by: Behan Webster <behanw@converseincode.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in v4:
> - changed 'bitcode' to 'assembly'
> - removed rule for creating LLVM assembly from machine assembly
> - added .ll files to clean rule
> - corrected example command in commit message


Applied to linux-kbuild/kbuild.  Thanks!


--=20
Best Regards
Masahiro Yamada
