Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33743 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgCXQwM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 12:52:12 -0400
Received: by mail-lf1-f65.google.com with SMTP id c20so13859377lfb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 09:52:09 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id w29sm4409208lfq.27.2020.03.24.09.52.07
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 09:52:09 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id q5so1952707lfb.13
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 09:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org>
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 24 Mar 2020 09:51:51 -0700
Message-ID: <CAHk-=wjEi4VoT8qkBhrBtdZ27shyrPwo0ETpuOdxk5anHtQqhQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Kees Cook <keescook@chromium.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "H . Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>, Jim Kukunas <james.t.kukunas@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Yuanhan Liu <yuanhan.liu@linux.intel.com>, dri-devel <dri-devel@lists.freedesktop.org>, intel-gfx@lists.freedesktop.org, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

On Tue, Mar 24, 2020 at 1:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If it is OK to queue this up to Kbuild tree,
> I will send a pull request to Linus.

Looks fine to me, assuming we didn't now get some confusion due to
duplicate patches (I think Jason got his tree added to -next already).

And yeah, that end result looks much better.

             Linus
