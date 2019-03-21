Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f194.google.com ([209.85.221.194]:44477 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbfCURsH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Mar 2019 13:48:07 -0400
Received: by mail-vk1-f194.google.com with SMTP id q189so1550086vkq.11
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Mar 2019 10:48:06 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id d73sm5498839vsc.24.2019.03.21.10.48.04
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Mar 2019 10:48:04 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id z18so4186778vso.7
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Mar 2019 10:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190308132701.133598-1-glider@google.com> <20190308132701.133598-2-glider@google.com>
 <CAG_fn=U6Rvg9S0AxLun0oHVx9i=JFc0Lzb+rvkiQn1sTHd-caA@mail.gmail.com>
In-Reply-To: <CAG_fn=U6Rvg9S0AxLun0oHVx9i=JFc0Lzb+rvkiQn1sTHd-caA@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 21 Mar 2019 10:47:52 -0700
Message-ID: <CAGXu5jLjkBTTg0k32OPSM9TY9XorU_iYKUDL0L1aYWfhuREy1w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] initmem: introduce CONFIG_INIT_ALL_MEMORY and CONFIG_INIT_ALL_STACK
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Potapenko <glider@google.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module <linux-security-module@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitriy Vyukov <dvyukov@google.com>, Sandeep Patil <sspatil@android.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>

On Wed, Mar 20, 2019 at 7:44 AM Alexander Potapenko <glider@google.com> wrote:
> A friendly ping.
> Please let me know if I should wait for any upcoming changes to
> CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL.

Hi! Sorry for the delay -- between the merge window and travel, I'm
still a couple weeks behind. I should be able to look more closely at
this late next week.

-- 
Kees Cook
