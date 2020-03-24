Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45197 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgCXT7G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 15:59:06 -0400
Received: by mail-pl1-f195.google.com with SMTP id b9so7852313pls.12
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 12:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200324161539.7538-1-masahiroy@kernel.org> <20200324161539.7538-3-masahiroy@kernel.org>
 <CAKwvOdkjiyyt8Ju2j2O4cm1sB34rb_FTgjCRzEiXM6KL4muO_w@mail.gmail.com>
In-Reply-To: <CAKwvOdkjiyyt8Ju2j2O4cm1sB34rb_FTgjCRzEiXM6KL4muO_w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Mar 2020 12:58:54 -0700
Message-ID: <CAKwvOdmWqAUhL5DRg9oQPXzFtogK-0Q-VZ=FWf=Cjm-RJgR4sw@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: remove AS variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, Mar 24, 2020 at 12:38 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> consistent in this regard (and not using the compiler as the driver),

Ah, the preprocessor; we need to preprocess the .S files, .s files are
fine (though we have .lds.S files that are not `-x
assembler-with-cpp`)

-- 
Thanks,
~Nick Desaulniers
