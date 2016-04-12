Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:32912 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757184AbcDLTrj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Apr 2016 15:47:39 -0400
Received: by mail-wm0-f42.google.com with SMTP id f198so201280796wme.0
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Apr 2016 12:47:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160412205209.1b7f4b610674d22ac3e59f00@gmail.com>
References: <20160407231023.5f1307ffc79f0cdd880eedb7@gmail.com>
	<20160412174607.GA92143@davidb.org>
	<CAGXu5jKPqkG52ckYAJPscySfyg+YHEVsMvPq-05YM4A3Ypx4Kg@mail.gmail.com>
	<20160412205209.1b7f4b610674d22ac3e59f00@gmail.com>
Date: Tue, 12 Apr 2016 12:47:37 -0700
Message-ID: <CAGXu5j+Sw6fKU4VgU6ancEqnqQfJuf_YDuPt4UWwE8ou1t8KMw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Introduce GCC plugin infrastructure
From: Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Emese Revfy <re.emese@gmail.com>
Cc: David Brown <david.brown@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, PaX Team <pageexec@freemail.hu>, Brad Spengler <spender@grsecurity.net>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Fengguang Wu <fengguang.wu@intel.com>, Dmitry Vyukov <dvyukov@google.com>, LKML <linux-kernel@vger.kernel.org>

On Tue, Apr 12, 2016 at 11:52 AM, Emese Revfy <re.emese@gmail.com> wrote:
> On Tue, 12 Apr 2016 11:27:52 -0700
> Kees Cook <keescook@chromium.org> wrote:
>
>> Emese, were you thinking of doing the initify plugin next after this
>> infrastructure lands?
>
> I already started to work on the entropy plugin but after that I can work on initify.

Ah yes, thanks! I'd forgotten you'd mentioned the entropy plugin
previously. Great!

-Kees

-- 
Kees Cook
Chrome OS & Brillo Security
