Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:50260 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752542AbdI2X7s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 19:59:48 -0400
From: Julien Grall <julien.grall@arm.com>
Subject: Fail to build Linux with O= in master
Message-ID: <cc4680bb-9e54-d449-606e-a3fa2e7a9763@arm.com>
Date: Sat, 30 Sep 2017 00:59:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello,

I have tried to build the latest master and got the following error:

42sh> make O=~/works/linux-build/aarch64-4k -C ~/works/linux                                                                                                     
make: Entering directory '/home/julgra01/works/linux'
Makefile:135: *** failed to create output directory "~/works/linux-build/aarch64-4k".  Stop.
make: Leaving directory '/home/julgra01/works/linux'

The bisector found the commit 8e9b466 "kbuild: use $(abspath ...)
instead of $(shell cd ... && /bin/pwd)".

Looking at the code, it seems that it is because the code is
now using $(realpath ...). Indeed when I replace ~ by $HOME
the kernel is now built.

I am not a Makefile expert, so I would appreciate if anyone
could suggest a patch for this.

Regards,

-- 
Julien Grall
