Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50508 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbdKNIKp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Nov 2017 03:10:45 -0500
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Nov 2017 17:09:51 +0900
Message-ID: <CAK7LNATW91vf5Sa-vvJ7rLRNt+KRKPB=E5H_EOtOUgCB4WYmUA@mail.gmail.com>
Subject: Coccinelle: badzero.cocci failure
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: cocci@systeme.lip6.fr
Cc: Nicolas Palix <nicolas.palix@imag.fr>, Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Coccinelle developers,


When I was working on my patch, I was hit by another issue.

badzero.cocci failed on all modes.


Can you take a look at it, please?



I tried to use DEBUG_FILE and dump the log,
but I could not get a clue of the cause of the failure.

My spatch version is:
spatch version 1.0.6-00345-g2ca0bef compiled with OCaml version 4.02.3




The following is the result on my PC:


$ make  coccicheck  COCCI=scripts/coccinelle/null/badzero.cocci  MODE=report

Please check for false positives in the output before submitting a patch.
When using "patch" mode, carefully review the patch before submitting it.

coccicheck failed
$ make  coccicheck  COCCI=scripts/coccinelle/null/badzero.cocci  MODE=patch

Please check for false positives in the output before submitting a patch.
When using "patch" mode, carefully review the patch before submitting it.

coccicheck failed
$ make  coccicheck  COCCI=scripts/coccinelle/null/badzero.cocci  MODE=context

Please check for false positives in the output before submitting a patch.
When using "patch" mode, carefully review the patch before submitting it.

coccicheck failed
$ make  coccicheck  COCCI=scripts/coccinelle/null/badzero.cocci  MODE=org

Please check for false positives in the output before submitting a patch.
When using "patch" mode, carefully review the patch before submitting it.

coccicheck failed
$ make  coccicheck  COCCI=scripts/coccinelle/null/badzero.cocci
MODE=report  DEBUG_FILE=cocci-debug.txt

Please check for false positives in the output before submitting a patch.
When using "patch" mode, carefully review the patch before submitting it.

coccicheck failed
$ cat cocci-debug.txt
/home/masahiro/bin/spatch -D report --no-show-diff --very-quiet
--cocci-file scripts/coccinelle/null/badzero.cocci --dir . -I
./arch/x86/include -I ./arch/x86/include/generated -I ./include -I
./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I
./include/uapi -I ./include/generated/uapi --include
./include/linux/kconfig.h --jobs 8 --chunksize 1
Fatal error: exception
Yes_prepare_ocamlcocci.LinkFailure("/tmp/ocaml_cocci_18c9f9.cmxs")






-- 
Best Regards
Masahiro Yamada
