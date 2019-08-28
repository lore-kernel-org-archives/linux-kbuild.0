Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53017 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfH1OWL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 10:22:11 -0400
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <CA+icZUWigJkh-VtJc4=xE06oMgE=ci2Mfdo2JaDv0fth8PKH+A@mail.gmail.com> <CA+icZUUhhOLfOgwoKP4nKOdPakNJF7XafJ09ERP6r7dOUduMsg@mail.gmail.com>
In-Reply-To: <CA+icZUUhhOLfOgwoKP4nKOdPakNJF7XafJ09ERP6r7dOUduMsg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 28 Aug 2019 16:21:58 +0200
Message-ID: <CA+icZUUSVRURu-jQAnVnZwPp0qiWpostDz+WkTjxx8zunVKBgw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: refactor scripts/Makefile.extrawarn
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <michal.lkml@markovi.net>, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>, linux-kernel@vger.kernel.org

> build-time checking. For more details see <Documentation/kbuild/kbuild.rst>.

Grrr.

s/ Documentation/kbuild/kbuild.rst / scripts/Makefile.extrawarn

- Sedat -
