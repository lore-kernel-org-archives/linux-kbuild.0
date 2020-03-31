Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2130.oracle.com ([156.151.31.86]:52490 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730328AbgCaJQi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 05:16:38 -0400
From: Vegard Nossum <vegard.nossum@oracle.com>
Subject: single target builds are broken
Message-ID: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
Date: Tue, 31 Mar 2020 11:16:30 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org


Hi,

I often run 'make foo/bar.o' as part of my workflow, even when bar.o is
not specified in any kernel makefile, and this has worked just fine for
years.

This is broken after commit 394053f4a4b3e3eeeaa67b67fc886a9a75bd9e4d
(kbuild: make single targets work more correctly) and just gives an error:

$ make kernel/test.o
   CALL    scripts/checksyscalls.sh
   CALL    scripts/atomic/check-atomics.sh
   DESCEND  objtool
make[2]: *** No rule to make target 'kernel/test.o'.  Stop.
scripts/Makefile.build:502: recipe for target '__build' failed
make[1]: *** [__build] Error 2
Makefile:1670: recipe for target 'kernel' failed
make: *** [kernel] Error 2

For top-level objects (e.g. 'make bar.o') the situation is even worse,
since make exits with status 0 without building anything :-/

Is there any chance we can get this back? It was super useful for me.


Vegard
