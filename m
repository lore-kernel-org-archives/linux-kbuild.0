Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36504 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123AbcHHRWs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Aug 2016 13:22:48 -0400
MIME-Version: 1.0
From: frank paulsen <frobnic+lkml@gmail.com>
Date: Mon, 8 Aug 2016 19:22:40 +0200
Message-ID: <CAPq9eC_WASMqBms=fYUs09vKj=DhNwEUswFbVMvaryMU2r35rA@mail.gmail.com>
Subject: [4.8-rc1] make bindeb-pkg O= fails
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

in 4.8-rc1 "make bindeb-pkg O=../debian" fails:
| find: `scripts/gcc-plugins': No such file or directory
| /usr/src/linus/scripts/package/Makefile:97: recipe for target
'bindeb-pkg' failed

this is due to a missing directory scripts/gcc-plugins if using O=

removing line 335 of scripts/package/builddeb helps:
| (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name
gcc-common.h) >> "$objtree/debian/hdrobjfiles"

this clearly isn't the right fix, but i checked it anyway and the
paket gets built.
