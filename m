Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail2.lawo.de ([80.149.95.33]:52957 "EHLO mail2.lawo.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933064AbbKROu1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Nov 2015 09:50:27 -0500
Message-ID: <1447858006.4104.38.camel@alcnetworx.de>
Subject: out-of-tree build with external module
From: Tino Mettler <tino.mettler@alcnetworx.de>
Date: Wed, 18 Nov 2015 15:46:46 +0100
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi,

I want to build an external module out-of-tree. I tried this:

make -C <kernel-source> KBUILD_OUTPUT=<out-of-tree-path> M=<external-module> modules

However, the result is put to the source path specified by M=, whereas a
normal kernel build (without M=) but otherwise same parameters puts the
result to <out-of-tree-path>.

Any hints what I'm doing wrong?

Regards,
Tino


