Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:37294 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751858AbdECPmM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 May 2017 11:42:12 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT=jbA1GCp1ztoyjF+CxQHGGgOXEVCzr7+AXKaKQX1deg@mail.gmail.com>
References: <CAK7LNAT=jbA1GCp1ztoyjF+CxQHGGgOXEVCzr7+AXKaKQX1deg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 May 2017 08:42:10 -0700
Message-ID: <CA+55aFzKj9qNgUFHZbVe0x42oLYu8v2K+8Y1yHe+DKKys3=LwQ@mail.gmail.com>
Subject: Re: [RFC] Increase Minimal GNU Make version for Linux Kernel from
 3.80 to 3.81
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Thierry Reding <treding@nvidia.com>, Ingo Molnar <mingo@kernel.org>

On Tue, May 2, 2017 at 11:46 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> From the above, I'd like to propose to increase the minimal version of
> GNU Make to 3.81.

Ack.

From earlier (uinrelated) discussion, I think we have other cases
where the "minimum recommended" may not be true (even gcc - it might
be true on some architectures with simple configs, but we've had
long-standing known issues with some more complex configurations where
the "minimum" gcc version simply didn't cut it and could generate
incorrect code).

For the GNU make case, you make a strong case of "it hasn't worked for
a while already and nobody even noticed".

                        Linus
