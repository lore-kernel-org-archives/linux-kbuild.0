Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42040 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgBAS2X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 13:28:23 -0500
Received: by mail-lj1-f196.google.com with SMTP id d10so10462225ljl.9
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Feb 2020 10:28:21 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id w29sm8298824ljd.99.2020.02.01.10.28.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2020 10:28:19 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id t23so7021609lfk.6
        for <linux-kbuild@vger.kernel.org>; Sat, 01 Feb 2020 10:28:19 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
In-Reply-To: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 1 Feb 2020 10:28:03 -0800
Message-ID: <CAHk-=wj1K6DR65Vg0-KreeRdK7AKhJ3XwbJ7Gqk5L0=QkKfvDg@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.6-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Jan 31, 2020 at 8:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - add 'yes2modconfig' and 'mod2yesconfig' targets

It would have been appreciated if you'd explain what the point of those are.

Yes, I looked into the individual commits to check, but it wasn't
exactly obvious why anybody would ever use this.

                    Linus
