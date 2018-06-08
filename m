Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vulcan.kevinlocke.name ([107.191.43.88]:33522 "EHLO
        vulcan.kevinlocke.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751486AbeFHOlx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 10:41:53 -0400
Date: Fri, 8 Jun 2018 08:33:15 -0600
From: Kevin Locke <kevin@kevinlocke.name>
Subject: master regression: localmodconfig Can't open arch/$(SRCARCH)/Kconfig
Message-ID: <20180608143315.GA17356@kevinolos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org

Hello,

Running `make localmodconfig` with GNU Make 4.1 (Debian package
version 4.1-9.1) in the current torvalds master results in the
following error:

Can't open arch/$(SRCARCH)/Kconfig at ./scripts/kconfig/streamline_config.pl line 174, <$kinfile> line 8.
scripts/kconfig/Makefile:44: recipe for target 'localmodconfig' failed
make[1]: *** [localmodconfig] Error 2
Makefile:526: recipe for target 'localmodconfig' failed
make: *** [localmodconfig] Error 2

I bisected the regression to 104daea149c45cc84842ce77a9bd6436d19f3dd8.

If there is any other information I can provide or way I can assist,
or if I have reported the issue incorrectly, please let me know.

Thanks,
Kevin
