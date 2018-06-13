Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:40135 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935524AbeFMQFS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 12:05:18 -0400
MIME-Version: 1.0
References: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
 <CA+55aFyxY9f9_eGv3CvA0zwzo8K5WeNbNPDFuyhtCrzRyic85A@mail.gmail.com> <CA+55aFy2KEzTiF=0nG8_RFoPpycaqc=n-hf-mQSbKotMzYJG-w@mail.gmail.com>
In-Reply-To: <CA+55aFy2KEzTiF=0nG8_RFoPpycaqc=n-hf-mQSbKotMzYJG-w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 13 Jun 2018 09:05:05 -0700
Message-ID: <CA+55aFwpobon5SH8XO8r+GKPz5=HzzzNKgr0kjU9+VU8kA4Z8A@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for 4.18 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

On Wed, Jun 13, 2018 at 9:03 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This is a pretty dangerous silent change.

I've merged it despite this, but I think we need to revisit the whole
issue. Possibly by just renaming that option, so that people _see_ the
change and get asked about it.

              Linus
