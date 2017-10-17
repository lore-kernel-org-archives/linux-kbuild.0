Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:48115 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753057AbdJQLAu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 07:00:50 -0400
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 17 Oct 2017 13:00:48 +0200
Message-ID: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
Subject: more build problems with "Makefile: move stackprotector availability
 out of Kconfig"
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Kees,

On my test box, current linux-next kernels fail to build due to the
patch that introduces CONFIG_CC_STACKPROTECTOR_AUTO, with my mainline
gcc
builds up to gcc-5.5.0. gcc-6 and higher work fine, as
scripts/gcc-x86_64-has-stack-protector.sh returns 'y' for those.

Using the compilers provided by Ubuntu (4.6/4.7/4.8/4.9), everything
also works as expected, so my interpretation is that mainline gcc did
not enable the stack protector until gcc-6, while distributions did.

Do you agree with that interpretation?

If yes, is there anything we can do about it? I can probably rebuild
my collection of x86 compilers to enable stackprotector if necessary,
but I wonder how many other people will run into the same problem.

      Arnd
