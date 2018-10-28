Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:42556 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbeJ2FOD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Oct 2018 01:14:03 -0400
Received: by mail-lf1-f68.google.com with SMTP id q6-v6so4483224lfh.9
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Oct 2018 13:28:18 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id p13-v6sm1824133ljh.31.2018.10.28.13.28.15
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Oct 2018 13:28:15 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id u21-v6so5789220lja.8
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Oct 2018 13:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20181028172401.GA41102@beast>
In-Reply-To: <20181028172401.GA41102@beast>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 28 Oct 2018 13:27:59 -0700
Message-ID: <CAHk-=wjrKjE_RsPmGv70Z1kN8tk2Rqv0EZczBB0BmcdPpqud1w@mail.gmail.com>
Subject: Re: [GIT PULL] VLA removal for v4.20-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, airlied@linux.ie, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com, Nick Desaulniers <ndesaulniers@google.com>

On Sun, Oct 28, 2018 at 10:24 AM Kees Cook <keescook@chromium.org> wrote:
>
> Please pull these VLA removal changes for v4.20-rc1.

Pulled,

                   Linus
