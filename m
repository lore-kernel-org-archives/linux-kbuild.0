Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:40757 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfDHRPB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Apr 2019 13:15:01 -0400
Received: by mail-ua1-f67.google.com with SMTP id b8so4562477uaq.7
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Apr 2019 10:15:00 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id o1sm6829269vsd.21.2019.04.08.10.14.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 10:14:58 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id d8so8071014vsp.2
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Apr 2019 10:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190308132701.133598-1-glider@google.com> <20190308132701.133598-3-glider@google.com>
 <497b1201-b2ae-5e0c-d191-ff1830d92fc1@redhat.com>
In-Reply-To: <497b1201-b2ae-5e0c-d191-ff1830d92fc1@redhat.com>
From: Kees Cook <keescook@chromium.org>
Date: Mon, 8 Apr 2019 10:14:45 -0700
Message-ID: <CAGXu5jJUWKiyW-_ygHpg9rJc7wQ2XTzjH71CtJfdefLu2zZHEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] initmem: introduce CONFIG_INIT_ALL_HEAP
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Alexander Potapenko <glider@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module <linux-security-module@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitry Vyukov <dvyukov@google.com>, Sandeep Patil <sspatil@android.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>

On Mon, Apr 8, 2019 at 9:43 AM Laura Abbott <labbott@redhat.com> wrote:
> I've looked at doing something similar in the past (failing to find
> the thread this morning...) and while this will work, it has pretty
> serious performance issues. It's not actually the poisoning which
> is expensive but that turning on debugging removes the cpu slab
> which has significant performance penalties.
>
> I'd rather go back to the proposal of just poisoning the slab
> at alloc/free without using SLAB_POISON.

I still agree this would make the most sense. Fundamentally it's not a
debugging feature.

-- 
Kees Cook
